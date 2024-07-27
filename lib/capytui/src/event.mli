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

  type action =
    | On_change of
        { bonsai_path : string
        ; callback : t -> unit Effect.t
        }
    | Deactivate of { bonsai_path : string }

  val listener_registry_variable : (action -> unit Effect.t) Dynamic_scope.t
end
