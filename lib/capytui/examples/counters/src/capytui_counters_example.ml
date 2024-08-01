open! Core
open! Bonsai
open! Capytui
open Async
open! Bonsai.Let_syntax

let bg = Capytui_catpuccin.Crust

let backdrop (dimensions : Dimensions.t Value.t) =
  let%sub bg_color = Capytui_catpuccin.color bg in
  let%arr { height; width } = dimensions
  and bg_color = bg_color in
  List.init height ~f:(fun _ ->
    Node.text
      ~attrs:[ Attr.background_color bg_color ]
      (String.make width ' '))
  |> Node.vcat
;;

let text =
  let%sub text_color = Capytui_catpuccin.color Text in
  let%sub crust = Capytui_catpuccin.color bg in
  let%arr text_color = text_color
  and crust = crust in
  fun ?(attrs = []) text ->
    Node.text
      ~attrs:
        ([ Attr.foreground_color text_color; Attr.background_color crust ]
         @ attrs)
      text
;;

let render_instruction key action =
  let%sub text = Capytui_catpuccin.color Text in
  let%sub subtext = Capytui_catpuccin.color Subtext0 in
  let%sub crust = Capytui_catpuccin.color bg in
  let%arr text = text
  and subtext = subtext
  and crust = crust in
  Node.hcat
    [ Node.text
        ~attrs:
          [ Attr.bold
          ; Attr.foreground_color text
          ; Attr.background_color crust
          ]
        key
    ; Node.text ~attrs:[ Attr.background_color crust ] " "
    ; Node.text
        ~attrs:[ Attr.foreground_color subtext; Attr.background_color crust ]
        action
    ]
;;

let instructions =
  let%sub instructions =
    [ "+", "New"
    ; "j", "Down"
    ; "k", "Up"
    ; "l", "Increment"
    ; "h", "Decrement"
    ]
    |> List.map ~f:(fun (key, action) -> render_instruction key action)
    |> Computation.all
  in
  let%sub text = text in
  let%arr instructions = instructions
  and text = text in
  Node.hcat (List.intersperse ~sep:(text "  ") instructions)
;;

let top_bar =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = text in
  let%sub instructions = instructions in
  let%arr text = text
  and mauve = mauve
  and instructions = instructions in
  Node.hcat
    [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Counters!  "
    ; instructions
    ]
;;

let counter_state_machine =
  Bonsai.state_machine0
    ~default_model:(Core.Int.Map.singleton 0 0)
    ~apply_action:(fun _ map ->
      function
      | `New -> Core.Map.set map ~key:(Core.Map.length map) ~data:0
      | `Increment key ->
        Core.Map.update map key ~f:(function None -> 0 | Some x -> x + 1)
      | `Decrement key ->
        Core.Map.update map key ~f:(function None -> 0 | Some x -> x - 1))
    ()
;;

let focus_state_machine counters =
  Bonsai.state_machine1
    ~default_model:0
    ~apply_action:(fun _ counters model action ->
      let result =
        match action with `Increment -> model + 1 | `Decrement -> model - 1
      in
      match counters with
      | Inactive -> 0
      | Active counters -> result % Core.Map.length counters)
    counters
;;

let keyboard_handler ~inject_counters ~inject_focus ~focus =
  let%sub callback =
    let%arr inject_counters = inject_counters
    and inject_focus = inject_focus
    and focus = focus in
    fun (event : Event.t) ->
      match event with
      | `Key (`ASCII 'j', []) | `Key (`Arrow `Down, []) | `Key (`Tab, []) ->
        inject_focus `Increment
      | `Key (`ASCII 'k', [])
      | `Key (`Arrow `Up, [])
      | `Key (`Tab, [ `Shift ]) ->
        inject_focus `Decrement
      | `Key (`ASCII '+', []) -> inject_counters `New
      | `Key (`ASCII 'l', []) | `Key (`Arrow `Right, []) ->
        inject_counters (`Increment focus)
      | `Key (`ASCII 'h', []) | `Key (`Arrow `Left, []) ->
        inject_counters (`Decrement focus)
      | _ -> Effect.Ignore
  in
  Capytui.listen_to_events callback
;;

let counters =
  let%sub top_bar = top_bar in
  let%sub counters, inject_counters = counter_state_machine in
  let%sub focus, inject_focus = focus_state_machine counters in
  let%sub () = keyboard_handler ~inject_counters ~inject_focus ~focus in
  let%sub counters_view =
    let%sub text = text in
    let%sub mauve = Capytui_catpuccin.color Mauve in
    let%arr counters = counters
    and focus = focus
    and text = text
    and mauve = mauve in
    List.map (Core.Map.to_alist counters) ~f:(fun (counter_id, count) ->
      Node.hcat
        [ text
            ~attrs:[ Attr.foreground_color mauve ]
            (if counter_id = focus then ">" else " ")
        ; text [%string " %{count#Int}"]
        ])
    |> Node.vcat
    |> Node.pad ~l:1
  in
  let%arr top_bar = top_bar
  and counters_view = counters_view in
  Node.vcat [ top_bar; Node.text ""; counters_view ]
;;

let app =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub backdrop = backdrop dimensions in
  let%sub counters = counters in
  let%arr backdrop = backdrop
  and counters = counters in
  Node.zcat [ Node.pad ~l:2 ~t:1 counters; backdrop ]
;;

let command =
  Command.async
    ~summary:{|Counters example!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;
