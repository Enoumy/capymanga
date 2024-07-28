open! Core
open Capytui
open Bonsai

module Constraint : sig
  type t =
    | Percent of Percent.t
    | Size of int
end

type renderer := Dimensions.t Value.t -> Node.t Computation.t

module type S = sig
  val ( --> ) : renderer * Constraint.t -> renderer -> renderer
  val ( <-- ) : renderer -> renderer * Constraint.t -> renderer
  val ( |^| ) : renderer * Constraint.t -> renderer -> renderer
  val ( |.| ) : renderer * Constraint.t -> renderer -> renderer
end

module Style : sig
  type t = No_border
end

module type Arg = sig
  val style : Style.t
end

module Make (_ : Arg) : S

val split
  :  Style.t
  -> within:Dimensions.t Value.t
  -> left:(Dimensions.t Value.t -> Node.t Computation.t)
  -> right:(Dimensions.t Value.t -> Node.t Computation.t)
  -> Node.t Computation.t
