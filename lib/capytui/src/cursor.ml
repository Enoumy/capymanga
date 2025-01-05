open! Core

let variable : (Position.t option -> unit Effect.t) Bonsai.Dynamic_scope.t =
  Bonsai.Dynamic_scope.create
    ~name:"set_cursor_position"
    ~fallback:(fun point ->
      let _ : _ =
        raise_s
          [%message
            "Bug in capytui! Mouse handler not registered! \
             [set_cursor_position] won't occur"
              (point : Position.t option)]
      in
      Effect.Ignore)
    ()
;;

let set_cursor_position = Bonsai.Dynamic_scope.lookup variable

let register term inside (local_ graph) =
  let value =
    Bonsai.return
      (Effect.of_sync_fun (fun position ->
         Term.cursor
           term
           (Option.map position ~f:(fun { Position.row; column } ->
              column, row))))
  in
  Bonsai.Dynamic_scope.set variable value ~inside graph
;;
