open! Core
open Bonsai
open Notty

module Term = struct
  include Notty_unix.Term

  let dimensions t =
    let width, height = size t in
    { Dimensions.width; height }
  ;;
end

let start
  ?dispose
  ?nosig
  ?mouse
  ?bpaste
  ?(optimize = true)
  (app : image Computation.t)
  =
  let clock = Bonsai.Time_source.create ~start:(Time_ns.now ()) in
  let _advance_clock_to to_ =
    Bonsai.Time_source.advance_clock clock ~to_;
    Bonsai.Time_source.Private.flush clock
  in
  let term = Notty_unix.Term.create ?mouse ?dispose ?nosig ?bpaste () in
  let dimensions_var = Bonsai.Var.create (Term.dimensions term) in
  let update_dimensions () =
    (* Consider listening to the resize event for this instead... *)
    let new_dimensions = Term.dimensions term in
    print_s [%message (new_dimensions : Dimensions.t)];
    if not ([%equal: Dimensions.t] (Var.get dimensions_var) new_dimensions)
    then Bonsai.Var.set dimensions_var new_dimensions
  in
  let driver =
    Bonsai_driver.create
      ~optimize
      ~clock
      (Bonsai.Dynamic_scope.set
         Dimensions.Private.variable
         (Bonsai.Var.value dimensions_var)
         ~inside:app)
  in
  let go () =
    Bonsai_driver.flush driver;
    update_dimensions ();
    let result = Bonsai_driver.result driver in
    Notty_unix.output_image result
  in
  go ()
;;
