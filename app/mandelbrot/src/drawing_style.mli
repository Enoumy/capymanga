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

val component
  :  local_ Bonsai.graph
  -> t Bonsai.t * (action -> unit Effect.t) Bonsai.t

val draw
  :  t Bonsai.t
  -> local_ Bonsai.graph
  -> (max_iterations:int -> int array array -> Node.t) Bonsai.t
