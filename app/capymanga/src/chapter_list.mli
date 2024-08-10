open! Core
open Bonsai
open Capytui
open Mangadex_api.Types

type t =
  { component : Component.t
  ; is_focuseable : bool
  }

val component
  :  is_focused:bool Value.t
  -> dimensions:Dimensions.t Value.t
  -> Manga.t Value.t
  -> t Computation.t
