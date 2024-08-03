open! Core
open Async
open Types

val get : cover_id:string -> Cover.t Entity.t Deferred.Or_error.t
