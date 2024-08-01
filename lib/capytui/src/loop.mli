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
  -> Node.t Computation.t
  -> unit Deferred.t
