open! Core
open Bonsai
open Capytui

val app : local_ Bonsai.graph -> (Node.t * Image.t list) Bonsai.t
val command : Command.t

module For_testing : sig
  module Outside_world = Outside_world
end
