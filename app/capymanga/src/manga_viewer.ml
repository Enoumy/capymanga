open! Core
open! Capytui
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let component ~dimensions ~(manga : Manga.t Value.t) ~set_page =
  let%sub manga_id =
    let%arr manga = manga in
    manga.id
  in
  Bonsai.scope_model (module Manga_id) ~on:manga_id
  @@
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
  let%sub top_bar = Top_bar.component ~instructions:(Value.return []) in
  let%sub flavor = Catpuccin.flavor in
  let%sub view =
    let%arr manga = manga
    and sexp_for_debugging = sexp_for_debugging
    and flavor = flavor in
    sexp_for_debugging
      ~attrs:[ Attr.foreground_color (Catpuccin.color ~flavor Flamingo) ]
      [%message (manga : Manga.t)]
  in
  let%sub { view; inject = _; less_keybindings_handler } =
    let%sub dimensions =
      let%arr dimensions = dimensions in
      let height = dimensions.Dimensions.height - 3 in
      let width = dimensions.height in
      { Dimensions.height; width }
    in
    Scroller.component ~dimensions view
  in
  let%sub view =
    let%arr view = view
    and top_bar = top_bar in
    Node.pad
      ~l:2
      ~t:1
      (Node.vcat [ top_bar; Node.text ""; view; Node.text "" ])
  in
  let%sub handler =
    let%arr set_page = set_page
    and less_keybindings_handler = less_keybindings_handler in
    fun (event : Event.t) ->
      match event with
      | `Key (`Backspace, []) -> set_page Page.Manga_search
      | _ -> less_keybindings_handler event
  in
  let%arr view = view
  and handler = handler in
  { Component.view; images = []; handler }
;;
