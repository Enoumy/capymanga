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

let register inside =
  let%sub count, inject =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ model ->
        function Activate -> model + 1 | Deactivate -> model - 1)
      ()
  in
  let%sub value =
    let%arr count = count
    and inject = inject in
    count > 0, inject
  in
  Bonsai.Dynamic_scope.set variable value ~inside
;;

let i_am_loading =
  let%sub _, inject = Bonsai.Dynamic_scope.lookup variable in
  let%sub on_activate =
    let%arr inject = inject in
    inject Activate
  in
  let%sub on_deactivate =
    let%arr inject = inject in
    inject Deactivate
  in
  Bonsai.Edge.lifecycle ~on_activate ~on_deactivate ()
;;

let is_something_loading =
  let%sub is_somethig_loading, _ = Bonsai.Dynamic_scope.lookup variable in
  return is_somethig_loading
;;
