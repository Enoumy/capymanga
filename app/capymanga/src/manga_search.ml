open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let key_handler
  ~textbox_handler
  ~table_handler
  ~textbox_is_focused
  ~set_textbox_focus
  ~set_page
  (local_ _graph)
  =
  let callback =
    let%arr textbox_is_focused
    and textbox_handler
    and set_textbox_focus
    and table_handler
    and set_page in
    fun event ->
      if textbox_is_focused
      then (
        match event with
        | `Key (`Escape, []) | `Key (`Enter, []) | `Key (`Tab, []) ->
          set_textbox_focus false
        | _ -> textbox_handler event)
      else (
        match event with
        | `Key (`ASCII '/', [])
        | `Key (`ASCII ('s' | 'S'), [ `Ctrl ])
        | `Key (`ASCII ('l' | 'L'), [ `Ctrl ])
        | `Key (`ASCII ('f' | 'F'), [ `Ctrl ])
        | `Key (`ASCII ('k' | 'K'), [ `Ctrl ]) ->
          set_textbox_focus true
        | `Key (`ASCII '?', []) -> set_page ~replace:false Page.About_page
        | _ -> table_handler event)
  in
  callback
;;

let search_bar ~textbox_is_focused ~manga_title ~textbox_view (local_ graph) =
  let text = Text.component graph in
  let flavor = Catpuccin.flavor graph in
  let%arr textbox_is_focused
  and manga_title
  and text
  and flavor
  and textbox_view in
  if textbox_is_focused || String.length manga_title > 0
  then
    Node.hcat
      [ text " "
      ; text
          ~attrs:
            [ (if textbox_is_focused
               then
                 Attr.many
                   [ Attr.foreground_color (Catpuccin.color ~flavor Green)
                   ; Attr.bold
                   ]
               else Attr.foreground_color (Catpuccin.color ~flavor Flamingo))
            ; Attr.background_color (Catpuccin.color ~flavor Surface0)
            ]
          " Search: "
      ; textbox_view
      ]
  else Node.none
;;

let component ~dimensions ~set_page ~title (local_ graph) =
  let flavor = Catpuccin.flavor graph in
  let textbox_is_focused, set_textbox_focus = Bonsai.state false graph in
  let%sub { view = textbox_view
          ; string = manga_title
          ; handler = textbox_handler
          ; set
          }
    =
    let text_attrs =
      let%arr flavor in
      [ Attr.background_color (Catpuccin.color ~flavor Base)
      ; Attr.foreground_color (Catpuccin.color ~flavor Text)
      ]
    in
    let%map.Bonsai input =
      Capytui_textbox.component
        ~text_attrs
        ~is_focused:textbox_is_focused
        graph
    and flavor in
    let space =
      Node.text
        ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Base) ]
        " "
    in
    { input with view = Node.hcat [ space; input.view; space ] }
  in
  let () =
    let on_activate =
      let%arr title and set in
      match title with None -> Effect.Ignore | Some title -> set title
    in
    (* Consider using something like mirror/ some other synchronization
       mechanism here between the page and the textbox. I _think_ that only
       doing the sync once here is simpler though + should have the same
       behavior as we don't have a back button on the search page. *)
    Bonsai.Edge.lifecycle ~on_activate graph
  in
  let%sub { view = table; images; handler = table_handler } =
    let dimensions =
      let%arr { Dimensions.height; width } = dimensions in
      let height = height - 3
      and width = width - 1 in
      { Dimensions.height; width }
    in
    Manga_table.component
      ~dimensions
      ~textbox_is_focused
      ~manga_title
      ~set_page
      graph
  in
  let handler =
    key_handler
      ~textbox_handler
      ~table_handler
      ~textbox_is_focused
      ~set_textbox_focus
      ~set_page
      graph
  in
  let top_bar =
    let search_bar =
      search_bar ~textbox_is_focused ~manga_title ~textbox_view graph
    in
    let instructions =
      let%arr textbox_is_focused in
      match textbox_is_focused with
      | false -> [ "/", "Search"; "j", "Down"; "k", "Up" ]
      | true -> []
    in
    let top_bar = Top_bar.component ~instructions graph in
    let%arr top_bar and search_bar in
    Node.hcat [ top_bar; search_bar ]
  in
  let view =
    let%arr top_bar and table in
    let left_pane = Node.vcat [ top_bar; Node.text ""; table ] in
    Node.pad ~l:2 ~t:1 left_pane
  in
  let%arr view and images and handler in
  { Component.view; images; handler }
;;
