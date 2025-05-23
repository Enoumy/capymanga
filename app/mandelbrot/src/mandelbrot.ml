open! Core
open Async
open! Bonsai
open! Capytui
open! Bonsai.Let_syntax

module View_port = struct
  type t =
    { center : Complex.t
    ; scale : Percent.t
    ; max_iterations : int
    }

  type action =
    | Zoom_in
    | Zoom_out
    | Up
    | Down
    | Left
    | Right
    | Increase_iterations
    | Decreate_iterations

  let default =
    let center = { Complex.real = 0.0; imaginary = 0.0 }
    and scale = Percent.one_hundred_percent
    and max_iterations = 1_000 in
    { center; scale; max_iterations }
  ;;

  let apply_action _ { center; scale; max_iterations } action =
    let center =
      let multiple = 0.1 *. Percent.to_mult scale in
      match action with
      | Zoom_in | Zoom_out | Increase_iterations | Decreate_iterations ->
        center
      | Up -> { center with imaginary = center.imaginary -. multiple }
      | Down -> { center with imaginary = center.imaginary +. multiple }
      | Left -> { center with real = center.real -. multiple }
      | Right -> { center with real = center.real +. multiple }
    and scale =
      match action with
      | Zoom_in -> Percent.( * ) scale (Percent.of_mult 0.9)
      | Zoom_out -> Percent.( * ) scale (Percent.of_mult (1.0 /. 0.9))
      | Up | Down | Left | Right | Increase_iterations | Decreate_iterations
        ->
        scale
    and max_iterations =
      match action with
      | Increase_iterations -> max_iterations + 100
      | Decreate_iterations -> Int.max 100 (max_iterations - 100)
      | _ -> max_iterations
    in
    { center; scale; max_iterations }
  ;;

  let component (local_ graph) =
    Tuple2.uncurry Bonsai.both
    @@ Bonsai.state_machine0 ~default_model:default ~apply_action graph
  ;;
end

let backdrop (local_ graph) =
  let dimensions = Capytui.terminal_dimensions graph in
  let flavor = Capytui_catpuccin.flavor graph in
  let%arr { height; width } = dimensions
  and flavor in
  Node.vcat
    (List.init height ~f:(fun _ ->
       Node.text
         ~attrs:
           [ Attr.background_color (Capytui_catpuccin.color ~flavor Crust) ]
         (String.make width ' ')))
;;

let app (local_ graph) =
  let dimensions = Capytui.terminal_dimensions graph in
  let%sub { center; scale; max_iterations }, inject =
    View_port.component graph
  in
  let drawing_style, inject_drawing_style = Drawing_style.component graph in
  let handler =
    let%arr inject and inject_drawing_style in
    fun (event : Event.t) ->
      match event with
      | `Key (`ASCII '+', []) -> inject Zoom_in
      | `Key (`ASCII '-', []) -> inject Zoom_out
      | `Key (`ASCII 'j', []) -> inject Down
      | `Key (`ASCII 'k', []) -> inject Up
      | `Key (`ASCII 'h', []) -> inject Left
      | `Key (`ASCII 'l', []) -> inject Right
      | `Key (`ASCII 'u', []) -> inject Increase_iterations
      | `Key (`ASCII 'd', []) -> inject Decreate_iterations
      | `Key (`ASCII 'n', []) -> inject_drawing_style Next
      | `Key (`ASCII 'N', []) -> inject_drawing_style Prev
      | _ -> Effect.Ignore
  in
  let () = Capytui.listen_to_events handler graph in
  let result =
    let%arr dimensions and center and scale and max_iterations in
    Render.render ~center ~scale ~max_iterations ~dimensions
  in
  let draw = Drawing_style.draw drawing_style graph in
  let rendered =
    let%arr result and draw and max_iterations in
    draw ~max_iterations result
  in
  let backdrop = backdrop graph in
  let%arr rendered and backdrop in
  Node.zcat [ rendered; backdrop ]
;;

let command =
  Command.async_or_error
    ~summary:{|A small mandelbrot demo.|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let open Deferred.Or_error.Let_syntax in
        let%bind () = Capytui.start app in
        return ()]
;;

module For_testing = struct
  module Render = Render
end
