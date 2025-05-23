open! Core
open Mangadex_api.Types
open Bonsai
open Capytui

module type S = sig
  type t

  val component : local_ Bonsai.graph -> t Bonsai.t

  val register_mock
    :  t Bonsai.t
    -> (local_ Bonsai.graph -> 'a Bonsai.t)
    -> local_ Bonsai.graph
    -> 'a Bonsai.t

  val register_real
    :  (local_ Bonsai.graph -> 'a Bonsai.t)
    -> local_ Bonsai.graph
    -> 'a Bonsai.t
end

module type Arg = sig
  type t

  val name : string
  val unregistered : t
  val real : t
end

module Make (Arg : Arg) = struct
  type t = Arg.t

  let variable =
    Bonsai.Dynamic_scope.create ~name:Arg.name ~fallback:Arg.unregistered ()
  ;;

  let component : local_ Bonsai.graph -> t Bonsai.t =
    fun (local_ graph) -> Dynamic_scope.lookup variable graph
  ;;

  let register_mock
    :  t Bonsai.t -> (local_ Bonsai.graph -> 'a Bonsai.t)
    -> local_ Bonsai.graph -> 'a Bonsai.t
    =
    fun handler computation (local_ graph) ->
    Dynamic_scope.set variable handler ~inside:computation graph
  ;;

  let register_real
    :  (local_ Bonsai.graph -> 'a Bonsai.t) -> local_ Bonsai.graph
    -> 'a Bonsai.t
    =
    fun computation (local_ graph) ->
    let handler = Bonsai.return Arg.real in
    Dynamic_scope.set variable handler ~inside:computation graph
  ;;
end

module Manga_cover = Make (struct
    type t = cover_id:string -> Cover.t Entity.t Or_error.t Effect.t

    let name = "mangadex-cover"

    let unregistered ~cover_id =
      raise_s
        [%message
          "mangadex-cover error! handler was never registered!"
            (cover_id : string)]
    ;;

    let real ~cover_id =
      Effect.of_deferred_fun
        (fun cover_id -> Mangadex_api.Cover.get ~cover_id)
        cover_id
    ;;
  end)

module Manga_search = Make (struct
    type t = title:string option -> Manga.t Collection.t Or_error.t Effect.t

    let name = "mangadex-search"

    let unregistered ~title =
      raise_s
        [%message
          "mangadex-search error! handler was never registered!"
            (title : string option)]
    ;;

    let real ~title =
      Effect.of_deferred_fun
        (fun title ->
          Mangadex_api.Search.search
            ~limit:100
            ?title:
              (Option.bind title ~f:(function "" -> None | x -> Some x))
            ())
        title
    ;;
  end)

module Author = Make (struct
    type t = author_id:string -> Author.t Entity.t Or_error.t Effect.t

    let name = "mangadex-author"

    let unregistered ~author_id =
      raise_s
        [%message
          "mangadex-search error! handler was never registered!"
            (author_id : string)]
    ;;

    let real ~author_id =
      Effect.of_deferred_fun
        (fun author_id -> Mangadex_api.Author.get ~author_id)
        author_id
    ;;
  end)

module Chapter_feed = Make (struct
    type t =
      manga_id:Manga_id.t
      -> ascending:bool
      -> ?limit:int
      -> ?offset:int
      -> unit
      -> Chapter.t Collection.t Or_error.t Effect.t

    let name = "mangadex-manga-feed"

    let unregistered ~manga_id ~ascending ?limit ?offset () =
      raise_s
        [%message
          "mangadex-manga-feed error! handler was never registered!"
            (manga_id : Manga_id.t)
            (ascending : bool)
            (limit : int option)
            (offset : int option)]
    ;;

    let real ~manga_id ~ascending ?limit ?offset () =
      Effect.of_deferred_fun
        (fun () ->
          Mangadex_api.Chapter_feed.feed
            ~manga_id
            ~ascending
            ?limit
            ?offset
            ())
        ()
    ;;
  end)

module Chapter_images = Make (struct
    type t = chapter_id:string -> Chapter_images.t Or_error.t Effect.t

    let name = "mangadex-chapter-images"

    let unregistered : t =
      fun ~chapter_id ->
      raise_s
        [%message
          "mangadex-chapter-images error! handler was never registered!"
            (chapter_id : string)]
    ;;

    let real : t =
      fun ~chapter_id ->
      Effect.of_deferred_fun
        (fun () -> Mangadex_api.Chapter_images.get ~chapter_id)
        ()
    ;;
  end)

module Scanlation_group = Make (struct
    type t =
      scanlation_group_id:string
      -> Scanlation_group.t Entity.t Or_error.t Effect.t

    let name = "mangadex-scanlation-group"

    let unregistered : t =
      fun ~scanlation_group_id ->
      raise_s
        [%message
          "mangadex-scanlation-group error! handler was never registered!"
            (scanlation_group_id : string)]
    ;;

    let real : t =
      fun ~scanlation_group_id ->
      Effect.of_deferred_fun
        (fun () -> Mangadex_api.Scanlation_group.get ~scanlation_group_id)
        ()
    ;;
  end)
