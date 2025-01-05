open! Core
open! Bonsai
open Mangadex_api.Types

val register
  :  (local_ Bonsai.graph -> 'a Bonsai.t)
  -> local_ Bonsai.graph
  -> 'a Bonsai.t

val fetch
  :  scanlation_group_id:string Bonsai.t
  -> local_ Bonsai.graph
  -> Scanlation_group.t Entity.t Or_error.t option Bonsai.t
