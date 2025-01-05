open! Core
open Bonsai
open Capytui

val sexp_for_debugging
  :  local_ Bonsai.graph
  -> (?attrs:Attr.t list -> Sexp.t -> Node.t) Bonsai.t

val normalize_string_lossy : string -> string
