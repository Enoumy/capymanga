open! Core

let terminal_dimensions =
  Bonsai.Dynamic_scope.lookup Dimensions.Private.variable
;;

let start = Loop.start
