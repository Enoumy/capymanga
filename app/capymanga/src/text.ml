open! Core
open Bonsai.Let_syntax
open Capytui

let component =
  let%sub flavor = Capytui_catpuccin.flavor in
  let%arr flavor = flavor in
  let crust = Capytui_catpuccin.color ~flavor Crust in
  let text = Capytui_catpuccin.color ~flavor Text in
  fun ?(attrs = []) string ->
    Node.text
      ~attrs:
        ([ Attr.background_color crust; Attr.foreground_color text ] @ attrs)
      string
;;
