open! Core
open Capytui
open Bonsai

val component
  :  go_back:unit Effect.t Bonsai.t
  -> local_ Bonsai.graph
  -> Component.t Bonsai.t
