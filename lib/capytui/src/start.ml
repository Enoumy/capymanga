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

module Event = struct
  type t =
    [ Unescape.event
    | `Resize of int * int
    | `End
    | `Timer
    ]
end

let event ~delay t =
  if Term.pending t
  then (Term.event t :> Event.t)
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
    | { read = _ :: _; write = _; except = _ } -> (Term.event t :> Event.t)
    | exception Unix_error (EINTR, _, _) -> (Term.event t :> Event.t)
;;

module Clock = struct
  let create () = Bonsai.Time_source.create ~start:(Time_ns.now ())

  let advance_to clock to_ =
    Bonsai.Time_source.advance_clock clock ~to_;
    Bonsai.Time_source.Private.flush clock
  ;;
end

module Management = struct
  module For_dimensions : sig
    type t

    val create : term:Notty_unix.Term.t -> t
    val update : t -> unit
    val register : t -> 'a Computation.t -> 'a Computation.t
    val set : t -> Dimensions.t -> unit
  end = struct
    type t =
      { var : Dimensions.t Bonsai.Var.t
      ; term : Notty_unix.Term.t
      }

    let create ~term =
      let var = Bonsai.Var.create (Term.dimensions term) in
      { var; term }
    ;;

    let set { var; term = _ } dimensions = Bonsai.Var.set var dimensions

    let update ({ term; var } as t) =
      let new_dimensions = Term.dimensions term in
      if not ([%equal: Dimensions.t] (Var.get var) new_dimensions)
      then set t new_dimensions
    ;;

    let register { term = _; var } computation =
      Bonsai.Dynamic_scope.set
        Dimensions.Private.variable
        (Bonsai.Var.value var)
        ~inside:computation
    ;;
  end
end

module Params = struct
  type t =
    { dispose : bool option
    ; nosig : bool option
    ; mouse : bool option
    ; bpaste : bool option
    ; optimize : bool
    ; target_frames_per_second : int
    ; app : image Computation.t
    }

  let sanity_check_exn
    { dispose = _
    ; nosig = _
    ; mouse = _
    ; bpaste = _
    ; optimize = _
    ; target_frames_per_second
    ; app = _
    }
    =
    if target_frames_per_second < 1
    then
      raise_s
        [%message
          "Assertion failure: [target_frames_per_second < 1]"
            (target_frames_per_second : int)
            "please pick a value >= 1"]
  ;;
end

let start
  { Params.dispose
  ; nosig
  ; mouse
  ; bpaste
  ; optimize
  ; target_frames_per_second
  ; app
  }
  =
  let clock = Clock.create () in
  let term = Notty_unix.Term.create ?mouse ?dispose ?nosig ?bpaste () in
  let dimensions_manager = Management.For_dimensions.create ~term in
  let driver =
    app
    |> Management.For_dimensions.register dimensions_manager
    |> Bonsai_driver.create ~optimize ~clock
  in
  let target_delay =
    Time_ns.Span.of_sec (1.0 /. Float.of_int target_frames_per_second)
  in
  let rec go () =
    let now = Time_ns.now () in
    Clock.advance_to clock now;
    Management.For_dimensions.update dimensions_manager;
    Bonsai_driver.flush driver;
    let result = Bonsai_driver.result driver in
    Notty_unix.Term.image term result;
    (* Consider queueing up all of these events and not doing stabilizations
       each time... *)
    let time_taken = Time_ns.diff (Time_ns.now ()) now in
    let delay = Time_ns.Span.(max zero (target_delay - time_taken)) in
    match event ~delay:(`After delay) term with
    | `End
    | `Key
        ( `ASCII ('C' | 'c')
        , [ `Ctrl ]
          (* Consider having a way of overriding the close-on ctrl-c behavior
             dynamically. *) ) ->
      ()
    | `Key (`Uchar uchar, [ `Ctrl ])
      when Uchar.equal (Uchar.of_char 'C') uchar
           || Uchar.equal (Uchar.of_char 'c') uchar ->
      ()
    | `Resize (width, height) ->
      Management.For_dimensions.set dimensions_manager { width; height };
      go ()
    | `Paste _ | `Mouse _ | `Key _ | `Timer -> go ()
  in
  go ();
  Notty_unix.Term.release term
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
  let params =
    { Params.dispose
    ; nosig
    ; mouse
    ; bpaste
    ; optimize
    ; target_frames_per_second
    ; app
    }
  in
  Params.sanity_check_exn params;
  start params
;;
