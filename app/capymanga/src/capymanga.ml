open! Core
open Bonsai
open Bonsai.Let_syntax
open Capytui
module Catpuccin = Capytui_catpuccin

let backdrop =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub crust = Capytui_catpuccin.color Crust in
  let%arr { height; width } = dimensions
  and crust = crust in
  Node.vcat
    (List.init height ~f:(fun _ ->
       Node.text
         ~attrs:[ Attr.background_color crust ]
         (String.make width ' ')))
;;

let sexp_for_debugging =
  let%sub text = Catpuccin.color Text in
  let%sub crust = Catpuccin.color Crust in
  let%arr text = text
  and crust = crust in
  fun ?(attrs = []) sexp ->
    Node.sexp_for_debugging
      ~attrs:
        ([ Attr.background_color crust; Attr.foreground_color text ] @ attrs)
      sexp
;;

let static_image dimensions =
  { Image.url =
      "https://mangadex.org/covers/a77742b1-befd-49a4-bff5-1ad4e6b0ef7b/bdd44bcd-c0dc-4f83-ba15-fc99e8790ed4.jpg"
  ; row = 0
  ; column = dimensions.Dimensions.width / 2
  ; dimensions = { dimensions with width = dimensions.width / 2 }
  ; scale = true
  }
;;

let _image =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%sub () =
    Bonsai.Edge.on_change
      dimensions
      ~equal:[%equal: Dimensions.t]
      ~callback:
        (Value.return (fun dimensions ->
           let%bind.Effect _ : _ =
             Kitty.open_image
               ~dimensions
               ~topleft:{ row = 3; column = 3 }
               ~url:
                 "https://mangadex.org/covers/a77742b1-befd-49a4-bff5-1ad4e6b0ef7b/bdd44bcd-c0dc-4f83-ba15-fc99e8790ed4.jpg.512.jpg"
           in
           Effect.return ()))
  in
  Bonsai.const ()
;;

let _num_async_jobs =
  let%sub state, set_state = Bonsai.state_opt () in
  let%sub () =
    let%sub callback =
      let%arr set_state = set_state in
      let%bind.Effect num_jobs =
        Effect.of_sync_fun
          (fun () ->
            ( Async_kernel.Async_kernel_scheduler.Private.num_pending_jobs
                (Async_kernel.Async_kernel_scheduler.Private.t ())
            , Async_kernel.Async_kernel_scheduler.Private.num_jobs_run
                (Async_kernel.Async_kernel_scheduler.Private.t ()) ))
          ()
      in
      set_state (Some num_jobs)
    in
    Bonsai.Clock.every
      ~when_to_start_next_effect:`Every_multiple_of_period_blocking
      (Time_ns.Span.of_sec 0.1)
      callback
  in
  let%sub sexp_for_debugging = sexp_for_debugging in
  let%arr state = state
  and sexp_for_debugging = sexp_for_debugging in
  sexp_for_debugging [%message (state : (int * int) option)]
;;

let manga_list =
  let%sub state, set_state = Bonsai.state_opt () in
  let%sub () =
    let%sub on_activate =
      let%arr set_state = set_state in
      let%bind.Effect response =
        Effect.of_deferred_fun
          (fun () ->
            let%map.Async.Deferred x =
              Mangadex_api.Search.search ~title:"chainsaw"
            in
            x
            (* Async.Deferred.return (Error (Error.of_string "foooo")) *))
          ()
      in
      set_state (Some response)
    in
    Bonsai.Edge.lifecycle ~on_activate ()
  in
  return state
;;

let content =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub manga_list = manga_list in
  let%sub spinner =
    match%sub manga_list with
    | None -> Spinner.component ~kind:Dot (Value.return "")
    | Some _ -> Bonsai.const Node.none
  in
  (* let%sub num_async_jobs = num_async_jobs in *)
  let%sub sexp_for_debugging = sexp_for_debugging in
  (* let%sub () = image in *)
  let%sub list =
    match%sub manga_list with
    | None -> Bonsai.const Node.none
    | Some (Error error) ->
      let%sub red = Catpuccin.color Red in
      let%arr error = error
      and sexp_for_debugging = sexp_for_debugging
      and red = red in
      sexp_for_debugging
        ~attrs:[ Attr.foreground_color red ]
        [%sexp (error : Error.t)]
    | Some (Ok manga_collection) ->
      let%arr manga_collection = manga_collection
      and sexp_for_debugging = sexp_for_debugging in
      sexp_for_debugging
        [%message
          (manga_collection
           : Mangadex_api.Types.Manga.t Mangadex_api.Types.Collection.t)]
  in
  let%arr text = text
  and mauve = mauve
  and spinner = spinner
  and list = list in
  (* and num_async_jobs = num_async_jobs in *)
  let title =
    Node.hcat
      [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Capymanga"
      ; text " "
      ; spinner
      ]
  in
  Node.pad
    ~l:2
    ~t:1
    (Node.vcat
       [ title; Node.text ""; (* num_async_jobs; *) Node.text ""; list ])
;;

let app =
  let%sub image =
    let%sub dimensions = terminal_dimensions in
    let%arr dimensions = dimensions in
    static_image dimensions
  in
  let%sub content = content in
  let%sub backdrop = backdrop in
  let%arr backdrop = backdrop
  and content = content
  and image = image in
  Node.zcat [ content; backdrop ], [ image ]
;;

let command =
  let open Async in
  Command.async
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () ->
        let%bind () = Capytui.start_with_images app in
        Deferred.return ()]
;;
