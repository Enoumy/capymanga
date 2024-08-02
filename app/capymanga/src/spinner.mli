open! Core
open Bonsai
open Capytui

(* This component contains spinner from [charm.sh] *)
module Kind : sig
  type t =
    | Dot (* ⣾ *)
    | Fixed (* Loading... *)
end

val component : kind:Kind.t -> string Value.t -> Node.t Computation.t
