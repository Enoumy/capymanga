open! Core

type t = Notty.Unescape.event

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

  type callback =
    { bonsai_path : string
    ; callback : t -> unit Effect.t
    }

  val listener_registry_variable
    : (callback -> unit Effect.t) Dynamic_scope.t
end
