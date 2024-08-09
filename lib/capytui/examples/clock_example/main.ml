open! Core
open! Bonsai
open Capytui
open Bonsai.Let_syntax

let ( >> ) a b = Fn.compose a b

let render_date (date : Date.t) =
  let t f =
    Node.text
      ~attrs:[ Attr.foreground_color Attr.Color.blue ]
      (Int.to_string (f date))
  in
  let year = t Date.year in
  let month = t (Month.to_int >> Date.month) in
  let day = t Date.day in
  Node.hcat [ year; Node.text "-"; month; Node.text "-"; day ]
;;

let render_time_of_day (time_of_day : Time_ns.Ofday.t) =
  Node.text
    ~attrs:[ Attr.bold; Attr.foreground_color Attr.Color.green ]
    (Time_ns.Ofday.to_sec_string time_of_day)
;;

let clock_app =
  let%sub now =
    Bonsai.Clock.approx_now ~tick_every:(Time_ns.Span.of_sec 1.0)
  in
  let%sub dimensions = terminal_dimensions in
  let%arr { width; height } = dimensions
  and now = now in
  let date = Time_ns.to_date ~zone:(force Timezone.local) now in
  let date = render_date date in
  let time_of_day = Time_ns.to_ofday ~zone:(force Timezone.local) now in
  let time_of_day = render_time_of_day time_of_day in
  Node.center
    ~within:{ width; height }
    (Node.hcat [ date; Node.text " "; time_of_day ])
;;

let command =
  Async.Command.async_or_error
    ~summary:{|A capytui demo showcasing clock!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start clock_app]
;;

let () = Command_unix.run command
