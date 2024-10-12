open! Core
open Bonsai
open Bonsai_test
open Capytui

module Result_spec : sig
  type ('a, 'incoming) t
  type 'a incoming
end

val create_handle_generic
  :  ?initial_dimensions:Dimensions.t
  -> to_image:('a -> Notty.image)
  -> handle_incoming:('a -> 'incoming -> unit Effect.t)
  -> 'a Computation.t
  -> (('a, 'incoming) Result_spec.t, 'incoming Result_spec.incoming) Handle.t

val create_handle
  :  ?initial_dimensions:Dimensions.t
  -> Notty.image Computation.t
  -> ( (Notty.image, Nothing.t) Result_spec.t
       , Nothing.t Result_spec.incoming )
       Handle.t

val set_dimensions
  :  (_, _ Result_spec.incoming) Handle.t
  -> Dimensions.t
  -> unit

val send_event : (_, _ Result_spec.incoming) Handle.t -> Event.t -> unit

val do_actions
  :  (_, 'incoming Result_spec.incoming) Handle.t
  -> 'incoming list
  -> unit
