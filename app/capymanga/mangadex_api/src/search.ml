open! Core
open Async
open Types

let search ~title =
  let uri =
    Uri.make
      ~scheme:"https"
      ~host:"api.mangadex.org"
      ~path:"manga"
      ~query:[ "title", [ title ] ]
      ()
  in
  Deferred.Or_error.try_with_join (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%bind string = Cohttp_async.Body.to_string body in
    let response =
      Or_error.try_with (fun () ->
        Yojson.Safe.from_string string
        |> Collection.t_of_yojson Manga.t_of_yojson)
    in
    Deferred.return response)
;;
