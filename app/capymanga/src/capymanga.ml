open! Core
open Bonsai.Let_syntax
open Notty
open Capytui

module Images = struct
  let c_gray_ramp = I.tabulate 24 1 (fun g _ -> I.string A.(bg (gray g)) " ")

  let c_cube_ix =
    I.tabulate 6 1
    @@ fun r _ ->
    I.hpad 0 1
    @@ I.tabulate 6 6
    @@ fun b g -> I.string A.(bg (rgb ~r ~g ~b)) " "
  ;;

  let c_rainbow w h =
    let pi2 = 2. *. 3.14159 in
    let pi2_3 = pi2 /. 3.
    and f t off =
      (Float.sin (t +. off) *. 128.) +. 128. |> Float.iround_towards_zero_exn
    in
    let color t = A.rgb_888 ~r:(f t (-.pi2_3)) ~g:(f t 0.) ~b:(f t pi2_3) in
    I.tabulate (w - 1) 1
    @@ fun x _ ->
    let t = (pi2 *. float x /. float w) +. 3.7 in
    I.char A.(bg (color t)) ' ' 1 h
  ;;
end

let colors =
  A.
    [ "black", black
    ; "red", red
    ; "green", green
    ; "yellow", yellow
    ; "blue", blue
    ; "magenta", magenta
    ; "cyan", cyan
    ; "white", white
    ; "lightblack", lightblack
    ; "lightred", lightred
    ; "lightgreen", lightgreen
    ; "lightyellow", lightyellow
    ; "lightblue", lightblue
    ; "lightmagenta", lightmagenta
    ; "lightcyan", lightcyan
    ; "lightwhite", lightwhite
    ]
;;

let styles =
  A.
    [ "empty", empty
    ; "bold", st bold
    ; "italic", st italic
    ; "underline", st underline
    ; "blink", st blink
    ; "reverse", st reverse
    ; "bold/italic", st bold ++ st italic
    ; "rev/underln", st underline ++ st reverse
    ; "bold/rev", st reverse ++ st bold
    ]
;;

let image { Dimensions.width; height } =
  let open List in
  let core16 =
    let c1 = map ~f:(fun (n, c) -> I.string A.(fg c) n) colors
    and c2 = map ~f:(fun (n, c) -> I.string A.(fg black ++ bg c) n) colors in
    I.(vcat c1 <|> void 1 0 <|> vcat c2)
  and attr =
    I.(styles |> map ~f:(fun (n, s) -> hpad 0 1 (string s n)) |> hcat)
  in
  let combine imgs =
    List.map ~f:I.(fun (n, i) -> string A.empty n <-> i <-> void 0 1) imgs
    |> I.vcat
    |> I.pad ~l:1 ~t:1
  in
  combine
    [ "System colors:", core16
    ; "Color cube, 6x6x6:", Images.c_cube_ix
    ; "Grayscale ramp:", Images.c_gray_ramp
    ; "24bit:", Images.c_rainbow (width - 2) 1
    ; "Text styles:", attr
    ; ( "Dimensions"
      , I.string
          A.empty
          [%string "%{[%message (width : int) (height : int)]#Sexp}"] )
    ]
;;

let app =
  let%sub dimensions = Capytui.terminal_dimensions in
  let%arr dimensions = dimensions in
  image dimensions
;;

let command =
  Command.basic
    ~summary:{|Capy manga!|}
    [%map_open.Command
      let () = return () in
      fun () -> Capytui.start app]
;;
