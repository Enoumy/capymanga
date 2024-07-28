open! Core

type special =
  [ `Escape
  | `Enter
  | `Tab
  | `Backspace
  | `Insert
  | `Delete
  | `Home
  | `End
  | `Arrow of [ `Up | `Down | `Left | `Right ]
  | `Page of [ `Up | `Down ]
  | `Function of int
  ]
[@@deriving sexp_of]

type button =
  [ `Left
  | `Middle
  | `Right
  | `Scroll of [ `Up | `Down ]
  ]
[@@deriving sexp_of]

type mods = [ `Meta | `Ctrl | `Shift ] list [@@deriving sexp_of]

type key = [ special | `Uchar of Uchar.t | `ASCII of char ] * mods
[@@deriving sexp_of]

type mouse = [ `Press of button | `Drag | `Release ] * (int * int) * mods
[@@deriving sexp_of]

type paste =
  [ `Start
  | `End
  ]
[@@deriving sexp_of]

type t = Notty.Unescape.event [@@deriving sexp_of]

module Root_event : sig
  type t =
    [ Notty.Unescape.event
    | `Resize of int * int
    | `End
    | `Timer
    ]
end

module Private : sig
  open Bonsai

  type action =
    | On_change of
        { bonsai_path : string
        ; callback : t -> unit Effect.t
        }
    | Deactivate of { bonsai_path : string }

  val listener_registry_variable : (action -> unit Effect.t) Dynamic_scope.t

  type 'a handle =
    { result : 'a
    ; broadcast_event : t -> unit Effect.t
    }

  val register : 'a Computation.t -> 'a handle Computation.t
end
