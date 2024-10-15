open! Core
open Bonsai
open Capytui

type t =
  { view : Node.t
  ; string : string
  ; handler : Event.t -> unit Effect.t
  ; set : string -> unit Effect.t
  }

val component
  :  ?cursor_attrs:Attr.t list Value.t
  -> ?text_attrs:Attr.t list Value.t
  -> is_focused:bool Value.t
  -> unit
  -> t Computation.t
