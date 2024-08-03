open! Core
open Bonsai
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin
open Mangadex_api.Types

let manga_list =
  let%sub state, set_state = Bonsai.state_opt () in
  let%sub () =
    let%sub on_activate =
      let%arr set_state = set_state in
      let%bind.Effect response =
        Effect.of_deferred_fun
          (fun () ->
            let%bind.Async.Deferred () =
              Async.Clock_ns.after (Time_ns.Span.of_sec 2.0)
            in
            Mangadex_api.Search.search ~limit:100 ())
          ()
      in
      set_state (Some response)
    in
    Bonsai.Edge.lifecycle ~on_activate ()
  in
  return state
;;

module Action = struct
  type t =
    | Down
    | Up
    | Top
    | Bottom
    | Other_key_pressed

  type model =
    { focus : int
    ; last_top_press : Time_ns.t option
    }

  let apply_action
    _
    (input :
      (Manga.t Collection.t * Bonsai.Time_source.t)
        Bonsai.Computation_status.t)
    ({ focus; last_top_press } as model : model)
    (action : t)
    =
    match input with
    | Inactive -> model
    | Active (input, time_source) ->
      (match action with
       | Down ->
         if focus >= List.length input.data - 1
         then { last_top_press = None; focus = List.length input.data - 1 }
         else { last_top_press = None; focus = focus + 1 }
       | Up -> { last_top_press = None; focus = Int.max 0 (focus - 1) }
       | Other_key_pressed -> { last_top_press = None; focus }
       | Top ->
         let now = Bonsai.Time_source.now time_source in
         (match last_top_press with
          | None -> { last_top_press = Some now; focus }
          | Some last_top_press ->
            (match
               Time_ns.Span.O.(
                 Time_ns.diff now last_top_press < Time_ns.Span.of_sec 0.3)
             with
             | true -> { last_top_press = None; focus = 0 }
             | false -> { last_top_press = Some now; focus }))
       | Bottom ->
         { last_top_press = None; focus = List.length input.data - 1 })
  ;;
end

let table manga_collection =
  let%sub { Action.focus; last_top_press = _ }, inject_focus =
    let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
    Bonsai.state_machine1
      ~default_model:{ Action.focus = 0; last_top_press = None }
      ~apply_action:Action.apply_action
      (Value.both manga_collection time_source)
  in
  let%sub () =
    let%sub callback =
      let%arr inject_focus = inject_focus in
      fun (event : Event.t) ->
        (* TODO: Implement a page scroller, maybe with an offset. *)
        match event with
        | `Mouse _ | `Paste _ -> Effect.Ignore
        | `Key (`ASCII 'k', []) | `Key (`Arrow `Up, []) -> inject_focus Up
        | `Key (`ASCII 'j', []) | `Key (`Arrow `Down, []) ->
          inject_focus Down
        | `Key (`ASCII 'G', []) -> inject_focus Bottom
        | `Key (`ASCII 'g', []) -> inject_focus Top
        | _ -> inject_focus Other_key_pressed
    in
    (* TODO: Make this be a global handler that nicely keeps track of the
       active keybindings and shows a nice menu with them. Maybe a higher
       level library. *)
    Capytui.listen_to_events callback
  in
  let%sub text = Text.component in
  let%sub mauve = Catpuccin.color Green in
  let%arr manga_collection = manga_collection
  and focus = focus
  and text = text
  and mauve = mauve in
  let manga =
    List.mapi manga_collection.data ~f:(fun i manga ->
      match manga.attributes.title with
      | [] -> text "Unknown title"
      | { string; language = _ } :: _ ->
        let attrs =
          if i = focus
          then [ Attr.bold; Attr.foreground_color mauve ]
          else []
        in
        text ~attrs string)
  in
  Node.vcat manga
;;

let component =
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
  let%sub manga_list = manga_list in
  match%sub manga_list with
  | None ->
    let%sub () = Loading_state.i_am_loading in
    Bonsai.const Node.none
  | Some (Error error) ->
    let%sub red = Catpuccin.color Red in
    let%arr error = error
    and sexp_for_debugging = sexp_for_debugging
    and red = red in
    sexp_for_debugging
      ~attrs:[ Attr.foreground_color red ]
      [%sexp (error : Error.t)]
  | Some (Ok manga_collection) -> table manga_collection
;;
