open! Core
open! Bonsai
open Capytui
open Bonsai.Let_syntax

let clock_app =
  let%sub now =
    Bonsai.Clock.approx_now ~tick_every:(Time_ns.Span.of_sec 1.0)
  in
  let%sub dimensions = Capy.terminal_dimensions in
  let%arr { width; height } = dimensions
  and now = now in
  Node.center
    (Node.text (Time_ns.to_string_utc now))
    ~within:{ width; height }
;;

let command =
  Command.basic
    ~summary:{|A capytui demo showcasing clock!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.Start.start clock_app]
;;

let () = Command_unix.run command
