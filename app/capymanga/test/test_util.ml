open! Core
open! Bonsai
open Bonsai.Let_syntax
module Outside_world = Capymanga.For_testing.Outside_world
open Capytui

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
  ?(initial_dimensions = { Dimensions.width = 120; height = 30 })
  ()
  =
  let manga_search =
    let%map manga_search = manga_search in
    fun ~title ->
      let%bind.Effect () =
        Effect.print_s [%message "[manga_search]" (title : string option)]
      in
      manga_search ~title
  in
  let manga_cover =
    let%map manga_cover = manga_cover in
    fun ~cover_id ->
      let%bind.Effect () =
        Effect.print_s [%message "[manga_cover]" (cover_id : string)]
      in
      manga_cover ~cover_id
  in
  let app =
    Outside_world.Manga_search.register_mock manga_search
    @@ Outside_world.Manga_cover.register_mock manga_cover
    @@
    let%sub image, images = Capymanga.app in
    let%arr image = image
    and images = images in
    let images =
      List.map images ~f:(fun image ->
        let string = Sexp.to_string_mach [%sexp (image : Image.t)] in
        let content =
          String.to_list string
          |> List.chunks_of ~length:(image.dimensions.width / 2)
          |> List.map ~f:(Fn.compose Node.text String.of_char_list)
          |> Node.vcat
        in
        let pad x = Node.pad ~l:image.column ~t:image.row x in
        Node.zcat
          [ pad (Node.center ~within:image.dimensions @@ content)
          ; pad
              (Node.vcat
                 (List.init image.dimensions.height ~f:(fun _ ->
                    Node.text (String.make image.dimensions.width '.'))))
          ])
    in
    Node.zcat (images @ [ image ])
  in
  let handle = Capytui_test.create_handle ~initial_dimensions app in
  handle
;;
