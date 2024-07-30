open! Core
open Bonsai.Let_syntax
open Capytui

module Kind = struct
  type t = Dot
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
  let%sub mauve = Capytui_catpuccin.color Mauve in
  let%sub text = Text.component in
  let%arr text = text
  and message = message
  and frame = frame
  and mauve = mauve in
  Node.hcat
    [ text ~attrs:[ Attr.foreground_color mauve ] frame; text message ]
;;
