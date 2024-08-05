open! Core
open Capytui

type t =
  { view : Node.t
  ; images : Image.t list
  ; handler : Event.t -> unit Effect.t
  }
