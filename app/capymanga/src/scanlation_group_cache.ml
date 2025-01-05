open! Core
open! Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types

type memo =
  (string, Scanlation_group.t Entity.t Or_error.t option) Bonsai.Memo.t

let variable : memo option Bonsai.Dynamic_scope.t =
  Bonsai.Dynamic_scope.create
    ~name:"scanlation-group-cache"
    ~fallback:None
    ()
;;

let memo
  :  local_ Bonsai.graph
  -> (string, Scanlation_group.t Entity.t Or_error.t option) Bonsai.Memo.t
       Bonsai.t
  =
  fun (local_ graph) ->
  Bonsai.Memo.create
    (module String)
    ~f:(fun scanlation_group_id (local_ graph) ->
      let response, set_response = Bonsai.state_opt graph in
      let%sub () =
        match%sub response with
        | None ->
          Loading_state.i_am_loading graph;
          Bonsai.return ()
        | Some _ -> Bonsai.return ()
      in
      let on_activate =
        let scanlation_group =
          Outside_world.Scanlation_group.component graph
        in
        let%arr set_response and scanlation_group and scanlation_group_id in
        let%bind.Effect response = scanlation_group ~scanlation_group_id in
        set_response (Some response)
      in
      let () = Bonsai.Edge.lifecycle ~on_activate graph in
      response)
    graph
;;

let register within (local_ graph) =
  let memo = memo graph in
  let memo =
    let%arr memo in
    Some memo
  in
  Bonsai.Dynamic_scope.set variable memo ~inside:within graph
;;

let fetch ~scanlation_group_id (local_ graph) =
  let memo = Bonsai.Dynamic_scope.lookup variable graph in
  match%sub memo with
  | None ->
    Bonsai.return
      (Some
         (Error
            (Error.of_string
               "BUG: scanlation group cache was never registered")))
  | Some memo ->
    Bonsai.map
      (Bonsai.Memo.lookup
         ~equal:[%equal: string]
         memo
         scanlation_group_id
         graph)
      ~f:Option.join
;;
