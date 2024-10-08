open! Core
open Mangadex_api.Types
open Bonsai

module type S = sig
  type t

  val component : t Computation.t
  val register_mock : t Value.t -> 'a Computation.t -> 'a Computation.t
  val register_real : 'a Computation.t -> 'a Computation.t
end

module Manga_cover :
  S with type t = cover_id:string -> Cover.t Entity.t Or_error.t Effect.t

module Manga_search :
  S
  with type t =
    title:string option -> Manga.t Collection.t Or_error.t Effect.t

module Author :
  S with type t = author_id:string -> Author.t Entity.t Or_error.t Effect.t

module Chapter_feed :
  S
  with type t =
    manga_id:Manga_id.t
    -> ascending:bool
    -> ?limit:int
    -> ?offset:int
    -> unit
    -> Chapter.t Collection.t Or_error.t Effect.t

module Chapter_images :
  S with type t = chapter_id:string -> Chapter_images.t Or_error.t Effect.t

module Scanlation_group :
  S
  with type t =
    scanlation_group_id:string
    -> Scanlation_group.t Entity.t Or_error.t Effect.t
