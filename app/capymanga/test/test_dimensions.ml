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
    |}]
;;
