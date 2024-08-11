open! Core
open Capytui
open Bonsai

val component
  :  dimensions:Dimensions.t Value.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Value.t
  -> title:string option Value.t
  -> Component.t Computation.t
