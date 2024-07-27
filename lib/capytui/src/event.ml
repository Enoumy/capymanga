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
