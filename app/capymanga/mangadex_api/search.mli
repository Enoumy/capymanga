open! Core
open Async

val search : title:string -> string Deferred.Or_error.t
