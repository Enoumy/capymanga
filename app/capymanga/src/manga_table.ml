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
    | Up_half_page
    | Down_half_page

  type model =
    { focus : int
    ; last_top_press : Time_ns.t option
    }

  type input =
    { time_source : Bonsai.Time_source.t
    ; manga_collection : Manga.t Collection.t
    ; scroll_into_view : int -> unit Effect.t
    ; dimensions : Dimensions.t
    }

  let apply_action
    context
    (input : input Bonsai.Computation_status.t)
    ({ focus; last_top_press } as model : model)
    (action : t)
    =
    match input with
    | Inactive -> model
    | Active { manga_collection; time_source; scroll_into_view; dimensions }
      ->
      let bottom_most = List.length manga_collection.data - 1 in
      let new_model =
        match action with
        | Down ->
          if focus >= List.length manga_collection.data - 1
          then
            { last_top_press = None
            ; focus = List.length manga_collection.data - 1
            }
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
        | Bottom -> { last_top_press = None; focus = bottom_most }
        | Down_half_page ->
          { last_top_press = None
          ; focus = Int.min bottom_most (focus + (dimensions.height / 2))
          }
        | Up_half_page ->
          { last_top_press = None
          ; focus = Int.max 0 (focus - (dimensions.height / 2))
          }
      in
      if not (focus = new_model.focus)
      then
        Bonsai.Apply_action_context.schedule_event
          context
          (scroll_into_view new_model.focus);
      new_model
  ;;
end

module Scroll_into_view = struct
  type action =
    | Scroll_to of int
    | Up
    | Down

  type input =
    { dimensions : Dimensions.t
    ; manga_collection_count : int
    }

  let apply_action _ input offset action =
    match input with
    | Bonsai.Computation_status.Inactive -> offset
    | Active
        { dimensions = { Dimensions.height; width = _ }
        ; manga_collection_count
        } ->
      (match action with
       | Scroll_to scroll_to ->
         let min = offset in
         let max = offset + height - 1 in
         if scroll_to >= min && scroll_to <= max
         then offset
         else if scroll_to > max
         then offset + (scroll_to - max)
         else scroll_to
       | Up -> Int.max 0 (offset - 1)
       | Down -> Int.min (manga_collection_count - height) (offset + 1))
  ;;
end

let table ~dimensions ~manga_title ~textbox_is_focused manga_collection =
  let%sub offset, inject_offset =
    let%sub input =
      let%sub manga_collection_count =
        let%arr manga_collection = manga_collection in
        List.length manga_collection.Collection.data
      in
      let%arr dimensions = dimensions
      and manga_collection_count = manga_collection_count in
      { Scroll_into_view.dimensions; manga_collection_count }
    in
    Bonsai.state_machine1
      ~default_model:0
      ~apply_action:Scroll_into_view.apply_action
      input
  in
  let%sub { Action.focus; last_top_press = _ }, inject_focus =
    let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
    let%sub input =
      let%arr time_source = time_source
      and manga_collection = manga_collection
      and inject_offset = inject_offset
      and dimensions = dimensions in
      let scroll_into_view index = inject_offset (Scroll_to index) in
      { Action.time_source; manga_collection; scroll_into_view; dimensions }
    in
    Bonsai.scope_model (module String) ~on:manga_title
    @@ Bonsai.state_machine1
         ~default_model:{ Action.focus = 0; last_top_press = None }
         ~apply_action:Action.apply_action
         input
  in
  let%sub handler =
    let%arr inject_focus = inject_focus
    and inject_offset = inject_offset in
    fun (event : Event.t) ->
      (* TODO: Implement a page scroller, maybe with an offset. *)
      match event with
      | `Key (`ASCII 'k', [])
      | `Key (`Arrow `Up, [])
      | `Mouse (`Press (`Scroll `Up), _, _) ->
        (* TODO: Implement mouse support... *)
        inject_focus Up
      | `Key (`ASCII ('d' | 'D'), ([ `Ctrl ] | [])) ->
        inject_focus Down_half_page
      | `Key (`ASCII ('u' | 'U'), ([ `Ctrl ] | [])) ->
        inject_focus Up_half_page
      | `Key (`ASCII ('e' | 'E'), [ `Ctrl ]) ->
        Effect.all_unit [ inject_offset Down; inject_focus Down ]
      | `Key (`ASCII ('y' | 'Y'), [ `Ctrl ]) ->
        Effect.all_unit [ inject_offset Up; inject_focus Up ]
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
  let%sub view =
    let%arr manga_collection = manga_collection
    and text = text
    and focus = focus
    and flavor = flavor
    and textbox_is_focused = textbox_is_focused
    and offset = offset
    and dimensions = dimensions in
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
    let view =
      Node.vcat
        (*  Node.sexp_for_debugging *)
        (*   [%message (dimensions : Dimensions.t) (offset : int)] *)
        (* :: *)
        manga
    in
    let view = Node.crop ~t:offset view in
    let curr_height = Node.height view in
    Node.crop
      ~b:(Int.max 0 (curr_height - dimensions.Dimensions.height))
      view
  in
  let%arr view = view
  and image = image
  and handler = handler in
  let images = match image with None -> [] | Some (x, _) -> [ x ] in
  { view; images; handler }
;;

let component ~dimensions ~textbox_is_focused ~manga_title =
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
    table ~dimensions ~manga_title ~textbox_is_focused manga_collection
;;
