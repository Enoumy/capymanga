open! Core
open! Bonsai
open Bonsai.Let_syntax
module Outside_world = Capymanga.For_testing.Outside_world
open Capytui
open Mangadex_api.Types

let default_manga_search ~title:(_ : string option) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.one_punch_man_dummy_search_response))
;;

let default_manga_cover ~cover_id:(_ : string) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.one_punch_man_dummy_cover_response))
;;

let default_author ~author_id:(_ : string) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.one_punch_man_dummy_author_response))
;;

let default_chapter_feed ~manga_id:_ ~ascending:_ ?limit:_ ?offset:_ () =
  Effect.return
    (Ok
       (force Mangadex_api_dummy_data.mob_psycho_dummy_chapter_feed_response))
;;

let default_scalation_group ~scanlation_group_id:(_ : string) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.scanlation_group_dummy_response))
;;

let default_manga_chapter_images ~chapter_id:(_ : string) =
  Effect.return
    (Ok (force Mangadex_api_dummy_data.mangadex_dummy_chapter_images))
;;

let mock_chainsaw_man_response =
  lazy
    (Manga.t_of_yojson
       (Yojson.Safe.from_string
          {|
{
      "id": "a77742b1-befd-49a4-bff5-1ad4e6b0ef7b",
      "type": "manga",
      "attributes": {
        "title": {
          "en": "Chainsaw Man"
        },
        "altTitles": [
          {
            "uk": "Людина-бензопила"
          },
          {
            "ru": "Человек-бензопила"
          },
          {
            "ja": "チェンソーマン"
          },
          {
            "zh": "电锯人"
          },
          {
            "zh-hk": "鏈鋸人"
          },
          {
            "zh-hk": "電鋸人"
          },
          {
            "tr": "Testere Adam"
          },
          {
            "kk": "Шынжырлы ара адам"
          }
        ],
        "description": {
          "en": "Broke young man + chainsaw dog demon = Chainsaw Man!  \n  \nThe name says it all! Denji's life of poverty is changed forever when he merges with his pet chainsaw dog, Pochita! Now he's living in the big city and an official Devil Hunter. But he's got a lot to learn about his new job and chainsaw powers!",
          "fr": "Pour rembourser ses dettes, Denji, jeune homme dans la dèche la plus totale, est exploité en tant que Devil Hunter avec son chien-démon-tronçonneuse, “Pochita”. Mais suite à une cruelle trahison, il voit enfin une possibilité de se tirer des bas-fonds où il croupit ! Devenu surpuissant après sa fusion avec Pochita, Denji est recruté par une organisation et part à la chasse aux démons…\n\n---\n\nMaison d'édition FR : **Kazé / Crunchyroll**"
        },
        "isLocked": true,
        "links": {
          "al": "105778",
          "ap": "chainsaw-man",
          "bw": "series/191172",
          "kt": "54139",
          "mu": "151847",
          "amz": "https://www.amazon.co.jp/-/en/dp/B09P3Y9JYK",
          "cdj": "http://www.cdjapan.co.jp/searches?term.cat_id=UD-14-02-01&page=&agg_use=cat_ids_hierarchal_treeish_foldable&term.media_format=&q=チェンソーマン",
          "ebj": "https://ebookjapan.yahoo.co.jp/books/527520/",
          "mal": "116778",
          "raw": "https://shonenjumpplus.com/episode/10834108156650024834",
          "engtl": "https://mangaplus.shueisha.co.jp/titles/100037"
        },
        "originalLanguage": "ja",
        "lastVolume": "",
        "lastChapter": "",
        "publicationDemographic": "shounen",
        "status": "ongoing",
        "year": 2018,
        "contentRating": "suggestive",
        "tags": [
          {
            "id": "0a39b5a1-b235-4886-a747-1d05d216532d",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Award Winning"
              },
              "description": {},
              "group": "format",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "36fd93ea-e8b8-445e-b836-358f02b3d33d",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Monsters"
              },
              "description": {},
              "group": "theme",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "391b0423-d847-456f-aff0-8b0cfc03066b",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Action"
              },
              "description": {},
              "group": "genre",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "39730448-9a5f-48a2-85b0-a70db87b1233",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Demons"
              },
              "description": {},
              "group": "theme",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "4d32cc48-9f00-4cca-9b5a-a839f0764984",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Comedy"
              },
              "description": {},
              "group": "genre",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "b29d6a3d-1569-4e7a-8caf-7557bc92cd5d",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Gore"
              },
              "description": {},
              "group": "content",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "cdad7e68-1419-41dd-bdce-27753074a640",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Horror"
              },
              "description": {},
              "group": "genre",
              "version": 1
            },
            "relationships": []
          },
          {
            "id": "eabc5b4c-6aff-42f3-b657-3e90cbd00b75",
            "type": "tag",
            "attributes": {
              "name": {
                "en": "Supernatural"
              },
              "description": {},
              "group": "theme",
              "version": 1
            },
            "relationships": []
          }
        ],
        "state": "published",
        "chapterNumbersResetOnNewVolume": false,
        "createdAt": "2019-09-10T13:07:45+00:00",
        "updatedAt": "2024-06-12T17:38:56+00:00",
        "version": 108,
        "availableTranslatedLanguages": [
          "fa",
          "hu",
          "cs",
          "en",
          "it",
          "pt-br",
          "es-la",
          "uk",
          "es",
          "ru",
          "pl",
          "id",
          "fi",
          "kk",
          "fr",
          "zh-hk",
          "mn",
          "tr",
          "sr",
          "de",
          "bg",
          "ms",
          "ar",
          "th",
          "hr",
          "tl",
          "vi",
          "el",
          "sv"
        ],
        "latestUploadedChapter": "6374208f-0e31-459b-bc86-e47e56133109"
      },
      "relationships": [
        {
          "id": "f85a5b93-3c87-4c61-9032-07ceacbb9e64",
          "type": "author"
        },
        {
          "id": "f85a5b93-3c87-4c61-9032-07ceacbb9e64",
          "type": "artist"
        },
        {
          "id": "c862f594-aa07-4df2-a2c8-361640f7a3ff",
          "type": "cover_art"
        },
        {
          "id": "61325e33-e80b-443d-9b81-53b857b6ecdb",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "8d5d7c3b-eb95-4e58-838f-4da6c2cbee1f",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "94e1bcf0-4c18-4a4f-8843-d1039bd5d6b4",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "a0d05d57-4a2c-4d4b-9aa6-7b99bed425ca",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "b1d12720-49d7-4730-9945-1cd8737d97e4",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "c63e5e58-f6b1-422f-bd41-1efaca70476b",
          "type": "manga",
          "related": "doujinshi"
        },
        {
          "id": "e896c48c-3150-437d-ba57-d8567eb399ae",
          "type": "manga",
          "related": "colored"
        }
      ]
    }
         |}))
