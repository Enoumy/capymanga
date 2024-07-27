open! Core
open! Bonsai
open Capytui
open Bonsai.Let_syntax

let app =
  let%sub dimensions = Capy.terminal_dimensions in
  let%arr { width; height } = dimensions in
  let number_attr =
    Attr.many [ Attr.foreground_color Attr.Color.blue; Attr.bold ]
  in
  let number n = Node.text ~attrs:[ number_attr ] [%string "%{n#Int}"] in
  let image =
    Node.hcat
      [ Node.text "("
      ; number width
      ; Node.text " x "
      ; number height
      ; Node.text ")"
      ]
  in
  Node.center image ~within:{ width; height }
;;

let command =
  Command.basic
    ~summary:{|Capy dimensions!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.Start.start app]
;;

let () = Command_unix.run command
