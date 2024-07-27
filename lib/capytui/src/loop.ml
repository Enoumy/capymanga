open! Core
open Bonsai

let start
  { Start_params.dispose
  ; nosig
  ; mouse
  ; bpaste
  ; optimize
  ; target_frames_per_second
  ; app
  }
  =
  let clock = State_management.For_clock.create ()
  and term = Term.create ?mouse ?dispose ?nosig ?bpaste ()
  and target_delay =
    Time_ns.Span.of_sec (1.0 /. Float.of_int target_frames_per_second)
  in
  let dimensions_manager = State_management.For_dimensions.create ~term
  and events_manager = State_management.For_events.create () in
  let driver =
    app
    |> State_management.For_dimensions.register dimensions_manager
    |> State_management.For_events.register events_manager
    |> Bonsai_driver.create ~optimize ~clock
  in
  let rec go () =
    let frame_start_time = Time_ns.now () in
    let () = State_management.For_clock.advance_to clock frame_start_time
    and () = State_management.For_dimensions.update dimensions_manager in
    Bonsai_driver.flush driver;
    let result = Bonsai_driver.result driver in
    Term.image term result;
    let time_taken = Time_ns.diff (Time_ns.now ()) frame_start_time in
    let delay = Time_ns.Span.(max zero (target_delay - time_taken)) in
    (* Consider queueing up all of these events and not doing stabilizations
       each time... *)
    match Term.next_event_or_wait_delay ~delay term with
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
      State_management.For_dimensions.set
        dimensions_manager
        { width; height };
      go () [@tail]
    | (`Paste _ | `Mouse _ | `Key _) as event ->
      State_management.For_events.handle_event (event : Event.t);
      go () [@tail]
    | `Timer -> go () [@tail]
  in
  go ();
  Term.release term
;;

let start
  ?dispose
  ?nosig
  ?mouse
  ?bpaste
  ?(optimize = true)
  ?(target_frames_per_second = 60)
  (app : Node.t Computation.t)
  =
  let params =
    Start_params.create_exn
      ~dispose
      ~nosig
      ~mouse
      ~bpaste
      ~optimize
      ~target_frames_per_second
      ~app
  in
  start params
;;
