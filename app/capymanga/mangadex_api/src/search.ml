open! Core
open Async
open Types

let search ?title ?limit ?offset () =
  let query =
    List.filter_opt
      [ Option.map title ~f:(fun x -> "title", [ x ])
      ; Option.map limit ~f:(fun limit -> "limit", [ Int.to_string limit ])
      ; Option.map offset ~f:(fun offset ->
          "offset", [ Int.to_string offset ])
      ]
  in
  let uri =
    Uri.make ~scheme:"https" ~host:"api.mangadex.org" ~path:"manga" ~query ()
  in
  Deferred.Or_error.try_with_join (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%bind string = Cohttp_async.Body.to_string body in
    let response =
      Or_error.try_with (fun () ->
        Yojson.Safe.from_string string
        |> Collection.t_of_yojson Manga.t_of_yojson)
    in
    let response =
      match response with
      | Ok _ -> response
      | Error error ->
        let uri = Uri.to_string uri in
        Error
          (Error.tag_s
             error
             ~tag:[%message "Error while hittin uri" (uri : string)])
    in
    Deferred.return response)
;;
