open! Core
open Capytui
open Bonsai
open Mangadex_api.Types

val component
  :  dimensions:Dimensions.t Value.t
  -> manga:Manga.t Value.t
  -> set_page:(Page.t -> unit Effect.t) Value.t
  -> go_back:unit Effect.t Value.t
  -> Component.t Computation.t
