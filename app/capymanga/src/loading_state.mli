open! Core
open Bonsai

val register
  :  (local_ Bonsai.graph -> 'a Bonsai.t)
  -> local_ Bonsai.graph
  -> 'a Bonsai.t

val i_am_loading : local_ Bonsai.graph -> unit
val is_something_loading : local_ Bonsai.graph -> bool Bonsai.t
