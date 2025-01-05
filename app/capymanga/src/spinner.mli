open! Core
open Bonsai
open Capytui

(* This component contains spinner from [charm.sh] *)
module Kind : sig
  type t =
    | Dot (* ⣾ *)
    | Fixed (* Loading... *)
end

val component
  :  kind:Kind.t
  -> string Bonsai.t
  -> local_ Bonsai.graph
  -> Node.t Bonsai.t
