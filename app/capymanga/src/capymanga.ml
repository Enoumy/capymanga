open! Core
open Bonsai
open Bonsai.Let_syntax
open Capytui
module Catpuccin = Capytui_catpuccin

let backdrop =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub flavor = Catpuccin.flavor in
  let%arr { height; width } = dimensions
  and flavor = flavor in
  Node.vcat
    (List.init height ~f:(fun _ ->
       Node.text
         ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Crust) ]
         (String.make width ' ')))
;;

let content ~(page : Page.t Value.t) ~set_page =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub { view; images; handler } =
    match%sub page with
    | Manga_search -> Manga_search.component ~dimensions ~set_page
    | Manga_view { manga } ->
      Manga_viewer.component ~dimensions ~manga ~set_page
    | About_page -> About.component ~set_page
  in
  let%sub () = Capytui.listen_to_events handler in
  let%arr view = view
  and images = images in
  view, images
;;

let app =
  Loading_state.register
  @@
  let%sub page, set_page = Bonsai.state Page.Manga_search in
  let%sub content, images = content ~page ~set_page in
  let%sub backdrop = backdrop in
  let%arr backdrop = backdrop
  and images = images
  and content = content in
  Node.zcat [ content; backdrop ], images
;;

let command =
  let open Async in
  Command.async
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let%bind () = Capytui.start_with_images app in
        Deferred.return ()]
;;
