open! Core
open! Bonsai
open! Capytui
open Bonsai.Let_syntax

type t =
  { view : Node.t
  ; string : string
  ; handler : Event.t -> unit Effect.t
  ; set : string -> unit Effect.t
  }

type action =
  | Char of char
  | Uchar of Uchar.t
  | Backspace
  | Clear
  | Set of string

let component ?(extra_attrs = Value.return []) ~is_focused =
  let%sub string, inject =
    Bonsai.state_machine0
      ~default_model:""
      ~apply_action:(fun _ (model : string) (action : action) ->
        match action with
        | Clear -> ""
        | Backspace ->
          if String.is_empty model
          then model
          else String.sub ~pos:0 ~len:(String.length model - 1) model
        | Char char ->
          (* NOTE: This is O(n^2) which is sad... I can't think of anything
             better for now... maybe a reversed list or maybe even a rope
             could be better, but way more complex... *)
          model ^ Char.to_string char
        | Uchar uchar ->
          (* NOTE: This is O(n^2) and also sad... *)
          model ^ Uchar.Utf8.to_string uchar
        | Set s -> s)
      ()
  in
  let%sub set =
    let%arr inject = inject in
    fun value -> inject (Set value)
  in
  let%sub handler =
    let%arr inject = inject in
    fun (event : Event.t) ->
      match event with
      | `Mouse _ | `Paste _ -> Effect.Ignore
      | `Key (`ASCII char, []) -> inject (Char char)
      | `Key (`Uchar uchar, []) -> inject (Uchar uchar)
      | `Key (`ASCII ('U' | 'u'), [ `Ctrl ]) -> inject Clear
      | `Key (`Backspace, []) -> inject Backspace
      | _ -> Effect.Ignore
  in
  let%sub view =
    let%sub text = Text.component in
    let%arr string = string
    and text = text
    and is_focused = is_focused
    and extra_attrs = extra_attrs in
    Node.hcat
      [ text ~attrs:extra_attrs string
      ; (if is_focused
         then text ~attrs:[ Attr.reverse; Attr.blink ] " "
         else Node.none)
      ]
  in
  let%arr string = string
  and view = view
  and handler = handler
  and set = set in
  { view; string; handler; set }
;;
