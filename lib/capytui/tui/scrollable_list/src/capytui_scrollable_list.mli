open! Core
open Capytui
open Bonsai

module Action : sig
  type 'key t =
    | Down
    | Up
    | Top
    | Bottom
    | Up_half_page
    | Down_half_page
    | Scroll_to of 'key
end

type 'key t =
  { view : Node.t
  ; inject : 'key Action.t -> unit Effect.t
  ; less_keybindings_handler : Event.t -> unit Effect.t
  }

module type S = sig
  type t [@@deriving sexp, compare]

  include Comparable.S with type t := t
end

val component
  :  (module S with type t = 'key and type comparator_witness = 'cmp)
  -> dimensions:Dimensions.t Value.t
  -> ('key, 'data, 'cmp) Core.Map.t Value.t
  -> render:('key Value.t -> 'data Value.t -> Node.t Computation.t)
  -> compare:('key * 'data -> 'key * 'data -> int)
  -> 'key t Computation.t
