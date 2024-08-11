open! Core
open Mangadex_api.Types

type t =
  | Manga_search of { title : string option }
  | Manga_view of { manga : Manga.t }
  | Chapter_view of
      { manga : Manga.t
      ; chapter : Chapter.t
      }
  | About_page
[@@deriving sexp]
