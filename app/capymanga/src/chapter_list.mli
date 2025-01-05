open! Core
open Bonsai
open Capytui
open Mangadex_api.Types

type t =
  { component : Component.t
  ; is_focuseable : bool
  }

val component
  :  is_focused:bool Bonsai.t
  -> dimensions:Dimensions.t Bonsai.t
  -> grab_focus:unit Effect.t Bonsai.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Bonsai.t
  -> Manga.t Bonsai.t
  -> local_ Bonsai.graph
  -> t Bonsai.t
