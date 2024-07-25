open! Core

let command =
  Command.basic
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () -> print_endline "End of transmission. Don't panic!"]
;;
