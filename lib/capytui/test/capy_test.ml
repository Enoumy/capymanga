open! Core

let%expect_test _ =
  print_endline "hi";
  [%expect {| hi |}]
;;
