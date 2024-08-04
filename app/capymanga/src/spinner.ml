open! Core
open Bonsai.Let_syntax
open Capytui

module Kind = struct
  type t =
    | Dot
    | Fixed
end

module Config = struct
  type t =
    { frames : string Array.t
    ; tick_every : Time_ns.Span.t
    }

  let get : Kind.t -> t = function
    | Dot ->
      { frames = [| "⣾ "; "⣽ "; "⣻ "; "⢿ "; "⡿ "; "⣟ "; "⣯ "; "⣷ " |]
      ; tick_every = Time_ns.Span.of_sec 0.1
      }
    | Fixed ->
      { frames = [| "Loading..." |]
      ; tick_every = Time_ns.Span.of_sec 1_000.0
      }
  ;;
end

let component ~kind message =
  let%tydi { frames; tick_every } = Config.get kind in
  let%sub current_frame, tick =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ curr () -> (curr + 1) % Array.length frames)
      ()
  in
  let%sub () =
    let%sub tick =
      let%arr tick = tick in
      tick ()
    in
    Bonsai.Clock.every
      ~when_to_start_next_effect:`Every_multiple_of_period_non_blocking
      tick_every
      tick
  in
  let%sub frame =
    let%arr current_frame = current_frame in
    frames.(current_frame % Array.length frames)
  in
  let%sub flavor = Capytui_catpuccin.flavor in
  let%sub text = Text.component in
  let%arr text = text
  and message = message
  and frame = frame
  and flavor = flavor in
  Node.hcat
    [ text
        ~attrs:
          [ Attr.foreground_color (Capytui_catpuccin.color ~flavor Green) ]
        frame
    ; text message
    ]
;;
