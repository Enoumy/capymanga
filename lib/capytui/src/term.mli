open! Core
include module type of Notty_unix.Term

val dimensions : t -> Dimensions.t
val next_event_or_wait_delay : t -> delay:Time_ns.Span.t -> Event.t
