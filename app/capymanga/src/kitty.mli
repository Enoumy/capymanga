open! Core
open Capytui

val open_image
  :  dimensions:Dimensions.t
  -> topleft:Position.t
  -> url:string
  -> unit Effect.t
