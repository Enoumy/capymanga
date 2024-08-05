open! Core
open Capytui
module Catpuccin = Capytui_catpuccin
open Bonsai.Let_syntax

let component ~set_page =
  (* TODO: Make this prettier. Also figure out a way to nicely center align
     text... *)
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub flavor = Catpuccin.flavor in
  let%sub view =
    let%arr flavor = flavor in
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
  let%sub view =
    let%arr dimensions = dimensions
    and view = view in
    Node.center ~within:dimensions view
  in
  let%sub handler =
    let%arr set_page = set_page in
    fun (event : Event.t) ->
      match event with
      | `Key ((`Backspace | `Escape), []) | `Key (`ASCII ('q' | '?'), []) ->
        set_page Page.Manga_search
      | _ -> Effect.Ignore
  in
  let%arr view = view
  and handler = handler in
  { Component.view; handler; images = [] }
;;
