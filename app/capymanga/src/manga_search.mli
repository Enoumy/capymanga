open! Core
open Capytui
open Bonsai

type t =
  { view : Node.t
  ; images : Image.t list
  ; handler : Event.t -> unit Effect.t
  }

val component : t Computation.t
