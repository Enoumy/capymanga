open! Core
open! Bonsai
open Capytui
open Bonsai.Let_syntax

type t =
  | Basic
  | Unicode
  | Green
[@@deriving enumerate]

type action =
  | Next
  | Prev

let component (local_ graph) =
  let all = Array.of_list all in
  let current, inject =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ x action ->
        let offset = match action with Prev -> -1 | Next -> 1 in
        (x + offset) % Array.length all)
      graph
  in
  let current =
    let%arr current in
    all.(current)
  in
  current, inject
;;

let iter_on_pixels result ~f =
  let rows =
    Array.to_list result
    |> List.map ~f:(fun row ->
      let columns = Array.to_list row |> List.map ~f in
      Node.hcat columns)
  in
  Node.vcat rows
;;

let draw t (local_ graph) =
  let text = Text.component graph in
  let flavor = Capytui_catpuccin.flavor graph in
  match%sub t with
  | Basic ->
    let%arr text in
    fun ~max_iterations result ->
      let string =
        String.concat_array ~sep:"\n"
        @@ Array.map result ~f:(fun line ->
          String.concat_array
          @@ Array.map line ~f:(fun iteration ->
            if iteration > max_iterations / 2 then "X" else "."))
      in
      Node.vcat (String.split ~on:'\n' string |> List.map ~f:text)
  | Unicode ->
    let%arr text and flavor in
    fun ~max_iterations result ->
      iter_on_pixels result ~f:(fun iteration ->
        if iteration > max_iterations / 2
        then
          text
            ~attrs:
              [ Attr.background_color (Capytui_catpuccin.color ~flavor Text)
              ]
            " "
        else text " ")
  | Green ->
    let%arr text in
    fun ~max_iterations result ->
      iter_on_pixels result ~f:(fun iteration ->
        let quotient =
          Float.of_int iteration /. Float.of_int max_iterations
        in
        let color =
          Render.lerp 0.0 255.0 (Percent.of_mult quotient) |> Int.of_float
        in
        if iteration > max_iterations / 2
        then
          text
            ~attrs:
              [ Attr.background_color
                  (Attr.Color.rgb ~r:color ~g:255 ~b:color)
              ]
            " "
        else
          text
            ~attrs:
              [ Attr.background_color (Attr.Color.rgb ~r:0 ~g:color ~b:0) ]
            " ")
;;
