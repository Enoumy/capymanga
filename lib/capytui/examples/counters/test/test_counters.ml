open! Core
open Bonsai_test

let app = Capytui_counters_example.app

let press handle string =
  String.iter string ~f:(fun c ->
    Capytui_test.send_event handle (`Key (`ASCII c, [])))
;;

let%expect_test "Really basic testing of the terminal app!" =
  let handle = Capytui_test.create_handle app in
  Capytui_test.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  Handle.recompute_view handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │   > 0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  press handle "+++";
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │   > 0                                                                        │
    │     0                                                                        │
    │     0                                                                        │
    │     0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  press handle "lll";
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │   > 3                                                                        │
    │     0                                                                        │
    │     0                                                                        │
    │     0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  press handle "jj";
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │     3                                                                        │
    │     0                                                                        │
    │   > 0                                                                        │
    │     0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  (* TODO: Hmm, I think needing to do a recompute here is pretty sad... I
     _think_ this frame delay is introduced by the dynamic scope callback
     registry. *)
  Handle.recompute_view handle;
  press handle "ll";
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │     3                                                                        │
    │     0                                                                        │
    │   > 2                                                                        │
    │     0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  press handle "hhhhhhhhhhh";
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │  Counters!  + New  j Down  k Up  l Increment  h Decrement                    │
    │                                                                              │
    │     3                                                                        │
    │     0                                                                        │
    │   > -9                                                                       │
    │     0                                                                        │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
