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
