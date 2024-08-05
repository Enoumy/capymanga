open! Core
open Bonsai

val component
  :  set_page:(Page.t -> unit Effect.t) Value.t
  -> Component.t Computation.t
