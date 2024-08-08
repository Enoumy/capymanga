open! Core
open Bonsai

type t = { url : string }

val component
  :  Mangadex_api.Types.Manga.t option Value.t
  -> t option Computation.t
