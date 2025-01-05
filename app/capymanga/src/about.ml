open! Core
open Capytui
module Catpuccin = Capytui_catpuccin
open Bonsai.Let_syntax

let component ~go_back (local_ graph) =
  (* TODO: Make this prettier. Also figure out a way to nicely center align
     text... *)
  let dimensions = Capytui.terminal_dimensions graph in
  let flavor = Catpuccin.flavor graph in
  let view =
    let%arr flavor in
    Node.vcat
      [ Node.hcat
          [ Node.text
              ~attrs:
                [ Attr.bold
                ; Attr.foreground_color (Catpuccin.color ~flavor Mauve)
                ; Attr.background_color (Catpuccin.color ~flavor Crust)
                ]
              "Capymanga"
          ; Node.text
              ~attrs:
                [ Attr.foreground_color (Catpuccin.color ~flavor Flamingo)
                ; Attr.background_color (Catpuccin.color ~flavor Crust)
                ]
              " 2024"
          ]
      ; Node.hcat
          [ Node.text
              ~attrs:
                [ Attr.foreground_color (Catpuccin.color ~flavor Text)
                ; Attr.background_color (Catpuccin.color ~flavor Crust)
                ]
              "powered by "
          ; Node.text
              ~attrs:
                [ Attr.bold
                ; Attr.foreground_color (Catpuccin.color ~flavor Teal)
                ; Attr.background_color (Catpuccin.color ~flavor Crust)
                ]
              "MangaDex"
          ]
      ]
  in
  let view =
    let%arr dimensions and view in
    Node.center ~within:dimensions view
  in
  let handler =
    let%arr go_back in
    fun (event : Event.t) ->
      match event with
      | `Key ((`Backspace | `Escape), []) | `Key (`ASCII ('q' | '?'), []) ->
        go_back
      | _ -> Effect.Ignore
  in
  let%arr view and handler in
  { Component.view; handler; images = [] }
;;
