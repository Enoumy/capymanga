open! Core
open Capytui

let open_image
  :  dimensions:Dimensions.t -> topleft:Position.t -> url:string
  -> unit Effect.t
  =
  fun ~dimensions:{ width; height } ~topleft:{ row; column } ~url ->
  Capytui.Effect.of_deferred_fun
    (fun () ->
      let open Async in
      let args =
        [ "+kitten"
        ; "icat"
        ; "--place"
        ; [%string "%{width#Int}x%{height#Int}@%{column#Int}x%{row#Int}"]
        ; "--z-index"
        ; "100"
        ; url
        ]
      in
      let%bind _ : _ = Process.run ~prog:"kitty" ~args () in
      return ())
    ()
;;
