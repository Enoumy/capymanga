open! Core
open! Bonsai
open Capytui
open Bonsai.Let_syntax

let image =
  "001000000000000131100010000000167101311000001661001671000001111016610000122221411110011444444444210122244248142111442242455441144422424421101144242424100001111111110000"
;;

let colors =
  [| Attr.Color.rgb ~r:0 ~g:0 ~b:0
   ; Attr.Color.rgb ~r:0 ~g:0 ~b:0
   ; Attr.Color.rgb ~r:0x6d ~g:0x48 ~b:0x2f
   ; Attr.Color.rgb ~r:0x7e ~g:0xed ~b:0x56
   ; Attr.Color.rgb ~r:0x9c ~g:0x69 ~b:0x26
   ; Attr.Color.rgb ~r:0xff ~g:0x99 ~b:0xaa
   ; Attr.Color.rgb ~r:0xff ~g:0xa8 ~b:0x00
   ; Attr.Color.rgb ~r:0xff ~g:0xd6 ~b:0x35
   ; Attr.Color.rgb ~r:0xff ~g:0xff ~b:0xff
  |]
;;

let width = 14
let height = 12

let capybara =
  Node.vcat
    (List.init height ~f:(fun h ->
         Node.hcat
           (List.init width ~f:(fun w ->
                let i = (h * width) + w in
                let color_index = Char.to_int image.[i] - Char.to_int '0' in
                match color_index with
                | 0 -> Node.text "  "
                | index ->
                  Node.text ~attrs:[ Attr.background_color colors.(index) ] "  "))))
;;

let app =
  let%sub dimensions = Capy.terminal_dimensions in
  (* let%sub offset, tick =  *)
  (*   Bonsai.state_machine0 ~default_model:0 ~apply_action:(fun _  model () -> *)
  (**)
  (**)
  (*   ) *)
  (**)
  (*   in *)
  let%arr dimensions = dimensions in
  Node.center ~within:dimensions capybara
;;

let command =
  Command.basic
    ~summary:{|An actual capybara!!!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.Start.start app]
;;

let () = Command_unix.run command
