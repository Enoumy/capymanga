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
