open! Core
open Bonsai

val register_real : 'a Computation.t -> 'a Computation.t

module For_testing : sig
  val register_mock : 'a Computation.t -> 'a Computation.t
end
