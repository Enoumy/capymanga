open! Core

type t = Notty.I.t

val text : ?attrs:Attr.t list -> string -> t
val vcat : t list -> t
val hcat : t list -> t
val sexp_for_debugging : ?attrs:Attr.t list -> Sexp.t -> t
