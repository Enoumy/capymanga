open! Core

type t =
  { row : int
  ; column : int
  }
[@@deriving sexp_of]
