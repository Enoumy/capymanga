open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let render_instruction key action =
  let%sub text = Capytui_catpuccin.color Text in
  let%sub subtext = Capytui_catpuccin.color Subtext0 in
  let%sub crust = Capytui_catpuccin.color Crust in
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
