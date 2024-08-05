open! Core
open Capytui
open Bonsai

val component
  :  instructions:(string * string) list Value.t
  -> Node.t Computation.t
