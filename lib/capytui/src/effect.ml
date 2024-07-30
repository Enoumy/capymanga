open! Core
include Bonsai.Effect

type _ t += Show_cursor : unit t | Hide_cursor : unit t

let () =
  Core.Hashtbl.add_exn
    Expert.handlers
    ~key:Stdlib.Obj.Extension_constructor.(id (of_val Show_cursor))
    ~data:(fun _ -> Notty_unix.show_cursor true)
;;

let () =
  Core.Hashtbl.add_exn
    Expert.handlers
    ~key:Stdlib.Obj.Extension_constructor.(id (of_val Hide_cursor))
    ~data:(fun _ -> Notty_unix.show_cursor false)
;;

module Deferred_fun_arg = struct
  open Async

  module Action = struct
    type 'r t = T : 'a * ('a -> 'r Deferred.t) -> 'r t
  end

  let handle (Action.T (a, f)) ~on_response =
    don't_wait_for
      (let%map.Deferred result = f a in
       on_response result)
  ;;
end

module Deferred_fun = Ui_effect.Define1 (Deferred_fun_arg)

let of_deferred_fun f a = Deferred_fun.inject (T (a, f))
