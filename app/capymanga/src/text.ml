open! Core
open Bonsai.Let_syntax
open Capytui

let component =
  let%sub crust = Capytui_catpuccin.color Crust in
  let%sub text = Capytui_catpuccin.color Text in
  let%arr crust = crust
  and text = text in
  fun ?(attrs = []) string ->
    Node.text
      ~attrs:
        ([ Attr.background_color crust; Attr.foreground_color text ] @ attrs)
      string
;;
