open! Core
open Bonsai

type t = private
  { dispose : bool option
  ; nosig : bool option
  ; mouse : bool option
  ; bpaste : bool option
  ; optimize : bool
  ; target_frames_per_second : int
  ; use_wezterm: bool
  ; app : (Node.t * Image.t list) Computation.t
  }

val create_exn
  :  dispose:bool option
  -> nosig:bool option
  -> mouse:bool option
  -> bpaste:bool option
  -> optimize:bool
  -> target_frames_per_second:int
  -> use_wezterm: bool
  -> app:(Node.t * Image.t list) Computation.t
  -> t
