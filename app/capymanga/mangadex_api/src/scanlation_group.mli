open! Core
open Async
open Types

val get
  :  scanlation_group_id:string
  -> Scanlation_group.t Entity.t Deferred.Or_error.t

open! Async
