open! Core
module Render = Mandelbrot.For_testing.Render

let test ~dimensions =
  let result =
    Render.render
      ~center:{ real = 0.0; imaginary = 0.0 }
      ~scale:Percent.one_hundred_percent
      ~max_iterations:1_000
      ~dimensions
  in
  let rendered =
    String.concat_array ~sep:"\n"
    @@ Array.map result ~f:(fun line ->
      String.concat_array
      @@ Array.map line ~f:(fun iteration ->
        if iteration > 500 then "X" else "."))
  in
  print_endline rendered
;;

let%expect_test "10x10" =
  test ~dimensions:{ width = 10; height = 10 };
  [%expect
    {|
    ..........
    ..........
    ..........
    ......XXXX
    ....X.XXXX
    XXXXXXXXXX
    ....X.XXXX
    ......XXXX
    ..........
    ..........
    |}]
;;

let%expect_test "40x40" =
  test ~dimensions:{ width = 40; height = 40 };
  [%expect
    {|
    ........................................
    ........................................
    ........................................
    ........................................
    ........................................
    ........................................
    .............................XXXX.......
    .............................XXX........
    ..............................XX........
    ............................XXXXXX......
    ........................X.XXXXXXXXXX.X..
    ........................XXXXXXXXXXXXXX..
    .......................XXXXXXXXXXXXXXX..
    .......................XXXXXXXXXXXXXXX..
    ......................XXXXXXXXXXXXXXXXXX
    .....................XXXXXXXXXXXXXXXXXX.
    ..............XXXXX..XXXXXXXXXXXXXXXXXX.
    ..............XXXXXX.XXXXXXXXXXXXXXXXXX.
    .............XXXXXXX.XXXXXXXXXXXXXXXXXX.
    ...........X.XXXXXXXXXXXXXXXXXXXXXXXXX..
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX...
    ...........X.XXXXXXXXXXXXXXXXXXXXXXXXX..
    .............XXXXXXX.XXXXXXXXXXXXXXXXXX.
    ..............XXXXXX.XXXXXXXXXXXXXXXXXX.
    ..............XXXXX..XXXXXXXXXXXXXXXXXX.
    .....................XXXXXXXXXXXXXXXXXX.
    ......................XXXXXXXXXXXXXXXXXX
    .......................XXXXXXXXXXXXXXX..
    .......................XXXXXXXXXXXXXXX..
    ........................XXXXXXXXXXXXXX..
    ........................X.XXXXXXXXXX.X..
    ............................XXXXXX......
    ..............................XX........
    .............................XXX........
    .............................XXXX.......
    ........................................
    ........................................
    ........................................
    ........................................
    ........................................
    |}]
;;
