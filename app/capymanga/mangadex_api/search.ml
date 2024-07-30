open! Core
open Async

let search ~title:_ =
  let uri =
    Uri.make ~scheme:"https" ~host:"api.mangadex.org" ~path:"manga" ()
  in
  Deferred.Or_error.try_with (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%map string = Cohttp_async.Body.to_string body in
    string)
;;
