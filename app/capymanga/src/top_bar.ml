open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let component ~instructions (local_ graph) =
  let text = Text.component graph in
  let flavor = Catpuccin.flavor graph in
  let instructions = Instructions.component instructions graph in
  let spinner =
    let is_something_loading = Loading_state.is_something_loading graph in
    match%sub is_something_loading with
    | false ->
      let%arr text in
      text "  "
    | true ->
      Spinner.component ~kind:Spinner.Kind.Dot (Bonsai.return "") graph
  in
  let%arr text and flavor and spinner and instructions in
  Node.hcat
    [ text
        ~attrs:
          [ Attr.foreground_color (Catpuccin.color ~flavor Mauve)
          ; Attr.bold
          ]
        "Capymanga"
    ; text " powered by "
    ; text
        ~attrs:
          [ Attr.bold
          ; Attr.foreground_color (Catpuccin.color ~flavor Flamingo)
          ]
        "Mangadex  "
    ; spinner
    ; text " "
    ; instructions
    ]
;;
