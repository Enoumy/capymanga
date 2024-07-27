open! Core
include Notty_unix.Term

let dimensions t =
  let width, height = size t in
  { Dimensions.width; height }
;;

let next_event_or_wait_delay t ~delay =
  let delay = Time_ns.Span.max Time_ns.Span.zero delay in
  if pending t
  then (event t :> Event.t)
  else
    let open Core_unix in
    match
      let input_file_descriptor, _ = fds t in
      select
        ~read:[ input_file_descriptor ]
        ~write:[]
        ~except:[]
        ~timeout:(`After delay)
        ()
    with
    | { read = []; write = _; except = _ } -> `Timer
    | { read = _ :: _; write = _; except = _ } -> (event t :> Event.t)
    | exception Unix_error (EINTR, _, _) -> (event t :> Event.t)
;;

let create ?dispose ?nosig ?mouse ?bpaste () =
  create ?mouse ?dispose ?nosig ?bpaste ()
;;
