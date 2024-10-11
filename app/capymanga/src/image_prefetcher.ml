open! Core
open Bonsai

type t =
  { write_file : filename:string -> contents:string -> unit Effect.t
  ; delete_file : filename:string -> unit Effect.t
  ; curl_uri : uri:Uri.t -> string Effect.t
  }

let default_unregistered =
  let fail_unregistered () =
    failwith
      "BUG in capymanga: Image prefetcher dynamic variable not registered!"
  in
  let write_file ~filename:_ ~contents:_ = fail_unregistered () in
  let delete_file ~filename:_ = fail_unregistered () in
  let curl_uri ~uri:_ = fail_unregistered () in
  { write_file; delete_file; curl_uri }
;;

let variable =
  Dynamic_scope.create
    ~name:"capymanga-image-prefetcher-outside-world-interactions"
    ~fallback:default_unregistered
    ()
;;

let register_real x =
  let write_file ~filename ~contents =
    let open Async.Deferred.Let_syntax in
    Capytui.Effect.of_deferred_fun
      (fun () ->
        let%bind writer = Async.Writer.open_file filename in
        Async.Writer.write writer contents;
        let%bind () = Async.Writer.flushed writer in
        Async.Writer.close writer)
      ()
  in
  let delete_file ~filename =
    Capytui.Effect.of_sync_fun (fun () -> Core_unix.remove filename) ()
  in
  let curl_uri ~uri =
    let open Async.Deferred.Let_syntax in
    Capytui.Effect.of_deferred_fun
      (fun () ->
        let%bind _, body = Cohttp_async.Client.get uri in
        let%bind string = Cohttp_async.Body.to_string body in
        return string)
      ()
  in
  let real = { write_file; delete_file; curl_uri } in
  Bonsai.Dynamic_scope.set variable (Value.return real) ~inside:x
;;

module For_testing = struct
  let register_mock x = x
end
