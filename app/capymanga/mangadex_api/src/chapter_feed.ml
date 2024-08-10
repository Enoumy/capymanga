open! Core
open Async
open Types

let feed ~manga_id ~ascending ?limit ?offset () =
  let order = if ascending then "asc" else "desc" in
  let query =
    List.filter_opt
      [ Option.map limit ~f:(fun limit -> "limit", [ Int.to_string limit ])
      ; Some ("order[volume]", [ order ])
      ; Some ("order[chapter]", [ order ])
      ; Some ("translatedLanguage[]", [ (* TODO: do not hardcode... *) "en" ])
      ; Some ("includes[]", [ "manga" ])
      ; Option.map offset ~f:(fun offset ->
          "offset", [ Int.to_string offset ])
      ]
  in
  let uri =
    Uri.make
      ~scheme:"https"
      ~host:"api.mangadex.org"
      ~path:[%string "manga/%{manga_id#Manga_id}/feed"]
      ~query
      ()
  in
  Deferred.Or_error.try_with_join (fun () ->
    let%bind _, body = Cohttp_async.Client.get uri in
    let%map string = Cohttp_async.Body.to_string body in
    try
      Ok
        (Yojson.Safe.from_string string
         |> Collection.t_of_yojson Chapter.t_of_yojson)
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
