open! Core
open Bonsai

module For_dimensions : sig
  type t

  val create : term:Term.t -> t
  val update : t -> unit
  val register : t -> 'a Computation.t -> 'a Computation.t
  val set : t -> Dimensions.t -> unit
end

module For_clock : sig
  type t = Bonsai.Time_source.t

  val create : unit -> t
  val advance_to : t -> Time_ns.t -> unit
end

module For_events : sig
  type 'a handle =
    { result : 'a
    ; broadcast_event : Event.t -> unit Effect.t
    }

  val register : 'a Computation.t -> 'a handle Computation.t
end
