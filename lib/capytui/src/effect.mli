open! Core

include module type of struct
  include Ui_effect
end

type 'a t += Show_cursor : unit t | Hide_cursor : unit t

val of_deferred_fun
  :  ('query -> 'response Async.Deferred.t)
  -> 'query
  -> 'response t
