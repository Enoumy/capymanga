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
  :  ?cursor_attrs:Attr.t list Bonsai.t
  -> ?text_attrs:Attr.t list Bonsai.t
  -> is_focused:bool Bonsai.t
  -> local_ Bonsai.graph
  -> t Bonsai.t
