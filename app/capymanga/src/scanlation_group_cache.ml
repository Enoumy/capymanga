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
  : (string, Scanlation_group.t Entity.t Or_error.t option) Bonsai.Memo.t
      Computation.t
  =
  Bonsai.Memo.create
    (module String)
    ~f:(fun scanlation_group_id ->
      let%sub response, set_response = Bonsai.state_opt () in
      let%sub () =
        match%sub response with
        | None -> Loading_state.i_am_loading
        | Some _ -> Bonsai.const ()
      in
      let%sub on_activate =
        let%sub scanlation_group =
          Outside_world.Scanlation_group.component
        in
        let%arr set_response = set_response
        and scanlation_group = scanlation_group
        and scanlation_group_id = scanlation_group_id in
        let%bind.Effect response = scanlation_group ~scanlation_group_id in
        set_response (Some response)
      in
      let%sub () = Bonsai.Edge.lifecycle ~on_activate () in
      return response)
;;

let register within =
  let%sub memo = memo in
  let%sub memo =
    let%arr memo = memo in
    Some memo
  in
  Bonsai.Dynamic_scope.set variable memo ~inside:within
;;

let fetch ~scanlation_group_id =
  let%sub memo = Bonsai.Dynamic_scope.lookup variable in
  match%sub memo with
  | None ->
    Bonsai.const
      (Some
         (Error
            (Error.of_string
               "BUG: scanlation group cache was never registered")))
  | Some memo ->
    Computation.map
      (Bonsai.Memo.lookup ~equal:[%equal: string] memo scanlation_group_id)
      ~f:Option.join
;;
