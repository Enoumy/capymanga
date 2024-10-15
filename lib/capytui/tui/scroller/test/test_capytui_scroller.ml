open! Core
open Capytui
open Bonsai_test
open Bonsai
open Bonsai.Let_syntax

module Offset = struct
  type t =
    { left : int
    ; top : int
    }
end

module Result_spec = struct
  type t =
    { scroller : Capytui_scroller.t
    ; set_dimensions : Dimensions.t -> unit Effect.t
    ; set_offset : Offset.t -> unit Effect.t
    ; view : Node.t
    }

  type incoming =
    | Set_dimensions of Dimensions.t
    | Set_offset of Offset.t

  let to_image t = t.view

  let incoming
    { scroller = _; set_dimensions; set_offset; view = _ }
    (action : incoming)
    =
    match action with
    | Set_dimensions dimensions -> set_dimensions dimensions
    | Set_offset offset -> set_offset offset
  ;;
end

let component =
  let%sub dimensions, set_dimensions =
    Bonsai.state { Dimensions.height = 10; width = 40 }
  in
  let%sub offset, set_offset = Bonsai.state { Offset.left = 0; top = 0 } in
  let%sub content =
    Bonsai.const
      (Node.vcat
         (List.init 1000 ~f:(fun i -> Node.text [%string "%{i#Int}"])))
  in
  let%sub scroller = Capytui_scroller.component ~dimensions content in
  let%sub view =
    let%arr { view; _ } = scroller
    and { left; top } = offset in
    Node.pad ~l:left ~t:top view
  in
  let%arr scroller = scroller
  and set_dimensions = set_dimensions
  and set_offset = set_offset
  and view = view in
  { Result_spec.scroller; set_dimensions; set_offset; view }
;;

let%expect_test "Sanity printing the handle." =
  let handle =
    Capytui_test.create_handle_generic
      ~initial_dimensions:{ height = 10; width = 40 }
      ~to_image:Result_spec.to_image
      ~handle_incoming:Result_spec.incoming
      component
  in
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │0                                       │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │6                                       │
    │7                                       │
    │8                                       │
    │9                                       │
    └────────────────────────────────────────┘
    |}];
  (* We make the scrollable container smaller. *)
  Capytui_test.do_actions
    handle
    [ Set_dimensions { height = 5; width = 40 } ];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │0                                       │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.do_actions handle [ Set_offset { left = 0; top = 2 } ];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │0                                       │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}]
;;

let%expect_test "Sanity printing the handle." =
  let handle =
    Capytui_test.create_handle_generic
      ~initial_dimensions:{ height = 10; width = 40 }
      ~to_image:Result_spec.to_image
      ~handle_incoming:Result_spec.incoming
      component
  in
  Capytui_test.do_actions
    handle
    [ Set_dimensions { height = 5; width = 40 }
    ; Set_offset { left = 0; top = 2 }
    ];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │0                                       │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}]
;;
