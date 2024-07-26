open! Core
open! Bonsai
open Bonsai_test
open Capytui

module Result_spec = struct
  type t =
    { image : Notty.image
    ; set_dimensions : Dimensions.t -> unit Effect.t
    ; dimensions : Dimensions.t
    }

  type incoming = Set_dimensions of { dimensions : Dimensions.t }

  let view { image; set_dimensions = _; dimensions = { width; height } } =
    let buffer = Buffer.create 100 in
    Notty.Render.to_buffer buffer Notty.Cap.dumb (0, 0) (width, height) image;
    Buffer.contents buffer
  ;;

  let incoming { image = _; set_dimensions; dimensions = _ } = function
    | Set_dimensions { dimensions } -> set_dimensions dimensions
  ;;
end

let create_handle
  ?(initial_dimensions : Dimensions.t = { height = 40; width = 40 })
  ()
  =
  Bonsai_test.Handle.create
    (module Result_spec)
    (let open Bonsai.Let_syntax in
     let%sub dimensions, set_dimensions = Bonsai.state initial_dimensions in
     Bonsai.Dynamic_scope.set
       Dimensions.Private.variable
       dimensions
       ~inside:
         (let%sub image = Capymanga.app in
          let%arr image = image
          and set_dimensions = set_dimensions
          and dimensions = dimensions in
          { Result_spec.image; set_dimensions; dimensions }))
;;

let%expect_test "Dimensions changing" =
  let handle = create_handle () in
  Handle.show handle;
  [%expect
    {|
    System colors:
    black        black
    red          red
    green        green
    yellow       yellow
    blue         blue
    magenta      magenta
    cyan         cyan
    white        white
    lightblack   lightblack
    lightred     lightred
    lightgreen   lightgreen
    lightyellow  lightyellow
    lightblue    lightblue
    lightmagenta lightmagenta
    lightcyan    lightcyan
    lightwhite   lightwhite

    Color cube, 6x6x6:







    Grayscale ramp:


    24bit:


    Text styles:
    empty bold italic underline blink rever

    Dimensions
    ((width 40)(height 40))
    |}];
  Handle.do_actions
    handle
    [ Set_dimensions { dimensions = { height = 40; width = 100 } } ];
  Handle.show_diff handle;
  [%expect
    {|
       Color cube, 6x6x6:







       Grayscale ramp:


       24bit:


       Text styles:
    -| empty bold italic underline blink rever
    +| empty bold italic underline blink reverse bold/italic rev/underln bold/rev

       Dimensions
    -| ((width 40)(height 40))
    +| ((width 100)(height 40))
    |}]
;;
