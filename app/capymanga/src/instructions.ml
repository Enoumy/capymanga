open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let render_instruction key action =
  let%sub flavor = Catpuccin.flavor in
  let%arr flavor = flavor in
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

let component =
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
