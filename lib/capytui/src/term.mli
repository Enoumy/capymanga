open! Core

type t = Notty_unix.Term.t

val create
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> unit
  -> t

val dimensions : t -> Dimensions.t

val next_event_or_wait_delay
  :  t
  -> delay:Time_ns.Span.t
  -> Event.Root_event.t

val image : t -> Node.t -> unit
val release : t -> unit
