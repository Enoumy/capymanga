open! Core
open Mangadex_api.Types
open Bonsai

module Manga_cover : sig
  type t = cover_id:string -> Cover.t Entity.t Or_error.t Effect.t

  val component : t Computation.t
  val register_mock : t Value.t -> 'a Computation.t -> 'a Computation.t
  val register_real : 'a Computation.t -> 'a Computation.t
end
