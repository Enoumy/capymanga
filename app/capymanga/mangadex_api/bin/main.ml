open! Core
open Async
open Mangadex_api.Types

let command =
  Command.async_or_error
    ~summary:{|Testing executable for testing out the mangadex api.|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let open Deferred.Or_error.Let_syntax in
        let%bind response =
          Mangadex_api.Chapter_feed.feed
            ~manga_id:
              (Manga_id.of_string "736a2bf0-f875-4b52-a7b4-e8c40505b68a")
            ~ascending:true
            ~limit:100
            ()
        in
        print_s [%message (response : Chapter.t Collection.t)];
        Deferred.Or_error.return ()]
;;

let () = Command_unix.run command
