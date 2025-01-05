open! Core
open Capytui
open Bonsai

val component
  :  dimensions:Dimensions.t Bonsai.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Bonsai.t
  -> title:string option Bonsai.t
  -> local_ Bonsai.graph
  -> Component.t Bonsai.t
