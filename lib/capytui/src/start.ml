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

type r =
  [ Unescape.event
  | `Resize of int * int
  | `End
  | `Timer
  ]

let event ~delay t =
  if Term.pending t
  then (Term.event t :> r)
  else
    let open Core_unix in
    match
      select
        ~read:[ Term.fds t |> fst ]
        ~write:[]
        ~except:[]
        ~timeout:delay
        ()
    with
    | { read = []; write = _; except = _ } -> `Timer
    | { read = _ :: _; write = _; except = _ } -> (Term.event t :> r)
    | exception Unix_error (EINTR, _, _) -> (Term.event t :> r)
;;

let start
  ?dispose
  ?nosig
  ?mouse
  ?bpaste
  ?(optimize = true)
  ?(target_frames_per_second = 60)
  (app : image Computation.t)
  =
  if target_frames_per_second < 1
  then
    raise_s
      [%message
        "Assertion failure: [target_frames_per_second < 1]"
          (target_frames_per_second : int)
          "please pick a value >= 1"];
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
  let target_delay =
    Time_ns.Span.of_sec (1.0 /. Float.of_int target_frames_per_second)
  in
  let rec go () =
    let now = Time_ns.now () in
    advance_clock_to now;
    Bonsai_driver.flush driver;
    update_dimensions ();
    let result = Bonsai_driver.result driver in
    Notty_unix.Term.image term result;
    (* Consider queueing up all of these events and not doing stabilizations
       each time... *)
    let time_taken = Time_ns.diff (Time_ns.now ()) now in
    match
      event
        ~delay:
          (`After
            (Time_ns.Span.max
               Time_ns.Span.zero
               (Time_ns.Span.( - ) target_delay time_taken)))
        term
    with
    | `End | `Key (`ASCII ('C' | 'c'), [ `Ctrl ]) -> ()
    | `Key (`Uchar uchar, [ `Ctrl ])
      when Uchar.equal (Uchar.of_char 'C') uchar
           || Uchar.equal (Uchar.of_char 'c') uchar ->
      ()
    | `Resize (width, height) ->
      Bonsai.Var.set dimensions_var { width; height };
      go ()
    | `Paste _ | `Mouse _ | `Key _ | `Timer -> go ()
  in
  go ();
  Notty_unix.Term.release term
;;
