open! Core
open Capytui
open Bonsai

(** This library contains hard-coded constants for
    Catpuccin colors: https://github.com/catppuccin/catppuccin *)

type t =
  | Rosewater
  | Flamingo
  | Pink
  | Mauve
  | Red
  | Maroon
  | Peach
  | Yellow
  | Green
  | Teal
  | Sky
  | Sapphire
  | Blue
  | Lavender
  | Text
  | Subtext1
  | Subtext0
  | Overlay2
  | Overlay1
  | Overlay0
  | Surface2
  | Surface1
  | Surface0
  | Base
  | Mantle
  | Crust
[@@deriving sexp, equal, enumerate, compare]

module Flavor : sig
  type color := t

  type t =
    | Mocha
    | Macchiato
    | Frappe
    | Latte
  [@@deriving sexp, equal, enumerate]

  val color : t -> color -> Attr.Color.t
end

include Comparable.S_plain with type t := t

val color : flavor:Flavor.t -> t -> Attr.Color.t
val color' : t Bonsai.t -> local_ Bonsai.graph -> Attr.Color.t Bonsai.t
val flavor : local_ Bonsai.graph -> Flavor.t Bonsai.t

val set_flavor_within
  :  Flavor.t Bonsai.t
  -> (local_ Bonsai.graph -> 'a Bonsai.t)
  -> local_ Bonsai.graph
  -> 'a Bonsai.t
