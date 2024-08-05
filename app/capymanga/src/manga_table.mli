open! Core
open Bonsai
open Capytui

type t =
  { view : Node.t
  ; images : Image.t list
  ; handler : Event.t -> unit Effect.t
  }

val component
  :  dimensions:Dimensions.t Value.t
  -> textbox_is_focused:bool Value.t
  -> manga_title:string Value.t
  -> set_page:(Page.t -> unit Effect.t) Value.t
  -> t Computation.t
