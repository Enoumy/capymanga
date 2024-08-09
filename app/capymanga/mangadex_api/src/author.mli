open! Core
open Async
open Types

val get : author_id:string -> Author.t Entity.t Deferred.Or_error.t
