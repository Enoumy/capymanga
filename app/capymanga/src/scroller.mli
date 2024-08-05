open! Core
open Bonsai
open Capytui

type action =
  | Scroll_to of int
  | Up
  | Down

type t =
  { view : Node.t
  ; inject : action -> unit Effect.t
  }

val component
  :  dimensions:Dimensions.t Value.t
  -> Node.t Value.t
  -> t Computation.t
