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

let content =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub spinner =
    let%sub is_something_loading = Loading_state.is_something_loading in
    match%sub is_something_loading with
    | false -> Bonsai.const Node.none
    | true -> Spinner.component ~kind:Spinner.Kind.Dot (Value.return "")
  in
  let%sub table = Manga_table.component in
  let%sub instructions = instructions in
  let%arr text = text
  and mauve = mauve
  and table, images = table
  and spinner = spinner
  and instructions = instructions in
  let title =
    Node.hcat
      [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Capymanga"
      ; text " "
      ; spinner
      ; text " "
      ; instructions
      ]
  in
  Node.pad ~l:2 ~t:1 (Node.vcat [ title; Node.text ""; table ]), images
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
