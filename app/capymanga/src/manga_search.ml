open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

type t =
  { view : Node.t
  ; images : Image.t list
  ; handler : Event.t -> unit Effect.t
  }

let key_handler
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
        | `Key (`Escape, []) | `Key (`Enter, []) | `Key (`Tab, []) ->
          set_textbox_focus false
        | _ -> textbox_handler event)
      else (
        match event with
        | `Key (`ASCII '/', [])
        | `Key (`ASCII ('s' | 'S'), [ `Ctrl ])
        | `Key (`ASCII ('l' | 'L'), [ `Ctrl ])
        | `Key (`ASCII ('f' | 'F'), [ `Ctrl ]) ->
          set_textbox_focus true
        | _ -> table_handler event)
  in
  return callback
;;

let component =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub spinner =
    let%sub is_something_loading = Loading_state.is_something_loading in
    match%sub is_something_loading with
    | false ->
      let%arr text = text in
      text "  "
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
  let%sub handler =
    key_handler
      ~textbox_handler
      ~table_handler
      ~textbox_is_focused
      ~set_textbox_focus
  in
  let%sub instructions = Instructions.component in
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
  and surface0 = surface0
  and handler = handler in
  let view =
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
    Node.pad ~l:2 ~t:1 left_pane
  in
  { view; images; handler }
;;
