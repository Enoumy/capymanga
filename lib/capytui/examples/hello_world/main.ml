open! Core
open! Bonsai
open! Capytui
open! Bonsai.Let_syntax

let app =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%arr dimensions = dimensions in
  Node.center ~within:dimensions (Node.text "Hello world!")
;;

let command =
  Command.basic
    ~summary:{|An actual capybara!!!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;

let () = Command_unix.run command
