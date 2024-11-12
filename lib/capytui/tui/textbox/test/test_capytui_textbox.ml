open! Core
open Capytui
open Bonsai_test
open Bonsai
open Bonsai.Let_syntax

module Result_spec = struct
  type t =
    { textbox : Capytui_textbox.t
    ; view : Node.t
    ; set_is_focused : bool -> unit Effect.t
    }

  type incoming =
    | Set_text of string
    | Set_is_focused of bool

  let to_image t = t.view

  let incoming
    { view = _; textbox = { set = set_text; _ }; set_is_focused }
    (action : incoming)
    =
    match action with
    | Set_text text -> set_text text
    | Set_is_focused is_focused -> set_is_focused is_focused
  ;;
end

let component =
  let%sub is_focused, set_is_focused = Bonsai.state false in
  let%sub textbox = Capytui_textbox.component ~is_focused () in
  let%sub view =
    let%arr { string; view; handler = _; set = _ } = textbox in
    Node.vcat [ view; Node.text [%string "Inputed string: \"%{string}\""] ]
  in
  let%sub () =
    let%sub listener =
      let%arr { handler; _ } = textbox in
      handler
    in
    Capytui.listen_to_events listener
  in
  let%arr textbox = textbox
  and set_is_focused = set_is_focused
  and view = view in
  { Result_spec.textbox; view; set_is_focused }
;;

let%expect_test "Sanity printing the textbox" =
  let handle =
    Capytui_test.create_handle_generic
      ~initial_dimensions:{ height = 10; width = 40 }
      ~to_image:Result_spec.to_image
      ~handle_incoming:Result_spec.incoming
      component
  in
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │Inputed string: ""                      │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}];
  Capytui_test.do_actions handle [ Set_text "Capybara!" ];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Capybara!                               │
    │Inputed string: "Capybara!"             │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}];
  Capytui_test.do_actions handle [ Set_is_focused true ];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Capybara!                               │
    │Inputed string: "Capybara!"             │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}]
;;

let%expect_test "Writing sometext onto the textbox." =
  let handle =
    Capytui_test.create_handle_generic
      ~initial_dimensions:{ height = 10; width = 40 }
      ~to_image:Result_spec.to_image
      ~handle_incoming:Result_spec.incoming
      component
  in
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │Inputed string: ""                      │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}];
  (* Entering some text! *)
  String.iter "Capy!" ~f:(fun c ->
    Capytui_test.send_event handle (`Key (`ASCII c, [])));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Capy!                                   │
    │Inputed string: "Capy!"                 │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}];
  (* Pressing backspace. *)
  Capytui_test.send_event handle (`Key (`Backspace, []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Capy                                    │
    │Inputed string: "Capy"                  │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  Fn.apply_n_times
    ~n:2
    (fun () -> Capytui_test.send_event handle (`Key (`Backspace, [])))
    ();
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Ca                                      │
    │Inputed string: "Ca"                    │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  String.iter "baras are really cool!" ~f:(fun c ->
    Capytui_test.send_event handle (`Key (`ASCII c, [])));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │Cabaras are really cool!                │
    │Inputed string: "Cabaras are really cool│
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  (* Clearing the line with ctrl+u *)
  Capytui_test.send_event handle (`Key (`ASCII 'u', [ `Ctrl ]));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │                                        │
    │Inputed string: ""                      │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
  |}];
  (* Uchars! *)
  Capytui_test.send_event
    handle
    (`Key (`Uchar (Uchar.Utf8.of_string "🐹"), []));
  (* TODO: The bad news is that it seems like the width calculation is broken
     when emojis are used. The good news is that this test just tests that we
     are able to enter emojis in the textbox! Maybe I should be using some
     utf-aware way of computing the width of text? *)
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────┐
    │🐹                                    │
    │Inputed string: "🐹"                  │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    │                                        │
    └────────────────────────────────────────┘
    |}]
;;
