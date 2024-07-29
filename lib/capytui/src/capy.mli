open! Core
open Bonsai

(** [terminal_dimensions] returns the dimensions for the current terminal. *)
val terminal_dimensions : Dimensions.t Computation.t

val start
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> ?target_frames_per_second:int
  -> Node.t Bonsai.Computation.t
  -> unit

val listen_to_events
  :  (Event.t -> unit Effect.t) Value.t
  -> unit Computation.t

val set_cursor_position
  : (Position.t option -> unit Effect.t) Bonsai.Computation.t
