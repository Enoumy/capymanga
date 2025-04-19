open! Core
module Package = Package

val command : Command.t

module For_testing : sig
  val parse_pacman_qi : string -> Package.t list
end
