open! Core
open Async
open Types

let get : cover_id:string -> Cover.t Entity.t Deferred.Or_error.t =
  fun ~cover_id ->
  let uri =
    Uri.make
      ~scheme:"https"
      ~host:"api.mangadex.org"
      ~path:[%string "cover/%{cover_id}"]
      ()
  in
  Deferred.Or_error.try_with_join (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%bind string = Cohttp_async.Body.to_string body in
    let response =
      Or_error.try_with (fun () ->
        Yojson.Safe.from_string string
        |> Entity.t_of_yojson Cover.t_of_yojson)
    in
    let response =
      match response with
      | Ok _ -> response
      | Error error ->
        let string = Yojson.Safe.from_string string |> Yojson.Safe.show in
        Error
          (Error.tag_s
             error
             ~tag:[%message "Error while parsing response" (string : string)])
    in
    Deferred.return response)
;;
