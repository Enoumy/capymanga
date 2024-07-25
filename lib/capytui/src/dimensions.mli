open! Core

type t =
  { height : int
  ; width : int
  }
[@@deriving sexp_of, equal]

module Private : sig
  val variable : t Bonsai.Dynamic_scope.t
end
