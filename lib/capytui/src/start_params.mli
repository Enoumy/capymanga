open! Core
open Bonsai

type t = private
  { dispose : bool option
  ; nosig : bool option
  ; mouse : bool option
  ; bpaste : bool option
  ; optimize : bool
  ; target_frames_per_second : int
  ; app : local_ Bonsai.graph -> (Node.t * Image.t list) Bonsai.t
  }

val create_exn
  :  dispose:bool option
  -> nosig:bool option
  -> mouse:bool option
  -> bpaste:bool option
  -> optimize:bool
  -> target_frames_per_second:int
  -> app:(local_ Bonsai.graph -> (Node.t * Image.t list) Bonsai.t)
  -> t
