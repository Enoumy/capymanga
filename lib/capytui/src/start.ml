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
  let advance_clock_to to_ =
    Bonsai.Time_source.advance_clock clock ~to_;
    Bonsai.Time_source.Private.flush clock
  in
  let term = Notty_unix.Term.create ?mouse ?dispose ?nosig ?bpaste () in
  let dimensions_var = Bonsai.Var.create (Term.dimensions term) in
  let update_dimensions () =
    (* Consider listening to the resize event for this instead... *)
    let new_dimensions = Term.dimensions term in
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
  let rec go () =
    advance_clock_to (Time_ns.now ());
    Bonsai_driver.flush driver;
    update_dimensions ();
    let result = Bonsai_driver.result driver in
    Notty_unix.Term.image term result;
    (* Consider queueing up all of these events and not doing stabilizations
       each time... *)
    match Notty_unix.Term.event term with
    | `Key (`ASCII ('C' | 'c'), [ `Ctrl ]) -> ()
    | `Key (`Uchar uchar, [ `Ctrl ])
      when Uchar.equal (Uchar.of_char 'C') uchar
           || Uchar.equal (Uchar.of_char 'c') uchar ->
      ()
    | `End -> ()
    | `Resize (width, height) ->
      Bonsai.Var.set dimensions_var { width; height };
      go ()
    | `Paste _ | `Mouse _ | `Key _ -> go ()
  in
  go ();
  Notty_unix.Term.release term
;;
