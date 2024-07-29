open! Core
open Bonsai.Let_syntax

let terminal_dimensions =
  Bonsai.Dynamic_scope.lookup Dimensions.Private.variable
;;

let start = Loop.start

let listen_to_events callback =
  let%sub bonsai_path = Bonsai.path_id in
  let%sub inject =
    Bonsai.Dynamic_scope.lookup Event.Private.listener_registry_variable
  in
  let%sub on_change =
    let%arr inject = inject
    and bonsai_path = bonsai_path in
    fun callback -> inject (On_change { callback; bonsai_path })
  in
  let%sub () =
    Bonsai.Edge.on_change ~equal:phys_equal callback ~callback:on_change
  in
  let%sub on_deactivate =
    let%arr inject = inject
    and bonsai_path = bonsai_path in
    inject (Deactivate { bonsai_path })
  in
  let%sub on_activate =
    let%arr inject = inject
    and bonsai_path = bonsai_path
    and callback = callback in
    inject (On_change { callback; bonsai_path })
  in
  let%sub () = Bonsai.Edge.lifecycle ~on_activate ~on_deactivate () in
  Bonsai.const ()
;;

let set_cursor_position = Cursor.set_cursor_position
