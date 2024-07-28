open! Core
open Bonsai
open Bonsai_test
open Capytui

module Result_spec : sig
  type t =
    { image : Notty.image
    ; set_dimensions : Dimensions.t -> unit Effect.t
    ; dimensions : Dimensions.t
    }

  type incoming = Set_dimensions of { dimensions : Dimensions.t }
end

val create_handle
  :  ?initial_dimensions:Dimensions.t
  -> Notty.image Computation.t
  -> (Result_spec.t, Result_spec.incoming) Handle.t

val set_dimensions
  :  (_, Result_spec.incoming) Handle.t
  -> Dimensions.t
  -> unit
