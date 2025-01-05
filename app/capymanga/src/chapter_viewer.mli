open! Core
open Bonsai
open Capytui
open Mangadex_api.Types

val component
  :  dimensions:Dimensions.t Bonsai.t
  -> chapter:Chapter.t Bonsai.t
  -> go_back:unit Ui_effect.t Bonsai.t
  -> local_ Bonsai.graph
  -> Component.t Bonsai.t
