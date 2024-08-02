open! Core
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let sexp_for_debugging =
  let%sub text = Catpuccin.color Text in
  let%sub crust = Catpuccin.color Crust in
  let%arr text = text
  and crust = crust in
  fun ?(attrs = []) sexp ->
    Node.sexp_for_debugging
      ~attrs:
        ([ Attr.background_color crust; Attr.foreground_color text ] @ attrs)
      sexp
;;
