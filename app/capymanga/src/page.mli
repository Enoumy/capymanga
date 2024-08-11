open! Core
open Mangadex_api.Types

type t =
  | Manga_search of { title : string option }
  | Manga_view of { manga : Manga.t }
  | About_page
[@@deriving sexp]
