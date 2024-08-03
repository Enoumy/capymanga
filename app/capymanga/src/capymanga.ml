open! Core
open Bonsai
open Bonsai.Let_syntax
open Capytui
module Catpuccin = Capytui_catpuccin

let bg = Capytui_catpuccin.Crust

let render_instruction key action =
  let%sub text = Capytui_catpuccin.color Text in
  let%sub subtext = Capytui_catpuccin.color Subtext0 in
  let%sub crust = Capytui_catpuccin.color bg in
  let%arr text = text
  and subtext = subtext
  and crust = crust in
  Node.hcat
    [ Node.text
        ~attrs:
          [ Attr.bold
          ; Attr.foreground_color text
          ; Attr.background_color crust
          ]
        key
    ; Node.text ~attrs:[ Attr.background_color crust ] " "
    ; Node.text
        ~attrs:[ Attr.foreground_color subtext; Attr.background_color crust ]
        action
    ]
;;

let instructions =
  let%sub instructions =
    [ "/", "Search"; "j", "Down"; "k", "Up" ]
    |> List.map ~f:(fun (key, action) -> render_instruction key action)
    |> Computation.all
  in
  let%sub text = Text.component in
  let%arr instructions = instructions
  and text = text in
  Node.hcat (List.intersperse ~sep:(text "  ") instructions)
;;

let backdrop =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub crust = Capytui_catpuccin.color Crust in
  let%arr { height; width } = dimensions
  and crust = crust in
  Node.vcat
    (List.init height ~f:(fun _ ->
       Node.text
         ~attrs:[ Attr.background_color crust ]
         (String.make width ' ')))
;;

let global_key_handler
  ~textbox_handler
  ~table_handler
  ~textbox_is_focused
  ~set_textbox_focus
  =
  let%sub callback =
    let%arr textbox_is_focused = textbox_is_focused
    and textbox_handler = textbox_handler
    and set_textbox_focus = set_textbox_focus
    and table_handler = table_handler in
    fun event ->
      if textbox_is_focused
      then (
        match event with
        | `Key (`Escape, []) | `Key (`Enter, []) -> set_textbox_focus false
        | _ -> textbox_handler event)
      else (
        match event with
        | `Key (`ASCII '/', []) | `Key (`ASCII ('s' | 'S'), [ `Ctrl ]) ->
          set_textbox_focus true
        | _ -> table_handler event)
  in
  Capytui.listen_to_events callback
;;

let content =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub spinner =
    let%sub is_something_loading = Loading_state.is_something_loading in
    match%sub is_something_loading with
    | false -> Bonsai.const Node.none
    | true -> Spinner.component ~kind:Spinner.Kind.Dot (Value.return "")
  in
  let%sub textbox_is_focused, set_textbox_focus = Bonsai.state false in
  let%sub { view = textbox_view
          ; string = manga_title
          ; handler = textbox_handler
          }
    =
    let%sub base = Catpuccin.color Base in
    let%sub extra_attrs =
      let%arr base = base in
      [ Attr.background_color base ]
    in
    let%map.Computation input =
      Text_box.component ~extra_attrs ~is_focused:textbox_is_focused
    and base = return base in
    { input with
      view =
        Node.hcat
          [ Node.text ~attrs:[ Attr.background_color base ] " "
          ; input.view
          ; Node.text ~attrs:[ Attr.background_color base ] " "
          ]
    }
  in
  let%sub { view = table; images; handler = table_handler } =
    Manga_table.component ~textbox_is_focused ~manga_title
  in
  let%sub () =
    global_key_handler
      ~textbox_handler
      ~table_handler
      ~textbox_is_focused
      ~set_textbox_focus
  in
  let%sub instructions = instructions in
  let%sub flamingo = Catpuccin.color Flamingo in
  let%sub green = Catpuccin.color Green in
  let%sub surface0 = Catpuccin.color Surface0 in
  let%arr text = text
  and mauve = mauve
  and table = table
  and images = images
  and spinner = spinner
  and instructions = instructions
  and textbox_is_focused = textbox_is_focused
  and textbox_view = textbox_view
  and manga_title = manga_title
  and flamingo = flamingo
  and green = green
  and surface0 = surface0 in
  let heading =
    Node.hcat
      [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Capymanga"
      ; text " "
      ; spinner
      ; text " "
      ; instructions
      ]
  in
  let textbox_view =
    if textbox_is_focused || String.length manga_title > 0
    then
      Node.hcat
        [ text " "
        ; text
            ~attrs:
              [ (if textbox_is_focused
                 then Attr.many [ Attr.foreground_color green; Attr.bold ]
                 else Attr.foreground_color flamingo)
              ; Attr.background_color surface0
              ]
            " Search: "
        ; textbox_view
        ]
    else Node.none
  in
  let left_pane =
    Node.vcat [ Node.hcat [ heading; textbox_view ]; Node.text ""; table ]
  in
  Node.pad ~l:2 ~t:1 left_pane, images
;;

let app =
  Loading_state.register
  @@
  let%sub content, images = content in
  let%sub backdrop = backdrop in
  let%arr backdrop = backdrop
  and images = images
  and content = content in
  Node.zcat [ content; backdrop ], images
;;

let command =
  let open Async in
  Command.async
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let%bind () = Capytui.start_with_images app in
        Deferred.return ()]
;;
