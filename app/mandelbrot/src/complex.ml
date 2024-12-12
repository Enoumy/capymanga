open! Core

type t =
  { real : float
  ; imaginary : float
  }
[@@deriving sexp_of]
