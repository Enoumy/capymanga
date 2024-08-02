open! Core
open Bonsai

val register : 'a Computation.t -> 'a Computation.t
val i_am_loading : unit Computation.t
val is_something_loading : bool Computation.t
