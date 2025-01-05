open! Core
open Bonsai
open Capytui

val component
  :  local_ Bonsai.graph
  -> (?attrs:Attr.t list -> string -> Node.t) Bonsai.t
