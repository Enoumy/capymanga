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

let content ~(page : Page.t Value.t) ~set_page ~go_back =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub { view; images; handler } =
    match%sub page with
    | Manga_search { title } ->
      Manga_search.component ~dimensions ~title ~set_page
    | Manga_view { manga } ->
      Manga_viewer.component ~dimensions ~manga ~set_page ~go_back
    | Chapter_view { manga; chapter } ->
      Chapter_viewer.component ~dimensions ~manga ~chapter ~go_back
    | About_page -> About.component ~go_back
  in
  let%sub () = Capytui.listen_to_events handler in
  let%arr view = view
  and images = images in
  view, images
;;

let app =
  Loading_state.register
  @@
  let%sub { page; set_page; go_back } =
    Navigation.component (Page.Manga_search { title = None })
  in
  let%sub content, images = content ~page ~set_page ~go_back in
  let%sub backdrop = backdrop in
  let%arr backdrop = backdrop
  and images = images
  and content = content in
  Node.zcat [ content; backdrop ], images
;;

let command =
  let open Async in
  Command.async_or_error
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let open Deferred.Or_error.Let_syntax in
        let app =
          app
          |> Outside_world.Manga_cover.register_real
          |> Outside_world.Manga_search.register_real
          |> Outside_world.Author.register_real
          |> Outside_world.Chapter_feed.register_real
        in
        let%bind () = Capytui.start_with_images app in
        Deferred.Or_error.return ()]
;;

module For_testing = struct
  module Outside_world = Outside_world
end
