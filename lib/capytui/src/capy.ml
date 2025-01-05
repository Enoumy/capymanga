open! Core
open Bonsai.Let_syntax

let terminal_dimensions =
  Bonsai.Dynamic_scope.lookup Dimensions.Private.variable
;;

let start_with_images = Loop.start

let start
  ?dispose
  ?nosig
  ?mouse
  ?bpaste
  ?optimize
  ?target_frames_per_second
  (app : local_ Bonsai.graph -> Node.t Bonsai.t)
  =
  Loop.start
    ?dispose
    ?nosig
    ?mouse
    ?bpaste
    ?optimize
    ?target_frames_per_second
    (fun (local_ graph) -> Bonsai.map (app graph) ~f:(fun app -> app, []))
;;

let listen_to_events callback (local_ graph) =
  let bonsai_path = Bonsai.path_id graph in
  let inject =
    Bonsai.Dynamic_scope.lookup
      Event.Private.listener_registry_variable
      graph
  in
  let on_change =
    let%arr inject and bonsai_path in
    fun callback -> inject (On_change { callback; bonsai_path })
  in
  let () =
    Bonsai.Edge.on_change
      ~equal:phys_equal
      callback
      ~callback:on_change
      graph
  in
  let on_deactivate =
    let%arr inject and bonsai_path in
    inject (Deactivate { bonsai_path })
  in
  let on_activate =
    let%arr inject and bonsai_path and callback in
    inject (On_change { callback; bonsai_path })
  in
  let () = Bonsai.Edge.lifecycle ~on_activate ~on_deactivate graph in
  ()
;;

let set_cursor_position = Cursor.set_cursor_position
