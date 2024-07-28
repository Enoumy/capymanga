open! Core
open Bonsai_test
open Capytui
open Bonsai.Let_syntax

let green x =
  Node.text ~attrs:[ Attr.foreground_color Attr.Color.green; Attr.bold ] x
;;

let render_mod mods f name = if List.exists ~f mods then name ^ "+" else ""

let render_event : Event.t -> Node.t =
  fun event ->
  match event with
  | `Key (kind, mods) ->
    (* TODO: Make a non-polymorphic event type and make this less ugly... *)
    (* TODO: It also seems like the underlying notty library is not detecting
       _all_ of the keybindings I would expect it to. (e.g. it does not
       detect Ctrl+Shift+Z as an example... ). It could also be my custom
       setup being weird or even my keyboard doing weird things... *)
    let meta = render_mod mods (function `Meta -> true | _ -> false) "Meta"
    and ctrl = render_mod mods (function `Ctrl -> true | _ -> false) "Ctrl"
    and shift =
      render_mod mods (function `Shift -> true | _ -> false) "Shift"
    in
    let prefix = String.concat [ meta; ctrl; shift ] in
    let key =
      match kind with
      | `ASCII ' ' -> "SPACE"
      | `ASCII c -> Char.to_string c
      | `Uchar uchar -> Uchar.Utf8.to_string uchar
      | ( `Escape | `Enter | `Tab | `Backspace | `Insert | `Delete | `Home
        | `End | `Arrow _ | `Page _ | `Function _ ) as event ->
        let event = (event :> Event.special) in
        Sexp.to_string_mach [%sexp (event : Event.special)]
    in
    Node.hcat
      [ green "Key "
      ; Node.text
          ~attrs:[ Attr.bold; Attr.foreground_color Attr.Color.blue ]
          (prefix ^ key)
      ]
  | `Mouse mouse ->
    Node.hcat
      [ green "Mouse "
      ; Node.text
          ~attrs:[ Attr.bold; Attr.foreground_color Attr.Color.blue ]
          (Sexp.to_string [%sexp (mouse : Event.mouse)])
      ]
  | `Paste (`Start | `End) -> Node.hcat [ green "Paste" ]
;;

let events_app =
  let%sub events, add_event =
    Bonsai.state_machine0
      ~default_model:[]
      ~apply_action:(fun _ events event -> event :: List.take events 30)
      ()
  in
  let%sub () = Capytui.listen_to_events add_event in
  let%arr events = events in
  Node.vcat (Node.text "Press some keys!" :: List.map events ~f:render_event)
;;

let%expect_test "Sending some keys" =
  let handle = Capytui_test.create_handle events_app in
  Capytui_test.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  Handle.recompute_view handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Key (`ASCII 'c', []));
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Key c                                                                         │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
  |}];
  Capytui_test.send_event handle (`Key (`ASCII 'a', []));
  Capytui_test.send_event handle (`Key (`ASCII 'p', []));
  Capytui_test.send_event handle (`Key (`ASCII 'y', []));
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Key y                                                                         │
    │Key p                                                                         │
    │Key a                                                                         │
    │Key c                                                                         │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "Mouse events" =
  let handle = Capytui_test.create_handle events_app in
  Capytui_test.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  Handle.recompute_view handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Mouse (`Press `Left, (0, 0), []));
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Mouse ((Press Left)(0 0)())                                                   │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Mouse (`Release, (2, 5), []));
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Mouse (Release(2 5)())                                                        │
    │Mouse ((Press Left)(0 0)())                                                   │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "Paste events" =
  let handle = Capytui_test.create_handle events_app in
  Capytui_test.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  Handle.recompute_view handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Paste `Start);
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Paste                                                                         │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Key (`ASCII 'y', []));
  Capytui_test.send_event handle (`Key (`ASCII 'p', []));
  Capytui_test.send_event handle (`Key (`ASCII 'a', []));
  Capytui_test.send_event handle (`Key (`ASCII 'c', []));
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Key c                                                                         │
    │Key a                                                                         │
    │Key p                                                                         │
    │Key y                                                                         │
    │Paste                                                                         │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Paste `End);
  Handle.show handle;
  [%expect {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │Press some keys!                                                              │
    │Paste                                                                         │
    │Key c                                                                         │
    │Key a                                                                         │
    │Key p                                                                         │
    │Key y                                                                         │
    │Paste                                                                         │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
