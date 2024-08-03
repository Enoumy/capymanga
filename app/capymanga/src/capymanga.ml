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

let static_image _dimensions =
  [ (* { Image.url = *)
    (* "https://mangadex.org/covers/a77742b1-befd-49a4-bff5-1ad4e6b0ef7b/bdd44bcd-c0dc-4f83-ba15-fc99e8790ed4.jpg" *)
    (* ; row = 0 *)
    (* ; column = dimensions.Dimensions.width / 2 *)
    (* ; dimensions = *)
    (*     { width = dimensions.width / 2; height = dimensions.height / 2 } *)
    (* ; scale = true *)
    (* } *)
    (* ; { Image.url = "~/pictures/pixel-art-capy.png" *)
    (*   ; row = dimensions.height / 2 *)
    (*   ; column = 0 *)
    (*   ; dimensions = *)
    (*       { width = dimensions.width / 2; height = dimensions.height / 2 } *)
    (*   ; scale = true *)
    (*   } *) ]
;;

let content =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub spinner =
    let%sub is_something_loading = Loading_state.is_something_loading in
    match%sub is_something_loading with
    | false -> Bonsai.const Node.none
    | true -> Spinner.component ~kind:Spinner.Kind.Dot (Value.return "")
  in
  (* TODO: Add a spinner. Sadly this messes with the way images are shown, so
     you should probably implement diffing first... *)
  let%sub table = Manga_table.component in
  let%arr text = text
  and mauve = mauve
  and table = table
  and spinner = spinner in
  let title =
    Node.hcat
      [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Capymanga"
      ; text " "
      ; spinner
      ]
  in
  Node.pad ~l:2 ~t:1 (Node.vcat [ title; Node.text ""; table ])
;;

let app =
  Loading_state.register
  @@
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
  Node.zcat [ content; backdrop ], image
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
