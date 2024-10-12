open! Core
open! Bonsai
open Bonsai_test
open Capytui

module Box = struct
  let hline n = String.concat (List.init n ~f:(fun _ -> "─"))

  let surround { Dimensions.width; height = _ } string =
    (* TODO: Hmm, I probably shouldn't ignore the height. It's for a test, so
       just keep it in mind if tests get funky... *)
    String.concat_lines
      [ String.concat [ "┌"; hline width; "┐" ]
      ; String.concat
          ~sep:"\n"
          (String.split_lines string
           |> List.map ~f:(fun line ->
             String.concat [ "│"; String.pad_right line ~len:width; "│" ]))
      ; String.concat [ "└"; hline width; "┘" ]
      ]
  ;;
end

module Result_spec = struct
  type ('a, 'incoming) t =
    { a : 'a
    ; to_image : 'a -> Notty.image
    ; set_dimensions : Dimensions.t -> unit Effect.t
    ; dimensions : Dimensions.t
    ; broadcast_event : Event.t -> unit Effect.t
    ; handle_incoming : 'a -> 'incoming -> unit Effect.t
    }

  type 'a incoming =
    | Set_dimensions of { dimensions : Dimensions.t }
    | Broadcast_event of { event : Event.t }
    | External_event of 'a

  let view
    { a
    ; to_image
    ; set_dimensions = _
    ; dimensions = { width; height }
    ; broadcast_event = _
    ; handle_incoming = _
    }
    =
    let buffer = Buffer.create 100 in
    Notty.Render.to_buffer
      buffer
      Notty.Cap.dumb
      (0, 0)
      (width, height)
      (to_image a);
    let string = Buffer.contents buffer in
    let string = Box.surround { width; height } string in
    string
  ;;

  let incoming
    { a
    ; to_image = _
    ; set_dimensions
    ; dimensions = _
    ; broadcast_event
    ; handle_incoming
    }
    = function
    | Set_dimensions { dimensions } -> set_dimensions dimensions
    | Broadcast_event { event } -> broadcast_event event
    | External_event e -> handle_incoming a e
  ;;
end

let create_handle_generic
  (type a incoming)
  ?(initial_dimensions : Dimensions.t = { height = 40; width = 80 })
  ~to_image
  ~handle_incoming
  component
  =
  let module Outer_result_spec = Result_spec in
  let module Result_spec = struct
    type t = (a, incoming) Result_spec.t
    type nonrec incoming = incoming Result_spec.incoming

    let view = Result_spec.view
    let incoming = Result_spec.incoming
  end
  in
  Bonsai_test.Handle.create
    (module Result_spec)
    (let open Bonsai.Let_syntax in
     let%sub dimensions, set_dimensions = Bonsai.state initial_dimensions in
     Bonsai.Dynamic_scope.set
       Dimensions.Private.variable
       dimensions
       ~inside:
         (let%sub { result = a; broadcast_event } =
            Event.Private.register component
          in
          let%arr a = a
          and set_dimensions = set_dimensions
          and dimensions = dimensions
          and broadcast_event = broadcast_event in
          { Outer_result_spec.a
          ; to_image
          ; set_dimensions
          ; dimensions
          ; broadcast_event
          ; handle_incoming
          }))
;;

let create_handle ?initial_dimensions component =
  create_handle_generic
    ?initial_dimensions
    component
    ~to_image:Fn.id
    ~handle_incoming:(fun _ (nothing : Nothing.t) ->
      match nothing with _ -> .)
;;

let set_dimensions handle dimensions =
  Handle.do_actions handle [ Result_spec.Set_dimensions { dimensions } ]
;;

let send_event handle event =
  Handle.do_actions handle [ Result_spec.Broadcast_event { event } ]
;;

let do_actions handle actions =
  Handle.do_actions
    handle
    (List.map actions ~f:(fun x -> Result_spec.External_event x))
;;
