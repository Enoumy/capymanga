open! Core
open Bonsai
open Bonsai.Let_syntax

type action =
  | Activate
  | Deactivate

let variable : (bool * (action -> unit Effect.t)) Bonsai.Dynamic_scope.t =
  Bonsai.Dynamic_scope.create
    ~name:"is-something-loading?"
    ~fallback:(false, fun _ -> failwith "BUG IN CAPY MANGA")
    ()
;;

let register inside (local_ graph) =
  let count, inject =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ model -> function
        | Activate -> model + 1 | Deactivate -> model - 1)
      graph
  in
  let value =
    let%arr count and inject in
    count > 0, inject
  in
  Bonsai.Dynamic_scope.set variable value ~inside graph
;;

let i_am_loading (local_ graph) =
  let%sub _, inject = Bonsai.Dynamic_scope.lookup variable graph in
  let on_activate =
    let%arr inject in
    inject Activate
  in
  let on_deactivate =
    let%arr inject in
    inject Deactivate
  in
  Bonsai.Edge.lifecycle ~on_activate ~on_deactivate graph
;;

let is_something_loading (local_ graph) =
  let%sub is_somethig_loading, _ =
    Bonsai.Dynamic_scope.lookup variable graph
  in
  is_somethig_loading
;;
