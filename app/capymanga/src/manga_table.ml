open! Core
open Bonsai
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin
open Mangadex_api.Types

type t =
  { view : Node.t
  ; images : Image.t list
  ; handler : Event.t -> unit Effect.t
  }

let manga_list title =
  let%sub state, set_state = Bonsai.state_opt () in
  let%sub effect =
    Bonsai.const
    @@ fun title ->
    Effect.of_deferred_fun
      (fun () ->
        Mangadex_api.Search.search
          ~limit:100
          ?title:(match title with "" -> None | x -> Some x)
          ())
      ()
  in
  let%sub effect = Bonsai.Effect_throttling.poll effect in
  let%sub () =
    let%sub callback =
      let%arr set_state = set_state
      and effect = effect in
      fun title ->
        let%bind.Effect () = set_state None in
        let%bind.Effect response = effect title in
        match response with
        | Aborted -> Effect.Ignore
        | Finished response -> set_state (Some response)
    in
    Bonsai.Edge.on_change ~equal:[%equal: string] title ~callback
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

let table ~manga_title ~textbox_is_focused manga_collection =
  let%sub { Action.focus; last_top_press = _ }, inject_focus =
    let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
    Bonsai.scope_model (module String) ~on:manga_title
    @@ Bonsai.state_machine1
         ~default_model:{ Action.focus = 0; last_top_press = None }
         ~apply_action:Action.apply_action
         (Value.both manga_collection time_source)
  in
  let%sub handler =
    let%arr inject_focus = inject_focus in
    fun (event : Event.t) ->
      (* TODO: Implement a page scroller, maybe with an offset. *)
      match event with
      | `Key (`ASCII 'k', [])
      | `Key (`Arrow `Up, [])
      | `Mouse (`Press (`Scroll `Up), _, _) ->
        (* TODO: Implement mouse support... *)
        inject_focus Up
      | `Key (`ASCII 'j', [])
      | `Key (`Arrow `Down, [])
      | `Mouse (`Press (`Scroll `Down), _, _) ->
        inject_focus Down
      | `Key (`ASCII 'G', []) -> inject_focus Bottom
      | `Key (`ASCII 'g', []) -> inject_focus Top
      | _ -> inject_focus Other_key_pressed
  in
  let%sub text = Text.component in
  let%sub flavor = Catpuccin.flavor in
  let%sub selected_manga =
    let%arr manga_collection = manga_collection
    and focus = focus in
    List.nth manga_collection.data focus
  in
  let%sub image = Manga_cover.component selected_manga in
  let%arr manga_collection = manga_collection
  and focus = focus
  and text = text
  and flavor = flavor
  and textbox_is_focused = textbox_is_focused
  and image = image
  and handler = handler in
  let manga =
    List.mapi manga_collection.data ~f:(fun i manga ->
      match manga.attributes.title with
      | [] -> text "Unknown title"
      | { string; language = _ } :: _ ->
        let attrs =
          if i = focus
          then
            [ Attr.bold
            ; (if not textbox_is_focused
               then Attr.foreground_color (Catpuccin.color ~flavor Green)
               else Attr.empty)
            ]
          else []
        in
        text ~attrs string)
  in
  let view = Node.vcat manga in
  let images = match image with None -> [] | Some (x, _) -> [ x ] in
  { view; images; handler }
;;

let component ~dimensions:_ ~textbox_is_focused ~manga_title =
  let%sub manga_title =
    let%sub bounced =
      let%sub bounced =
        Bonsai_extra.value_stability
          ~equal:[%equal: string]
          ~time_to_stable:(Value.return (Time_ns.Span.of_sec 1.0))
          manga_title
      in
      match%sub bounced with
      | Stable x -> Bonsai.read x
      | Unstable { previously_stable = Some x; _ } -> Bonsai.read x
      | Unstable { previously_stable = None; unstable_value } ->
        Bonsai.read unstable_value
    in
    match%sub textbox_is_focused with
    | false -> return manga_title
    | true -> return bounced
  in
  let%sub manga_list = manga_list manga_title in
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
  let%sub flavor = Catpuccin.flavor in
  match%sub manga_list with
  | None ->
    let%sub () = Loading_state.i_am_loading in
    Bonsai.const
      { view = Node.none; images = []; handler = (fun _ -> Effect.Ignore) }
  | Some (Error error) ->
    let%arr error = error
    and sexp_for_debugging = sexp_for_debugging
    and flavor = flavor in
    { view =
        sexp_for_debugging
          ~attrs:[ Attr.foreground_color (Catpuccin.color ~flavor Red) ]
          [%sexp (error : Error.t)]
    ; images = []
    ; handler = (fun _ -> Effect.Ignore)
    }
  | Some (Ok manga_collection) ->
    table ~manga_title ~textbox_is_focused manga_collection
;;
