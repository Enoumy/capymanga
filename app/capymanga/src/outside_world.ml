open! Core
open Mangadex_api.Types
open Bonsai
open Capytui

module type S = sig
  type t

  val component : t Computation.t
  val register_mock : t Value.t -> 'a Computation.t -> 'a Computation.t
  val register_real : 'a Computation.t -> 'a Computation.t
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

  let component : t Computation.t = Dynamic_scope.lookup variable

  let register_mock : t Value.t -> 'a Computation.t -> 'a Computation.t =
    fun handler computation ->
    Dynamic_scope.set variable handler ~inside:computation
  ;;

  let register_real : 'a Computation.t -> 'a Computation.t =
    fun computation ->
    let handler = Value.return Arg.real in
    Dynamic_scope.set variable handler ~inside:computation
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
