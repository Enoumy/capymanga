open! Core
open Bonsai

type 'a t =
  { page : 'a
  ; set_page : replace:bool -> 'a -> unit Effect.t
  ; go_back : unit Effect.t
  }

val component : 'a -> local_ Bonsai.graph -> 'a t Bonsai.t
