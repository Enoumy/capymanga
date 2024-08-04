open! Core

type t = Notty.I.t

val text : ?attrs:Attr.t list -> string -> t
val vcat : t list -> t
val hcat : t list -> t
val zcat : t list -> t
val dimensions : t -> Dimensions.t
val sexp_for_debugging : ?attrs:Attr.t list -> Sexp.t -> t
val center : t -> within:Dimensions.t -> t
val pad : ?r:int -> ?l:int -> ?t:int -> ?b:int -> t -> t
val crop : ?l:int -> ?r:int -> ?t:int -> ?b:int -> t -> t
val none : t
val height : t -> int
val width : t -> int
