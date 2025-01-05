open! Core

val set_cursor_position
  :  local_ Bonsai.graph
  -> (Position.t option -> unit Effect.t) Bonsai.t

val register
  :  Term.t
  -> (local_ Bonsai.graph -> 'a Bonsai.t)
  -> local_ Bonsai.graph
  -> 'a Bonsai.t
