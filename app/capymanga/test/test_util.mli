open! Core
open Bonsai_test
open Capytui_test
open Capytui
open Bonsai
module Outside_world := Capymanga.For_testing.Outside_world

val create_handle
  :  ?manga_search:Outside_world.Manga_search.t Value.t
  -> ?manga_cover:Outside_world.Manga_cover.t Value.t
  -> ?initial_dimensions:Dimensions.t
  -> unit
  -> (Result_spec.t, Result_spec.incoming) Handle.t
