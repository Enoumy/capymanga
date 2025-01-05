open! Core
open Capytui
open Bonsai

val component
  :  (string * string) list Bonsai.t
  -> local_ Bonsai.graph
  -> Node.t Bonsai.t
