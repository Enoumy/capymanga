open! Core
open Bonsai

val start
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> Notty.image Computation.t
  -> unit
