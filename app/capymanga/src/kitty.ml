open! Core
open Capytui

let open_image
  :  dimensions:Dimensions.t -> topleft:Position.t -> url:string
  -> unit Effect.t
  =
  fun ~dimensions:{ width; height } ~topleft:{ row; column } ~url ->
  Capytui.Effect.of_sync_fun
    (fun () ->
      let s =
        [%string
          {|kitty +kitten icat --place '%{width#Int}x%{height#Int}@%{column#Int}x%{row#Int}' --z-index 100 %{url}|}]
      in
      let _ : _ = failwith s in
      let _ : int = Sys_unix.command s in
      ())
    ()
;;
