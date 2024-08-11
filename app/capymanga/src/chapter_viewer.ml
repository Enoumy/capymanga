open! Core
open Capytui
open Bonsai.Let_syntax

let component ~dimensions ~manga:_ ~chapter:_ ~go_back =
  let%sub view =
    let%sub text = Text.component in
    let%arr text = text
    and dimensions = dimensions in
    Node.center ~within:dimensions (text "Chapter viewer goes here!")
  in
  let%sub handler =
    let%arr go_back = go_back in
    fun (event : Event.t) ->
      match event with
      | `Key (`Backspace, []) -> go_back
      | _ -> Effect.Ignore
  in
  let%arr view = view
  and handler = handler in
  { Component.view; handler; images = [] }
;;
