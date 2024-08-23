open! Core
open! Bonsai
open Mangadex_api.Types

val register : 'a Computation.t -> 'a Computation.t

val fetch
  :  scanlation_group_id:string Value.t
  -> Scanlation_group.t Entity.t Or_error.t option Computation.t
