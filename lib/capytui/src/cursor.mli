open! Core

val set_cursor_position
  : (Position.t option -> unit Effect.t) Bonsai.Computation.t

val register : Term.t -> 'a Bonsai.Computation.t -> 'a Bonsai.Computation.t
