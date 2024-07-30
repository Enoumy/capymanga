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
  let dimensions_manager = State_management.For_dimensions.create ~term in
  let driver =
    app
    |> State_management.For_dimensions.register dimensions_manager
    |> Event.Private.register
    |> Cursor.register term
    |> Bonsai_driver.create ~optimize ~clock
  in
  Bonsai_driver.flush driver;
  Bonsai_driver.trigger_lifecycles driver;
  let rec go is_first_frame =
    let go () = go false in
    let frame_start_time = Time_ns.now () in
    let () = State_management.For_clock.advance_to clock frame_start_time
    and () = State_management.For_dimensions.update dimensions_manager in
    let%tydi { result = prev_result; _ } = Bonsai_driver.result driver in
    Bonsai_driver.flush driver;
    let%tydi { result; broadcast_event } = Bonsai_driver.result driver in
    (* TODO: Implement proper diffing + patching. This is only really needed
       for high latency input devices (e.g. my WSL laptop). *)
    if is_first_frame || not (phys_equal result prev_result)
    then Term.image term result;
    Bonsai_driver.trigger_lifecycles driver;
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
      Effect.Expert.handle (broadcast_event (event : Event.t));
      go () [@tail]
    | `Timer -> go () [@tail]
  in
  go true;
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
