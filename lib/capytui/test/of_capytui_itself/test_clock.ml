open! Core
open Bonsai_test
open Capytui
open Bonsai.Let_syntax

let clock_app (local_ graph) =
  let now =
    Bonsai.Clock.approx_now ~tick_every:(Time_ns.Span.of_sec 1.0) graph
  in
  let dimensions = terminal_dimensions graph in
  let%arr { width; height } = dimensions
  and now in
  Node.center
    (Node.text (Time_ns.to_string_utc now))
    ~within:{ width; height }
;;

let%expect_test "Testing that the clock works (and is also testable!)" =
  let handle = Capytui_test.create_handle clock_app in
  Capytui_test.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                        1970-01-01 00:00:00.000000000Z                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 1.0);
  Handle.show_diff handle;
  [%expect
    {|
      ┌──────────────────────────────────────────────────────────────────────────────┐
      │                                                                              │
      │                                                                              │
      │                                                                              │
      │                                                                              │
    -|│                        1970-01-01 00:00:00.000000000Z                        │
    +|│                        1970-01-01 00:00:01.000000000Z                        │
      │                                                                              │
      │                                                                              │
      │                                                                              │
      │                                                                              │
      └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.9);
  Handle.show_diff handle;
  [%expect {||}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.1);
  Handle.show_diff handle;
  [%expect
    {|
      ┌──────────────────────────────────────────────────────────────────────────────┐
      │                                                                              │
      │                                                                              │
      │                                                                              │
      │                                                                              │
    -|│                        1970-01-01 00:00:01.000000000Z                        │
    +|│                        1970-01-01 00:00:02.000000000Z                        │
      │                                                                              │
      │                                                                              │
      │                                                                              │
      │                                                                              │
      └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
