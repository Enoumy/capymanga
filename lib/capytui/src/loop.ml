let _exit = Unix._exit

open! Core
open Bonsai
open Async

let clear_images () =
  let _ : _ =
    Sys_unix.command "kitten  icat --clear --silent >/dev/tty </dev/tty"
  in
  ()
;;

let draw_command_for_image
  { Image.row; column; url; dimensions = { height; width }; scale }
  =
  let args =
    List.concat
      [ [ "kitten"; "icat"; "--silent" ]
      ; (if scale then [ "--scale-up" ] else [])
      ; [ "--place"
        ; [%string "'%{width#Int}x%{height#Int}@%{column#Int}x%{row#Int}'"]
        ; [%string "'%{url}'"]
        ]
      ]
  in
  String.concat ~sep:" " args ^ " >/dev/tty </dev/tty"
;;

let draw_images images =
  (* TODO: Currently drawing images is really slow and blocks user input. *)
  if true then clear_images ();
  match images with
  | [] -> None
  | images ->
    (* (match Core_unix.fork () with *)
    (*  | `In_the_parent pid -> Some pid *)
    (*  | `In_the_child -> *)
    List.iter images ~f:(fun image ->
      let _ : _ = Sys_unix.command (draw_command_for_image image) in
      ());
    None
;;

(* _exit 0) *)

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
  let rec go ~is_first_frame ~draw_process_pid : unit Deferred.t =
    let go ~draw_process_pid = go ~is_first_frame:false ~draw_process_pid in
    let frame_start_time = Time_ns.now () in
    let () = State_management.For_clock.advance_to clock frame_start_time
    and () = State_management.For_dimensions.update dimensions_manager in
    let%tydi { result = prev_result; _ } = Bonsai_driver.result driver in
    (* XXX: AAAAAAH This makes images faster?? *)
    Bonsai_driver.flush driver;
    Bonsai_driver.trigger_lifecycles driver;
    Bonsai_driver.flush driver;
    Bonsai_driver.trigger_lifecycles driver;
    Bonsai_driver.flush driver;
    Bonsai_driver.trigger_lifecycles driver;
    Bonsai_driver.flush driver;
    Bonsai_driver.trigger_lifecycles driver;
    let%tydi { result = (node, images) as result; broadcast_event } =
      Bonsai_driver.result driver
    in
    Option.iter draw_process_pid ~f:(fun draw_process_pid ->
      let _ : _ = Signal_unix.send Signal.kill (`Pid draw_process_pid) in
      ());
    (* TODO: Implement proper diffing + patching. This is only really needed
       for high latency input devices (e.g. my WSL laptop). *)
    let node_changed =
      is_first_frame || not (phys_equal (fst result) (fst prev_result))
    in
    if node_changed then Term.image term node;
    let draw_process_pid : Pid.t option =
      if is_first_frame
         || not ([%equal: Image.t list] (snd result) (snd prev_result))
      then draw_images images
      else None
    in
    let go () = go ~draw_process_pid in
    let%bind () = Async.Scheduler.yield () in
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
      Deferred.return ()
    | `Key (`Uchar uchar, [ `Ctrl ])
      when Uchar.equal (Uchar.of_char 'C') uchar
           || Uchar.equal (Uchar.of_char 'c') uchar ->
      Deferred.return ()
    | `Resize (width, height) ->
      State_management.For_dimensions.set
        dimensions_manager
        { width; height };
      go ()
    | (`Paste _ | `Mouse _ | `Key _) as event ->
      Effect.Expert.handle (broadcast_event (event : Event.t));
      go () [@tail]
    | `Timer -> go () [@tail]
  in
  let%bind () = go ~is_first_frame:true ~draw_process_pid:None in
  Term.release term;
  Deferred.return ()
;;

let start
  ?dispose
  ?nosig
  ?mouse
  ?bpaste
  ?(optimize = true)
  ?(target_frames_per_second = 60)
  (app : (Node.t * Image.t list) Computation.t)
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
