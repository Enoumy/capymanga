open! Core
open Types
open Async

let get ~chapter_id =
  let uri =
    Uri.make
      ~scheme:"https"
      ~host:"api.mangadex.org"
      ~path:[%string "at-home/server/%{chapter_id}"]
      ()
  in
  Deferred.Or_error.try_with_join (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%map string = Cohttp_async.Body.to_string body in
    try
      Ok (Yojson.Safe.from_string string |> Chapter_images.t_of_yojson)
    with
    | exn ->
      let uri = Uri.to_string uri in
      Error
        (Error.tag_s
           (Error.of_exn exn)
           ~tag:
             [%message
               "Error while parsing response from uri" (uri : string)]))
;;
