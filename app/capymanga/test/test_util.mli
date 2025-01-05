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
  :  ?manga_search:Outside_world.Manga_search.t Bonsai.t
  -> ?manga_cover:Outside_world.Manga_cover.t Bonsai.t
  -> ?author:Outside_world.Author.t Bonsai.t
  -> ?chapter_feed:Outside_world.Chapter_feed.t Bonsai.t
  -> ?scanlation_group:Outside_world.Scanlation_group.t Bonsai.t
  -> ?chapter_images:Outside_world.Chapter_images.t Bonsai.t
  -> ?initial_dimensions:Dimensions.t
  -> unit
  -> ( (Notty.image, Nothing.t) Result_spec.t
       , Nothing.t Result_spec.incoming )
       Handle.t
