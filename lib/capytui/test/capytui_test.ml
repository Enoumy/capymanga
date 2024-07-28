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
  type t =
    { image : Notty.image
    ; set_dimensions : Dimensions.t -> unit Effect.t
    ; dimensions : Dimensions.t
    ; broadcast_event : Event.t -> unit Effect.t
    }

  type incoming =
    | Set_dimensions of { dimensions : Dimensions.t }
    | Broadcast_event of { event : Event.t }

  let view
    { image
    ; set_dimensions = _
    ; dimensions = { width; height }
    ; broadcast_event = _
    }
    =
    let buffer = Buffer.create 100 in
    Notty.Render.to_buffer buffer Notty.Cap.dumb (0, 0) (width, height) image;
    let string = Buffer.contents buffer in
    let string = Box.surround { width; height } string in
    string
  ;;

  let incoming { image = _; set_dimensions; dimensions = _; broadcast_event }
    = function
    | Set_dimensions { dimensions } -> set_dimensions dimensions
    | Broadcast_event { event } -> broadcast_event event
  ;;
end

let create_handle
  ?(initial_dimensions : Dimensions.t = { height = 40; width = 80 })
  component
  =
  Bonsai_test.Handle.create
    (module Result_spec)
    (let open Bonsai.Let_syntax in
     let%sub dimensions, set_dimensions = Bonsai.state initial_dimensions in
     Bonsai.Dynamic_scope.set
       Dimensions.Private.variable
       dimensions
       ~inside:
         (let%sub { result = image; broadcast_event } =
            Event.Private.register component
          in
          let%arr image = image
          and set_dimensions = set_dimensions
          and dimensions = dimensions
          and broadcast_event = broadcast_event in
          { Result_spec.image; set_dimensions; dimensions; broadcast_event }))
;;

let set_dimensions handle dimensions =
  Handle.do_actions handle [ Result_spec.Set_dimensions { dimensions } ]
;;

let send_event handle event =
  Handle.do_actions handle [ Result_spec.Broadcast_event { event } ]
;;
