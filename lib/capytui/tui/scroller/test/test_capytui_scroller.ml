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
  let%sub () =
    let%sub listener =
      let%arr { less_keybindings_handler; inject = _; view = _ } =
        scroller
      in
      less_keybindings_handler
    in
    Capytui.listen_to_events listener
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

let%expect_test "Testing the less keybindings" =
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
  Handle.recompute_view handle;
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
  |}];
  (* Down. *)
  Capytui_test.send_event handle (`Key (`ASCII 'j', []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`Arrow `Down, []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │6                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  (* Up. *)
  Capytui_test.send_event handle (`Key (`ASCII 'k', []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │1                                       │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`Arrow `Up, []));
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
  |}];
  (* Half page down. *)
  Capytui_test.send_event handle (`Key (`ASCII 'd', [ `Ctrl ]));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │6                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`ASCII 'd', []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │4                                       │
    │5                                       │
    │6                                       │
    │7                                       │
    │8                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  (* Half page up. *)
  Capytui_test.send_event handle (`Key (`ASCII 'u', [ `Ctrl ]));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │2                                       │
    │3                                       │
    │4                                       │
    │5                                       │
    │6                                       │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`ASCII 'u', []));
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
  |}];
  (* Bottom. *)
  Capytui_test.send_event handle (`Key (`ASCII 'G', []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │999                                     │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  (* Top. *)
  Fn.apply_n_times
    ~n:2
    (fun () -> Capytui_test.send_event handle (`Key (`ASCII 'g', [])))
    ();
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
  |}];
  (* Top - with a time delay! *)
  Fn.apply_n_times
    ~n:100
    (fun () -> Capytui_test.send_event handle (`Key (`ASCII 'j', [])))
    ();
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │100                                     │
    │101                                     │
    │102                                     │
    │103                                     │
    │104                                     │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Handle.recompute_view handle;
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.3);
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  (* No difference! Waiting 0.3 seconds was too long! *)
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │                                        │
    │100                                     │
    │101                                     │
    │102                                     │
    │103                                     │
    │104                                     │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.295);
  Handle.recompute_view handle;
  (* Waiting 0.295 seconds in between is fine! *)
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
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
