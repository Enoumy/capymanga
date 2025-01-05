open! Core
open! Bonsai
open! Capytui
open Async
open! Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin

let all_colors (local_ graph) =
  Bonsai.map (Catpuccin.flavor graph) ~f:(fun flavor ->
    Catpuccin.all
    |> List.map ~f:(fun color -> color, Catpuccin.color ~flavor color)
    |> Catpuccin.Map.of_alist_exn)
;;

let all_flavors = Core.Array.of_list Catpuccin.Flavor.all

let app (local_ graph) =
  let index, cycle =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ mode -> function
        | `Left -> (mode - 1) % Array.length all_flavors
        | `Right -> (mode + 1) % Array.length all_flavors)
      graph
  in
  let () =
    let callback =
      let%arr cycle in
      fun (event : Event.t) ->
        match event with
        | `Key ((`ASCII 'h' | `Arrow `Left), []) -> cycle `Left
        | `Key ((`ASCII 'l' | `Arrow `Right), []) -> cycle `Right
        | `Key (`Tab, []) -> cycle `Right
        | `Key (`Tab, [ `Shift ]) -> cycle `Left
        | _ -> Effect.Ignore
    in
    Capytui.listen_to_events callback graph
  in
  let flavor =
    let%arr index in
    all_flavors.(index)
  in
  (Catpuccin.set_flavor_within flavor
   @@ fun (local_ graph) ->
   let all_colors = all_colors graph in
   let%arr all_colors and flavor in
   let title =
     Catpuccin.Flavor.all
     |> List.map ~f:(fun f ->
       let attr =
         Attr.many
           [ Attr.background_color
               (Catpuccin.Flavor.color
                  flavor
                  (if Catpuccin.Flavor.equal flavor f
                   then Catpuccin.Mauve
                   else Base))
           ; Attr.foreground_color
               (Catpuccin.Flavor.color
                  flavor
                  (if Catpuccin.Flavor.equal flavor f
                   then Catpuccin.Base
                   else Text))
           ]
       in
       Node.text
         ~attrs:[ attr ]
         (" " ^ Sexp.to_string [%sexp (f : Catpuccin.Flavor.t)] ^ " "))
     |> Node.hcat
   in
   let colors =
     Node.vcat
     @@ List.map
          (Core.Map.to_alist all_colors)
          ~f:(fun (color, color_attr) ->
            Node.hcat
              [ Node.text ~attrs:[ Attr.background_color color_attr ] "  "
              ; Node.text " "
              ; Node.text
                  ~attrs:[ Attr.foreground_color color_attr ]
                  (Sexp.to_string [%sexp (color : Catpuccin.t)])
              ])
   in
   let text_attr =
     Attr.many
       [ Attr.foreground_color (Catpuccin.Flavor.color flavor Text)
       ; Attr.background_color (Catpuccin.Flavor.color flavor Base)
       ]
   in
   Node.pad
     ~l:2
     ~t:1
     (Node.vcat
        [ Node.hcat
            [ Node.text
                ~attrs:
                  [ Attr.bold
                  ; text_attr
                  ; Attr.foreground_color
                      (Catpuccin.Flavor.color flavor Mauve)
                  ]
                " Catpuccin "
            ; Node.text ~attrs:[ text_attr ] "colors. Press "
            ; Node.text
                ~attrs:
                  [ Attr.foreground_color
                      (Catpuccin.Flavor.color flavor Mauve)
                  ; Attr.background_color
                      (Catpuccin.Flavor.color flavor Base)
                  ; Attr.bold
                  ]
                "<tab>"
            ; Node.text ~attrs:[ text_attr ] " to change flavor."
            ]
        ; title
        ; Node.text ""
        ; Node.pad ~l:2 colors
        ]))
    graph
;;

let command =
  Command.async_or_error
    ~summary:{|Catpuccin colors demo!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;

let () = Command_unix.run command
