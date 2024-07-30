open! Core
open Async

let command =
  Command.async_or_error
    ~summary:{|Text executable for testing out the mangadex api.|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let open Deferred.Or_error.Let_syntax in
        let%bind response = Mangadex_api.Search.search ~title:"" in
        print_endline response;
        Deferred.Or_error.return ()]
;;

let () = Command_unix.run command
