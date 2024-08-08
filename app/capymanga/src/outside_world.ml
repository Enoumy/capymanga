open! Core
open Mangadex_api.Types
open Bonsai
open Capytui

module Manga_cover = struct
  type t = cover_id:string -> Cover.t Entity.t Or_error.t Effect.t

  let variable =
    Bonsai.Dynamic_scope.create
      ~name:"manga-cover"
      ~fallback:(fun ~cover_id ->
        raise_s
          [%message
            "manga-cover error! handler was never registered!"
              (cover_id : string)])
      ()
  ;;

  let component : t Computation.t = Dynamic_scope.lookup variable

  let register_mock : t Value.t -> 'a Computation.t -> 'a Computation.t =
    fun handler computation ->
    Dynamic_scope.set variable handler ~inside:computation
  ;;

  let register_real : 'a Computation.t -> 'a Computation.t =
    fun computation ->
    let handler =
      Value.return
      @@ fun ~cover_id ->
      Effect.of_deferred_fun
        (fun cover_id -> Mangadex_api.Cover.get ~cover_id)
        cover_id
    in
    Dynamic_scope.set variable handler ~inside:computation
  ;;
end
