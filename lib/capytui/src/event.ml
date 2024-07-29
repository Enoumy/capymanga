open! Core

type special =
  [ `Escape
  | `Enter
  | `Tab
  | `Backspace
  | `Insert
  | `Delete
  | `Home
  | `End
  | `Arrow of [ `Up | `Down | `Left | `Right ]
  | `Page of [ `Up | `Down ]
  | `Function of int
  ]
[@@deriving sexp_of]

type button =
  [ `Left
  | `Middle
  | `Right
  | `Scroll of [ `Up | `Down ]
  ]
[@@deriving sexp_of]

type mods = [ `Meta | `Ctrl | `Shift ] list [@@deriving sexp_of]

type key = [ special | `Uchar of Uchar.t | `ASCII of char ] * mods
[@@deriving sexp_of]

type mouse = [ `Press of button | `Drag | `Release ] * (int * int) * mods
[@@deriving sexp_of]

type paste =
  [ `Start
  | `End
  ]
[@@deriving sexp_of]

type t =
  [ `Key of key
  | `Mouse of mouse
  | `Paste of paste
  ]
[@@deriving sexp_of]

module Root_event = struct
  type t =
    [ Notty.Unescape.event
    | `Resize of int * int
    | `End
    | `Timer
    ]
end

module Private = struct
  open Bonsai

  type action =
    | On_change of
        { bonsai_path : string
        ; callback : t -> unit Effect.t
        }
    | Deactivate of { bonsai_path : string }

  let listener_registry_variable =
    Dynamic_scope.create
      ~name:"event handler"
      ~fallback:(fun (_ : action) ->
        let _ =
          failwith
            "BUG in Capytui. The event handler was never registered! Please \
             file an issue."
        in
        Effect.Ignore)
      ()
  ;;

  type 'a handle =
    { result : 'a
    ; broadcast_event : t -> unit Effect.t
    }

  let apply_action _ (model : (t -> unit Effect.t) String.Map.t) = function
    | On_change { callback; bonsai_path } ->
      Core.Map.set model ~key:bonsai_path ~data:callback
    | Deactivate { bonsai_path } -> Core.Map.remove model bonsai_path
  ;;

  let register app =
    let open Bonsai.Let_syntax in
    let%sub handlers, inject =
      Bonsai.state_machine0 ~default_model:String.Map.empty ~apply_action ()
    in
    let%sub broadcast_event =
      let%arr handlers = handlers in
      fun event ->
        (* print_s [%message "" ~num_listeners:(Core.Map.length handlers :
           int)]; *)
        Effect.all_unit
          (List.map (Core.Map.data handlers) ~f:(fun handler ->
             handler event))
    in
    let%sub result =
      Bonsai.Dynamic_scope.set listener_registry_variable inject ~inside:app
    in
    let%arr result = result
    and broadcast_event = broadcast_event in
    { result; broadcast_event }
  ;;
end
