open! Core

type t = Notty.A.t

val many : t list -> t

module Color : sig
  type t = Notty.A.color

  val black : t
  val red : t
  val green : t
  val yellow : t
  val blue : t
  val magenta : t
  val cyan : t
  val white : t
  val lightblack : t
  val lightred : t
  val lightgreen : t
  val lightyellow : t
  val lightblue : t
  val lightmagenta : t
  val lightcyan : t
  val lightwhite : t
  val rgb : r:int -> g:int -> b:int -> t
end

val foreground_color : Color.t -> t
val background_color : Color.t -> t
val bold : t
val italic : t
val underline : t
val blink : t
val reverse : t
