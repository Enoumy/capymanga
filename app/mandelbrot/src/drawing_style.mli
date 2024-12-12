open! Core
open Bonsai
open Capytui

type t =
  | Basic
  | Unicode
  | Green
[@@deriving enumerate]

type action =
  | Next
  | Prev

val component : (t * (action -> unit Effect.t)) Computation.t

val draw
  :  t Value.t
  -> (max_iterations:int -> int array array -> Node.t) Computation.t
