open! Core
open Bonsai

module For_dimensions = struct
  type t =
    { var : Dimensions.t Bonsai.Var.t
    ; term : Term.t
    }

  let create ~term =
    let var = Bonsai.Var.create (Term.dimensions term) in
    { var; term }
  ;;

  let set { var; term = _ } dimensions = Bonsai.Var.set var dimensions

  let update ({ term; var } as t) =
    let new_dimensions = Term.dimensions term in
    if not ([%equal: Dimensions.t] (Var.get var) new_dimensions)
    then set t new_dimensions
  ;;

  let register { term = _; var } computation =
    Bonsai.Dynamic_scope.set
      Dimensions.Private.variable
      (Bonsai.Var.value var)
      ~inside:computation
  ;;
end

module For_clock = struct
  type t = Bonsai.Time_source.t

  let create () = Bonsai.Time_source.create ~start:(Time_ns.now ())

  let advance_to clock to_ =
    Bonsai.Time_source.advance_clock clock ~to_;
    Bonsai.Time_source.Private.flush clock
  ;;
end

module For_events = struct
  open Bonsai.Let_syntax

  type 'a handle =
    { result : 'a
    ; broadcast_event : Event.t -> unit Effect.t
    }

  let apply_action _ (model : (Event.t -> unit Effect.t) String.Map.t)
    = function
    | Event.Private.On_change { callback; bonsai_path } ->
      Core.Map.set model ~key:bonsai_path ~data:callback
    | Deactivate { bonsai_path } -> Core.Map.remove model bonsai_path
  ;;

  let register app =
    let%sub handlers, inject =
      Bonsai.state_machine0 ~default_model:String.Map.empty ~apply_action ()
    in
    let%sub broadcast_event =
      let%arr handlers = handlers in
      fun event ->
        Effect.all_unit
          (List.map (Core.Map.data handlers) ~f:(fun handler ->
             handler event))
    in
    let%sub result =
      Bonsai.Dynamic_scope.set
        Event.Private.listener_registry_variable
        inject
        ~inside:app
    in
    let%arr result = result
    and broadcast_event = broadcast_event in
    { result; broadcast_event }
  ;;
end
