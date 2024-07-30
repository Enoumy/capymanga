open! Core
open Async
open Types

val search : title:string -> Manga.t Collection.t Deferred.Or_error.t
