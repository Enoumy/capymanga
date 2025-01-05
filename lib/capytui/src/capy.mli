open! Core
open Bonsai

(** [terminal_dimensions] returns the dimensions for the current terminal. *)
val terminal_dimensions : local_ Bonsai.graph -> Dimensions.t Bonsai.t

val start
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> ?target_frames_per_second:int
  -> (local_ Bonsai.graph -> Node.t Bonsai.t)
  -> unit Async.Deferred.Or_error.t

val start_with_images
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> ?target_frames_per_second:int
  -> (local_ Bonsai.graph -> (Node.t * Image.t list) Bonsai.t)
  -> unit Async.Deferred.Or_error.t

val listen_to_events
  :  (Event.t -> unit Effect.t) Bonsai.t
  -> local_ Bonsai.graph
  -> unit

val set_cursor_position
  :  local_ Bonsai.graph
  -> (Position.t option -> unit Effect.t) Bonsai.t
