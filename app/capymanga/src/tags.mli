open! Core
open Capytui
open Mangadex_api.Types
module Catpuccin := Capytui_catpuccin

val render_tag : flavor:Catpuccin.Flavor.t -> Tag.t -> Node.t
val sort_tags : Tag.t list -> Tag.t list
