open! Core
open Bonsai
open Bonsai.Let_syntax
open Capytui
module Catpuccin = Capytui_catpuccin

let backdrop (local_ graph) =
  let dimensions = Capytui.terminal_dimensions graph in
  let flavor = Catpuccin.flavor graph in
  let%arr { height; width } = dimensions
  and flavor in
  Node.vcat
    (List.init height ~f:(fun _ ->
       Node.text
         ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Crust) ]
         (String.make width ' ')))
;;

let content ~(page : Page.t Bonsai.t) ~set_page ~go_back (local_ graph) =
  let dimensions = Capytui.terminal_dimensions graph in
  let%sub { view; images; handler } =
    match%sub page with
    | Manga_search { title } ->
      Manga_search.component ~dimensions ~title ~set_page graph
    | Manga_view { manga } ->
      Manga_viewer.component ~dimensions ~manga ~set_page ~go_back graph
    | Chapter_view { chapter } ->
      Chapter_viewer.component ~dimensions ~chapter ~go_back graph
    | About_page -> About.component ~go_back graph
  in
  let () = Capytui.listen_to_events handler graph in
  let%arr view and images in
  view, images
;;

let app =
  Loading_state.register
  @@ Scanlation_group_cache.register
  @@ fun (local_ graph) ->
  let%sub { page; set_page; go_back } =
    Navigation.component (Page.Manga_search { title = None }) graph
  in
  let%sub content, images = content ~page ~set_page ~go_back graph in
  let%sub backdrop = backdrop graph in
  let%arr backdrop and images and content in
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
          |> Outside_world.Chapter_images.register_real
          |> Outside_world.Scanlation_group.register_real
        in
        let%bind () = Capytui.start_with_images app in
        Deferred.Or_error.return ()]
;;

module For_testing = struct
  module Outside_world = Outside_world
end
