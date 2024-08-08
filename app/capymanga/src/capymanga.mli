open! Core
open Bonsai
open Capytui

val app : (Node.t * Image.t list) Computation.t
val command : Command.t

module For_testing : sig
  module Outside_world = Outside_world
end
