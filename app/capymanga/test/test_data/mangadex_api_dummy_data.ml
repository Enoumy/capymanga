open! Core
open Mangadex_api.Types

let one_punch_man_dummy_search_response : Manga.t Collection.t Lazy.t =
  lazy
    (Collection.t_of_yojson
       Manga.t_of_yojson
       (Yojson.Safe.from_string
          Embedded_files.one_punch_man_search_test_data_dot_json))
;;

let one_punch_man_dummy_cover_response : Cover.t Entity.t Lazy.t =
  lazy
    (Entity.t_of_yojson
       Cover.t_of_yojson
       (Yojson.Safe.from_string
          Embedded_files.one_punch_man_cover_test_data_dot_json))
;;

let one_punch_man_dummy_author_response : Author.t Entity.t Lazy.t =
  lazy
    (Entity.t_of_yojson
       Author.t_of_yojson
       (Yojson.Safe.from_string
          Embedded_files.mangadex_author_test_data_dot_json))
;;

let mob_psycho_dummy_chapter_feed_response : Chapter.t Collection.t Lazy.t =
  lazy
    (Collection.t_of_yojson
       Chapter.t_of_yojson
       (Yojson.Safe.from_string
          Embedded_files.mob_psycho_mangadex_chapter_feed_test_data_dot_json))
;;

let scanlation_group_dummy_response : Scanlation_group.t Entity.t Lazy.t =
  lazy
    (Entity.t_of_yojson
       Scanlation_group.t_of_yojson
       (Yojson.Safe.from_string
          Embedded_files.mangadex_scanlation_group_test_data_dot_json))
;;
