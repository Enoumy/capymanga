open! Core
open Bonsai
open Bonsai.Let_syntax
open Capytui

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

let image =
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

let content =
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%sub spinner = Spinner.component ~kind:Dot (Value.return "") in
  let%sub () = image in
  let%arr text = text
  and mauve = mauve
  and spinner = spinner in
  let title =
    Node.hcat
      [ text ~attrs:[ Attr.foreground_color mauve; Attr.bold ] "Capymanga"
      ; text " "
      ; spinner
      ]
  in
  Node.pad ~l:2 ~t:1 title
;;

let app =
  let%sub content = content in
  let%sub backdrop = backdrop in
  let%arr backdrop = backdrop
  and content = content in
  Node.zcat [ content; backdrop ]
;;

let command =
  Command.basic
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;
