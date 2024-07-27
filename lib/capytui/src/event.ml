open! Core

type t =
  [ Notty.Unescape.event
  | `Resize of int * int
  | `End
  | `Timer
  ]
