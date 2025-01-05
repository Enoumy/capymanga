open! Core
open Bonsai
open Capytui

val component
  :  dimensions:Dimensions.t Bonsai.t
  -> textbox_is_focused:bool Bonsai.t
  -> manga_title:string Bonsai.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Bonsai.t
  -> local_ Bonsai.graph
  -> Component.t Bonsai.t
