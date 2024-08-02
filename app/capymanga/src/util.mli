open! Core
open Bonsai
open Capytui

val sexp_for_debugging
  : (?attrs:Attr.t list -> Sexp.t -> Node.t) Computation.t
