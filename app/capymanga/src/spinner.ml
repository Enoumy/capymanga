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

let component ~kind message (local_ graph) =
  let%tydi { frames; tick_every } = Config.get kind in
  let current_frame, tick =
    Bonsai.state_machine0
      ~default_model:0
      ~apply_action:(fun _ curr () -> (curr + 1) % Array.length frames)
      graph
  in
  let () =
    let tick =
      let%arr tick in
      tick ()
    in
    Bonsai.Clock.every
      ~when_to_start_next_effect:`Every_multiple_of_period_non_blocking
      tick_every
      tick
      graph
  in
  let frame =
    let%arr current_frame in
    frames.(current_frame % Array.length frames)
  in
  let flavor = Capytui_catpuccin.flavor graph in
  let text = Text.component graph in
  let%arr text and message and frame and flavor in
  Node.hcat
    [ text
        ~attrs:
          [ Attr.foreground_color (Capytui_catpuccin.color ~flavor Green) ]
        frame
    ; text message
    ]
;;
