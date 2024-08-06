open! Core
open! Capytui
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let constrain_width ~(dimensions : Dimensions.t) node =
  let width = Node.width node in
  Node.crop ~r:(Int.max 0 (width - dimensions.width)) node
;;

let sidebar
  ~(dimensions : Dimensions.t Value.t)
  ~set_page
  (manga : Manga.t Value.t)
  =
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
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
    Scroller.component ~dimensions view
  in
  let%sub view =
    let%arr dimensions = dimensions
    and view = view in
    constrain_width ~dimensions view
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
  { Component.view; handler; images = [] }
;;

let chapter_table ~(dimensions : Dimensions.t Value.t) =
  let%sub flavor = Catpuccin.flavor in
  let%arr flavor = flavor
  and dimensions = dimensions in
  Node.center
    ~within:dimensions
    (Node.text
       ~attrs:
         [ Attr.foreground_color (Catpuccin.color ~flavor Text)
         ; Attr.background_color (Catpuccin.color ~flavor Crust)
         ; Attr.bold
         ]
       "List of manga chapters goes here!")
;;

let component ~dimensions ~(manga : Manga.t Value.t) ~set_page =
  let%sub manga_id =
    let%arr manga = manga in
    manga.id
  in
  (* NOTE: Maybe this scope_model should only be for the scroller? *)
  Bonsai.scope_model (module Manga_id) ~on:manga_id
  @@
  let%sub top_bar =
    Top_bar.component ~instructions:(Value.return [ "Backspace", "back" ])
  in
  let%sub flavor = Catpuccin.flavor in
  let%sub content_dimensions =
    let%arr dimensions = dimensions in
    let height = dimensions.Dimensions.height - 3 in
    let width = dimensions.width - 4 in
    { Dimensions.height; width }
  in
  let%sub left_dimensions =
    let%arr content_dimensions = content_dimensions in
    { content_dimensions with width = content_dimensions.width / 2 }
  in
  let%sub { view = sidebar_view; images = _; handler = sidebar_handler } =
    sidebar ~dimensions:left_dimensions manga ~set_page
  in
  let%sub chapter_table = chapter_table ~dimensions:left_dimensions in
  let%sub view =
    let%arr sidebar_view = sidebar_view
    and chapter_table = chapter_table in
    Node.hcat [ sidebar_view; chapter_table ]
  in
  let%sub view =
    let%arr view = view
    and top_bar = top_bar in
    Node.pad
      ~l:2
      ~t:1
      ~r:2
      (Node.vcat [ top_bar; Node.text ""; view; Node.text "" ])
  in
  let%arr view = view
  and sidebar_handler = sidebar_handler in
  { Component.view; images = []; handler = sidebar_handler }
;;
