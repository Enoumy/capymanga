open! Core
open Bonsai
open Bonsai.Let_syntax

type 'a t =
  { page : 'a
  ; set_page : replace:bool -> 'a -> unit Effect.t
  ; go_back : unit Effect.t
  }

type 'a state =
  { current : 'a
  ; history : 'a list
  }

type 'a action =
  | Set_page of
      { page : 'a
      ; replace : bool
      }
  | Go_back

let component default_page (local_ graph) =
  let state, inject =
    Bonsai.state_machine0
      ~default_model:{ current = default_page; history = [] }
      ~apply_action:(fun _ model action ->
        match action with
        | Set_page { page = new_page; replace = false } ->
          let history = model.current :: model.history in
          let current = new_page in
          { current; history }
        | Set_page { page = new_page; replace = true } ->
          let history = model.history in
          let current = new_page in
          { current; history }
        | Go_back ->
          (match model.history with
           | [] -> model
           | prev :: tl -> { current = prev; history = tl }))
      graph
  in
  let page =
    let%arr { current; _ } = state in
    current
  in
  let set_page =
    let%arr inject in
    fun ~replace page -> inject (Set_page { page; replace })
  in
  let go_back =
    let%arr inject in
    inject Go_back
  in
  let%arr page and set_page and go_back in
  { page; set_page; go_back }
;;
