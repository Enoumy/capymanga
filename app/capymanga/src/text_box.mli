open! Core
open Bonsai
open Capytui

type t =
  { view : Node.t
  ; string : string
  ; handler : Event.t -> unit Effect.t
  }

val component : is_focused:bool Value.t -> t Computation.t
