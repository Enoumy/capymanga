open! Core
open Bonsai_test
open Capytui
open Bonsai.Let_syntax

let%expect_test "Really basic sanity test" =
  let handle =
    Test_utils.create_handle
      (let%sub dimensions = Capy.terminal_dimensions in
       let%arr dimensions = dimensions in
       Node.sexp_for_debugging
         [%message
           (dimensions : Dimensions.t)
             (dimensions : Dimensions.t)
             (dimensions : Dimensions.t)
             (dimensions : Dimensions.t)
             (dimensions : Dimensions.t)])
  in
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │((dimensions ((height 40) (width 80))) (dimensions ((height 40) (width 80)))    │
    │ (dimensions ((height 40) (width 80))) (dimensions ((height 40) (width 80)))    │
    │ (dimensions ((height 40) (width 80))))                                         │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    └────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Test_utils.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │((dimensions ((height 10) (width 78))) (dimensions ((height 10) (width 78)))  │
    │ (dimensions ((height 10) (width 78))) (dimensions ((height 10) (width 78)))  │
    │ (dimensions ((height 10) (width 78))))                                       │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let example_app =
  let%sub dimensions = Capy.terminal_dimensions in
  let%arr { width; height } = dimensions in
  let number_attr =
    Attr.many [ Attr.foreground_color Attr.Color.blue; Attr.bold ]
  in
  let number n = Node.text ~attrs:[ number_attr ] [%string "%{n#Int}"] in
  let image =
    Node.hcat
      [ Node.text "("
      ; number width
      ; Node.text " x "
      ; number height
      ; Node.text ")"
      ]
  in
  Node.center image ~within:{ width; height }
;;

let%expect_test "Testing the example app with attrs" =
  let handle = Test_utils.create_handle example_app in
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                   (80 x 40)                                    │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    │                                                                                │
    └────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Test_utils.set_dimensions handle { width = 78; height = 10 };
  Handle.show handle;
  [%expect
    {|
    ┌──────────────────────────────────────────────────────────────────────────────┐
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                  (78 x 10)                                   │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    │                                                                              │
    └──────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
