open! Core
open Bonsai
open Capytui

type action =
  | Scroll_to of
      { bottom : int
      ; top : int
      }
  | Up
  | Down
  | Top
  | Bottom
  | Up_half_screen
  | Down_half_screen

type t =
  { view : Node.t
  ; inject : action -> unit Effect.t
  ; less_keybindings_handler : Event.t -> unit Effect.t
  }

val component
  :  dimensions:Dimensions.t Value.t
  -> Node.t Value.t
  -> t Computation.t
