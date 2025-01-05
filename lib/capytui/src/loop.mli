open! Core
open Bonsai
open Async

val start
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> ?target_frames_per_second:int
  -> (local_ Bonsai.graph -> (Node.t * Image.t list) Bonsai.t)
  -> unit Deferred.Or_error.t
