open! Core

type t = Notty.Unescape.event

module Root_event = struct
  type t =
    [ Notty.Unescape.event
    | `Resize of int * int
    | `End
    | `Timer
    ]
end

module Private = struct
  open Bonsai

  type action =
    | On_change of
        { bonsai_path : string
        ; callback : t -> unit Effect.t
        }
    | Deactivate of { bonsai_path : string }

  let listener_registry_variable =
    Dynamic_scope.create
      ~name:"event handler"
      ~fallback:(fun (_ : action) ->
        let _ =
          failwith
            "BUG in Capytui. The event handler was never registered! Please \
             file an issue."
        in
        Effect.Ignore)
      ()
  ;;
end
