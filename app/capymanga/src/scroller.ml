open! Core
open Bonsai.Let_syntax
open Capytui

type action =
  | Scroll_to of int
  | Up
  | Down
  | Top
  | Bottom
  | Up_half_screen
  | Down_half_screen

type inner_action =
  | Public_action of action
  | Single_g
  | Not_g

type input =
  { dimensions : Dimensions.t
  ; content_height : int
  ; time_source : Bonsai.Time_source.t
  }

type t =
  { view : Node.t
  ; inject : action -> unit Effect.t
  ; less_keybindings_handler : Event.t -> unit Effect.t
  }

type model =
  { offset : int
  ; last_time_g_was_pressed : Time_ns.t option
  }

let apply_action _ input { offset; last_time_g_was_pressed } action =
  match input with
  | Bonsai.Computation_status.Inactive -> { offset; last_time_g_was_pressed }
  | Active
      { dimensions = { Dimensions.height; width = _ }
      ; content_height
      ; time_source
      } ->
    let time_interval = Time_ns.Span.of_sec 0.3 in
    let now = Bonsai.Time_source.now time_source in
    let offset =
      match action with
      | Public_action (Scroll_to scroll_to) ->
        let min = offset in
        let max = offset + height - 1 in
        if scroll_to >= min && scroll_to <= max
        then offset
        else if scroll_to > max
        then offset + (scroll_to - max)
        else scroll_to
      | Public_action Up -> Int.max 0 (offset - 1)
      | Public_action Up_half_screen -> Int.max 0 (offset - (height / 2))
      | Public_action Down -> Int.min (content_height - 1) (offset + 1)
      | Public_action Down_half_screen ->
        Int.min (content_height - 1) (offset + (height / 2))
      | Public_action Top -> 0
      | Public_action Bottom -> content_height - 1
      | Not_g -> offset
      | Single_g ->
        (match last_time_g_was_pressed with
         | None -> offset
         | Some last ->
           (match Time_ns.Span.O.(Time_ns.diff now last < time_interval) with
            | true -> 0
            | false -> offset))
    in
    let last_time_g_was_pressed =
      match action with
      | Single_g ->
        (match last_time_g_was_pressed with
         | None -> Some now
         | Some last ->
           (match Time_ns.Span.O.(Time_ns.diff now last < time_interval) with
            | true -> None
            | false -> Some now))
      | Not_g -> None
      | _ -> last_time_g_was_pressed
    in
    { offset; last_time_g_was_pressed }
;;

let use_less_keybindings
  (event : Event.t)
  (inject : inner_action -> unit Effect.t)
  =
  let%bind.Effect () =
    match event with
    | `Key (`ASCII 'g', []) -> Effect.Ignore
    | _ -> inject Not_g
  in
  match event with
  | `Key (`ASCII 'j', [])
  | `Key (`Arrow `Down, [])
  | `Key (`ASCII ('e' | 'E'), [ `Ctrl ]) ->
    inject (Public_action Down)
  | `Key (`ASCII 'd', ([ `Ctrl ] | [])) | `Key (`ASCII 'D', [ `Ctrl ]) ->
    inject (Public_action Down_half_screen)
  | `Key (`ASCII 'u', ([ `Ctrl ] | [])) | `Key (`ASCII 'U', [ `Ctrl ]) ->
    inject (Public_action Up_half_screen)
  | `Key (`ASCII 'k', [])
  | `Key (`Arrow `Up, [])
  | `Key (`ASCII ('y' | 'Y'), [ `Ctrl ]) ->
    inject (Public_action Up)
  | `Key (`ASCII 'g', []) -> inject Single_g
  | `Key (`ASCII 'G', []) -> inject (Public_action Bottom)
  | _ -> Effect.Ignore
;;

let component ~dimensions node =
  let%sub content_height =
    let%arr node = node in
    Node.height node
  in
  let%sub { offset; last_time_g_was_pressed = _ }, inject =
    let%sub input =
      let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
      let%arr content_height = content_height
      and dimensions = dimensions
      and time_source = time_source in
      { content_height; dimensions; time_source }
    in
    Bonsai.state_machine1
      ~default_model:{ offset = 0; last_time_g_was_pressed = None }
      ~apply_action
      input
  in
  let%sub view =
    let%arr node = node
    and offset = offset
    and content_height = content_height
    and dimensions = dimensions in
    let view = Node.crop ~t:offset node in
    Node.crop
      ~b:(Int.max 0 (content_height - dimensions.Dimensions.height - offset))
      view
  in
  let%sub less_keybindings_handler =
    let%arr inject = inject in
    fun event -> use_less_keybindings event inject
  in
  let%sub inject =
    let%arr inject = inject in
    fun action -> inject (Public_action action)
  in
  let%arr view = view
  and inject = inject
  and less_keybindings_handler = less_keybindings_handler in
  { view; inject; less_keybindings_handler }
;;
