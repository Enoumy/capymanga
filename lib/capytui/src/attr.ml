open! Core

type t = Notty.A.t

let many attrs = List.fold attrs ~init:Notty.A.empty ~f:Notty.A.( ++ )
