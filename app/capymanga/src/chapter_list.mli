open! Core
open Bonsai
open Capytui
open Mangadex_api.Types

val component
  :  is_focused:bool Value.t
  -> dimensions:Dimensions.t Value.t
  -> Manga.t Value.t
  -> Component.t Computation.t
