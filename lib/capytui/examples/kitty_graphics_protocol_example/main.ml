let print_stringggg = print_string

open! Core
open Async

let command =
  Command.async_or_error
    ~summary:{|Learning about the kitty terminal graphics protocol.|}
    [%map_open.Command
      let () = return () in
      fun () ->
        print_stringggg "\033[14t";
        let line = In_channel.input_line In_channel.stdin in
        print_s [%message (line : string option)];
        Deferred.Or_error.return ()]
;;

let () = Command_unix.run command
