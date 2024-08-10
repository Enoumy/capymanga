open! Core
open Bonsai_test
open Capytui_test
open Capytui
open Bonsai
module Outside_world := Capymanga.For_testing.Outside_world
open Mangadex_api.Types

val mock_chainsaw_man_response : Manga.t Lazy.t

val default_manga_search
  :  title:string option
  -> (Manga.t Collection.t, 'a) result Ui_effect.t

val create_handle
  :  ?manga_search:Outside_world.Manga_search.t Value.t
  -> ?manga_cover:Outside_world.Manga_cover.t Value.t
  -> ?author:Outside_world.Author.t Value.t
  -> ?chapter_feed:Outside_world.Chapter_feed.t Value.t
  -> ?initial_dimensions:Dimensions.t
  -> unit
  -> (Result_spec.t, Result_spec.incoming) Handle.t
