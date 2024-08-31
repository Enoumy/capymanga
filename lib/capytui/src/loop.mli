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
  -> ?use_wezterm:bool
  -> (Node.t * Image.t list) Computation.t
  -> unit Deferred.Or_error.t
