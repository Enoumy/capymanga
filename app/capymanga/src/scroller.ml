open! Core
open Bonsai.Let_syntax
open Capytui

type action =
  | Scroll_to of int
  | Up
  | Down

type input =
  { dimensions : Dimensions.t
  ; content_height : int
  }

type t =
  { view : Node.t
  ; inject : action -> unit Effect.t
  }

let apply_action _ input offset action =
  match input with
  | Bonsai.Computation_status.Inactive -> offset
  | Active { dimensions = { Dimensions.height; width = _ }; content_height }
    ->
    (match action with
     | Scroll_to scroll_to ->
       let min = offset in
       let max = offset + height - 1 in
       if scroll_to >= min && scroll_to <= max
       then offset
       else if scroll_to > max
       then offset + (scroll_to - max)
       else scroll_to
     | Up -> Int.max 0 (offset - 1)
     | Down -> Int.min (content_height - 1) (offset + 1))
;;

let component ~dimensions node =
  let%sub content_height =
    let%arr node = node in
    Node.height node
  in
  let%sub offset, inject =
    let%sub input =
      let%arr content_height = content_height
      and dimensions = dimensions in
      { content_height; dimensions }
    in
    Bonsai.state_machine1 ~default_model:0 ~apply_action input
  in
  let%sub view =
    let%arr node = node
    and offset = offset
    and content_height = content_height
    and dimensions = dimensions in
    let view = Node.crop ~t:offset node in
    Node.crop
      ~b:(Int.max 0 (content_height - dimensions.Dimensions.height))
      view
  in
  let%arr view = view
  and inject = inject in
  { view; inject }
;;
