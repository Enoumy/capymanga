open! Core
open Bonsai_test
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

let%expect_test "Testing the example app with attrs" =
  let handle = Test_utils.create_handle clock_app in
  Test_utils.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  [%expect {|
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
  [%expect {|
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
  [%expect {|
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
