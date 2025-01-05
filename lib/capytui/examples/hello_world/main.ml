open! Core
open! Bonsai
open! Capytui
open! Bonsai.Let_syntax

let app (local_ graph) =
  let dimensions = Capytui.terminal_dimensions graph in
  let%arr dimensions in
  Node.center ~within:dimensions (Node.text "Hello world!")
;;

let command =
  Async.Command.async_or_error
    ~summary:{|Hello world!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;

let () = Command_unix.run command
