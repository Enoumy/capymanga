open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let component ~instructions =
  let%sub text = Text.component in
  let%sub flavor = Catpuccin.flavor in
  let%sub instructions = Instructions.component instructions in
  let%sub spinner =
    let%sub is_something_loading = Loading_state.is_something_loading in
    match%sub is_something_loading with
    | false ->
      let%arr text = text in
      text "  "
    | true -> Spinner.component ~kind:Spinner.Kind.Dot (Value.return "")
  in
  let%arr text = text
  and flavor = flavor
  and spinner = spinner
  and instructions = instructions in
  Node.hcat
    [ text
        ~attrs:
          [ Attr.foreground_color (Catpuccin.color ~flavor Mauve)
          ; Attr.bold
          ]
        "Capymanga"
    ; text " "
    ; spinner
    ; text " "
    ; instructions
    ]
;;
