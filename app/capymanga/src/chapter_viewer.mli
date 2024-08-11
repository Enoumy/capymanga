open! Core
open Bonsai
open Capytui
open Mangadex_api.Types

val component
  :  dimensions:Dimensions.t Value.t
  -> chapter:Chapter.t Value.t
  -> go_back:unit Ui_effect.t Value.t
  -> Component.t Computation.t
