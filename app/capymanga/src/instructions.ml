open! Core
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let render_instruction flavor key action =
  let text = Capytui_catpuccin.color ~flavor Text in
  let subtext = Capytui_catpuccin.color ~flavor Subtext0 in
  let crust = Capytui_catpuccin.color ~flavor Crust in
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

let component instructions =
  let%sub flavor = Catpuccin.flavor in
  let%sub instructions =
    let%arr instructions = instructions
    and flavor = flavor in
    List.map instructions ~f:(fun (key, action) ->
      render_instruction flavor key action)
  in
  let%sub text = Text.component in
  let%arr instructions = instructions
  and text = text in
  Node.hcat (List.intersperse ~sep:(text "  ") instructions)
;;
