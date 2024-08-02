open! Core
open Async
open Mangadex_api.Types

let command =
  Command.async_or_error
    ~summary:{|Text executable for testing out the mangadex api.|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let open Deferred.Or_error.Let_syntax in
        let%bind response =
          Mangadex_api.Search.search ~title:"chainsaw" ~limit:10 ()
        in
        print_s [%message (response : Manga.t Collection.t)];
        Deferred.Or_error.return ()]
;;

let () = Command_unix.run command