;;

let create_handle
  ?(manga_search = Value.return default_manga_search)
  ?(manga_cover = Value.return default_manga_cover)
  ?(author = Value.return default_author)
  ?(chapter_feed = Value.return default_chapter_feed)
  ?(scanlation_group = Value.return default_scalation_group)
  ?(chapter_images = Value.return default_manga_chapter_images)
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
  let author =
    let%map author = author in
    fun ~author_id ->
      let%bind.Effect () =
        Effect.print_s [%message "[author]" (author_id : string)]
      in
      author ~author_id
  in
  let scanlation_group =
    let%map scanlation_group = scanlation_group in
    fun ~scanlation_group_id ->
      let%bind.Effect () =
        Effect.print_s
          [%message "[scanlation_group]" (scanlation_group_id : string)]
      in
      scanlation_group ~scanlation_group_id
  in
  let chapter_images =
    let%map chapter_images = chapter_images in
    fun ~chapter_id ->
      let%bind.Effect () =
        Effect.print_s [%message "[chapter_id]" (chapter_id : string)]
      in
      chapter_images ~chapter_id
  in
  let chapter_feed =
    let%map chapter_feed = chapter_feed in
    fun ~manga_id ~ascending ?limit ?offset () ->
      let%bind.Effect () =
        Effect.print_s
          [%message
            "chapter_feed"
              (manga_id : Manga_id.t)
              (ascending : bool)
              (limit : int option)
              (offset : int option)]
      in
      chapter_feed ~manga_id ~ascending ?limit ?offset ()
  in
  let app =
    Outside_world.Manga_search.register_mock manga_search
    @@ Outside_world.Manga_cover.register_mock manga_cover
    @@ Outside_world.Author.register_mock author
    @@ Outside_world.Chapter_feed.register_mock chapter_feed
    @@ Outside_world.Scanlation_group.register_mock scanlation_group
    @@ Outside_world.Chapter_images.register_mock chapter_images
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
