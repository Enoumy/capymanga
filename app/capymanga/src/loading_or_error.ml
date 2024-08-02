open! Core

type 'a t =
  | Ok of 'a
  | Error of Error.t
  | Loading
[@@deriving sexp, equal, compare]
