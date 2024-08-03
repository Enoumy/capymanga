open! Core
open Bonsai
open Capytui

type t =
  { view : Node.t
  ; string : string
  ; handler : Event.t -> unit Effect.t
  }

val component
  :  ?extra_attrs:Attr.t list Value.t
  -> is_focused:bool Value.t
  -> t Computation.t
