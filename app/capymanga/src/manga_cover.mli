open! Core
open Bonsai

type t = { url : string }

val component
  :  Mangadex_api.Types.Manga.t option Bonsai.t
  -> local_ Bonsai.graph
  -> t option Bonsai.t
