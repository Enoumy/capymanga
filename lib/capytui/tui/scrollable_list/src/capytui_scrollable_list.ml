open! Core
open! Capytui
open! Bonsai
open Bonsai.Let_syntax

module Action = struct
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

let component
  (type key cmp)
  (module M : S with type t = key and type comparator_witness = cmp)
  ~dimensions:(_ : Dimensions.t Value.t)
  (items : (key, 'data, cmp) Core.Map.t Value.t)
  ~(render : key Value.t -> 'data Value.t -> Node.t Computation.t)
  ~compare:(_ : 'key * 'data -> 'key * 'data -> int)
  =
  let%sub rendered_nodes =
    Bonsai.assoc (module M) items ~f:(fun key data -> render key data)
  in
  let%sub alist =
    let%arr items = items in
    Core.Map.to_alist items
  in
  Bonsai.const
    { view = Node.none
    ; inject = (fun _ -> Effect.Ignore)
    ; less_keybindings_handler = (fun _ -> Effect.Ignore)
    }
;;
