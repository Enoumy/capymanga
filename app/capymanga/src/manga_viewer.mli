open! Core
open Capytui
open Bonsai
open Mangadex_api.Types

val component
  :  dimensions:Dimensions.t Bonsai.t
  -> manga:Manga.t Bonsai.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Bonsai.t
  -> go_back:unit Effect.t Bonsai.t
  -> local_ Bonsai.graph
  -> Component.t Bonsai.t
