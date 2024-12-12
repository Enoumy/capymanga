open! Core
open Capytui

val lerp : float -> float -> Percent.t -> float

val render
  :  center:Complex.t
  -> scale:Percent.t
  -> max_iterations:int
  -> dimensions:Dimensions.t
  -> int array array
