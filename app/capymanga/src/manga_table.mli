open! Core
open Bonsai
open Capytui

val component
  :  dimensions:Dimensions.t Value.t
  -> textbox_is_focused:bool Value.t
  -> manga_title:string Value.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Value.t
  -> Component.t Computation.t
