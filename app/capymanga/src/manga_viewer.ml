open! Core
open! Capytui
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let component ~dimensions ~(manga : Manga.t Value.t) ~set_page =
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
  let%sub view =
    let%arr manga = manga
    and sexp_for_debugging = sexp_for_debugging in
    sexp_for_debugging [%message (manga : Manga.t)]
  in
  let%sub { view; inject = _; less_keybindings_handler } =
    Scroller.component ~dimensions view
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
