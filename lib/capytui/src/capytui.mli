open! Core
module Dimensions = Dimensions
module Capy = Capy
module Node = Node
module Attr = Attr

val start
  :  ?dispose:bool
  -> ?nosig:bool
  -> ?mouse:bool
  -> ?bpaste:bool
  -> ?optimize:bool
  -> ?target_frames_per_second:int
  -> Node.t Bonsai.Computation.t
  -> unit
