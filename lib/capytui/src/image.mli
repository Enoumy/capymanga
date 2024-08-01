open! Core

type t =
  { url : string
  ; row : int
  ; column : int
  ; dimensions : Dimensions.t
  ; scale : bool
  }
[@@deriving sexp, equal]
