open! Core
open Bonsai
open Capytui

val component : (?attrs:Attr.t list -> string -> Node.t) Computation.t
