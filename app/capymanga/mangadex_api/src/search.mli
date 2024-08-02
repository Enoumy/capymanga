open! Core
open Async
open Types

val search
  :  ?title:string
  -> ?limit:int
  -> ?offset:int
  -> unit
  -> Manga.t Collection.t Deferred.Or_error.t
