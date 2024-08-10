open! Core
open Types
open Async

val feed
  :  manga_id:Manga_id.t
  -> ascending:bool
  -> ?limit:int
  -> ?offset:int
  -> unit
  -> Chapter.t Collection.t Deferred.Or_error.t
