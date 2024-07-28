open! Core
open! Bonsai
open Bonsai_test

let%expect_test "Really basic sanity test" =
  let handle = Capytui_test.create_handle Capymanga.app in
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                │
    │ System colors:                                                                 │
    │ black        black                                                             │
    │ red          red                                                               │
    │ green        green                                                             │
    │ yellow       yellow                                                            │
    │ blue         blue                                                              │
    │ magenta      magenta                                                           │
    │ cyan         cyan                                                              │
    │ white        white                                                             │
    │ lightblack   lightblack                                                        │
    │ lightred     lightred                                                          │
    │ lightgreen   lightgreen                                                        │
    │ lightyellow  lightyellow                                                       │
    │ lightblue    lightblue                                                         │
    │ lightmagenta lightmagenta                                                      │
    │ lightcyan    lightcyan                                                         │
    │ lightwhite   lightwhite                                                        │
    │                                                                                │
    │ Color cube, 6x6x6:                                                             │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │ Grayscale ramp:                                                                │
    │                                                                                │
    │                                                                                │
    │ 24bit:                                                                         │
    │                                                                                │
    │                                                                                │
    │ Text styles:                                                                   │
    │ empty bold italic underline blink reverse bold/italic rev/underln bold/rev     │
    │                                                                                │
    │ Dimensions                                                                     │
    │ ((width 80)(height 40))                                                        │
    │                                                                                │
    └────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.set_dimensions handle { height = 40; width = 50 };
  Handle.show_diff handle;
  [%expect
    {|
    -|┌────────────────────────────────────────────────────────────────────────────────┐
    +|┌──────────────────────────────────────────────────┐
      │                                                  │
      │ System colors:                                   │
      │ black        black                               │
      │ red          red                                 │
      │ green        green                               │
      │ yellow       yellow                              │
      │ blue         blue                                │
      │ magenta      magenta                             │
      │ cyan         cyan                                │
      │ white        white                               │
      │ lightblack   lightblack                          │
      │ lightred     lightred                            │
      │ lightgreen   lightgreen                          │
      │ lightyellow  lightyellow                         │
      │ lightblue    lightblue                           │
      │ lightmagenta lightmagenta                        │

      │                                                  │
      │ Color cube, 6x6x6:                               │
      │                                                  │
      │                                                  │
      │                                                  │
      │                                                  │
      │                                                  │
      │                                                  │
      │                                                  │
      │ Grayscale ramp:                                  │
      │                                                  │
      │                                                  │
      │ 24bit:                                           │
      │                                                  │
      │                                                  │
      │ Text styles:                                     │
    -|│ empty bold italic underline blink reverse bold/italic rev/underln bold/rev     │
    +|│ empty bold italic underline blink reverse bold/it│
      │                                                  │
      │ Dimensions                                       │
    -|│ ((width 80)(height 40))                                                        │
    +|│ ((width 50)(height 40))                          │
      │                                                  │
    -|└────────────────────────────────────────────────────────────────────────────────┘
    +|└──────────────────────────────────────────────────┘
    |}]
;;
