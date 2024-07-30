open! Core
open Bonsai
open Capytui

(* This component contains spinner from [charm.sh] *)
module Kind : sig
  type t = Dot (* ⣾ *)
end

val component : kind:Kind.t -> string Value.t -> Node.t Computation.t
