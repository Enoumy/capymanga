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

(** [component ~dimensions node], will make a region of size [dimensions]
    containing [node]. If [node] is vertically bigger than [dimensions.height]
    then the region will be "scrollable". You can scroll by scheduling
    [inject] actions.

    A default "handler" for events with less-like navigation is provided as
    a helper utility. *)
val component
  :  dimensions:Dimensions.t Bonsai.t
  -> Node.t Bonsai.t
  -> local_ Bonsai.graph
  -> t Bonsai.t

(** SOMEDAY: Make it possible to have some form of "visual" scrollbar, or maybe
    even something like vim's "TOP"/"BOT"/% in the  bottom right of vim's
    status line. *)
