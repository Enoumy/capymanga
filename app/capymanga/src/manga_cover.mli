open! Core
open Bonsai
open Capytui

val component
  :  Mangadex_api.Types.Manga.t option Value.t
  -> (Image.t * string) option Computation.t
