open! Core
open Bonsai
open Bonsai_test
open Capytui

module Result_spec : sig
  type t
  type incoming
end

val create_handle
  :  ?initial_dimensions:Dimensions.t
  -> Notty.image Computation.t
  -> (Result_spec.t, Result_spec.incoming) Handle.t

val set_dimensions
  :  (_, Result_spec.incoming) Handle.t
  -> Dimensions.t
  -> unit

val send_event : (_, Result_spec.incoming) Handle.t -> Event.t -> unit
