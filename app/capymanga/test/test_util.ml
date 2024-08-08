open! Core
open! Bonsai
open Bonsai.Let_syntax
module Outside_world = Capymanga.For_testing.Outside_world

let default_manga_search ~title:(_ : string option) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.one_punch_man_dummy_search_response))
;;

let default_manga_cover ~cover_id:(_ : string) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.one_punch_man_dummy_cover_response))
;;

let create_handle
  ?(manga_search = Value.return default_manga_search)
  ?(manga_cover = Value.return default_manga_cover)
  ()
  =
  let app =
    Outside_world.Manga_search.register_mock manga_search
    @@ Outside_world.Manga_cover.register_mock manga_cover
    @@
    let%sub image, _ = Capymanga.app in
    Bonsai.read image
  in
  let handle =
    Capytui_test.create_handle
      ~initial_dimensions:{ width = 120; height = 30 }
      app
  in
  handle
;;
