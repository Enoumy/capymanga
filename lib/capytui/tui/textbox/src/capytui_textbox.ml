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

let component
  ?(cursor_attrs = Value.return [])
  ?(text_attrs = Value.return [])
  ~is_focused
  ()
  =
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
      (* TODO: Implement the abilityof moving the cursor around. *)
      match event with
      | `Mouse _ | `Paste _ -> Effect.Ignore
      | `Key (`ASCII char, []) -> inject (Char char)
      | `Key (`Uchar uchar, []) -> inject (Uchar uchar)
      | `Key (`ASCII ('U' | 'u'), [ `Ctrl ]) -> inject Clear
      | `Key (`Backspace, []) -> inject Backspace
      | _ -> Effect.Ignore
  in
  let%sub view =
    let%arr string = string
    and is_focused = is_focused
    and cursor_attrs = cursor_attrs
    and text_attrs = text_attrs in
    Node.hcat
      [ Node.text ~attrs:text_attrs string
      ; (if is_focused
         then
           Node.text ~attrs:(cursor_attrs @ [ Attr.reverse; Attr.blink ]) " "
         else Node.none)
      ]
  in
  let%arr string = string
  and view = view
  and handler = handler
  and set = set in
  { view; string; handler; set }
;;
