open! Core
open Bonsai
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin
open Mangadex_api.Types

let manga_list title =
  let%sub title =
    let%sub bounced =
      Bonsai_extra.value_stability
        ~equal:[%equal: string]
        ~time_to_stable:(Value.return (Time_ns.Span.of_sec 1.0))
        title
    in
    match%sub bounced with
    | Stable x -> Bonsai.read x
    | Unstable { previously_stable = Some x; _ } -> Bonsai.read x
    | Unstable { previously_stable = None; unstable_value } ->
      Bonsai.read unstable_value
  in
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

let table
  ~set_textbox_focus
  ~textbox_is_focused
  ~textbox_view
  ~textbox_handler
  ~title
  manga_collection
  =
  let%sub { Action.focus; last_top_press = _ }, inject_focus =
    let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
    Bonsai.state_machine1
      ~default_model:{ Action.focus = 0; last_top_press = None }
      ~apply_action:Action.apply_action
      (Value.both manga_collection time_source)
  in
  let%sub () =
    let%sub callback =
      let%arr inject_focus = inject_focus
      and textbox_is_focused = textbox_is_focused
      and textbox_handler = textbox_handler
      and set_textbox_focus = set_textbox_focus in
      let normal_handler (event : Event.t) =
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
      fun event ->
        if textbox_is_focused
        then (
          match event with
          | `Key (`Escape, []) -> set_textbox_focus false
          | _ -> textbox_handler event)
        else (
          match event with
          | `Key (`ASCII '/', []) | `Key (`ASCII ('s' | 'S'), [ `Ctrl ]) ->
            set_textbox_focus true
          | _ -> normal_handler event)
    in
    (* TODO: Make this be a global handler that nicely keeps track of the
       active keybindings and shows a nice menu with them. Maybe a higher
       level library. *)
    Capytui.listen_to_events callback
  in
  let%sub text = Text.component in
  let%sub mauve = Catpuccin.color Green in
  let%sub salmon = Catpuccin.color Flamingo in
  let%sub selected_manga =
    let%arr manga_collection = manga_collection
    and focus = focus in
    List.nth manga_collection.data focus
  in
  let%sub image = Manga_cover.component selected_manga in
  let%arr manga_collection = manga_collection
  and focus = focus
  and text = text
  and mauve = mauve
  and textbox_view = textbox_view
  and textbox_is_focused = textbox_is_focused
  and title = title
  and salmon = salmon
  and image = image in
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
               then Attr.foreground_color mauve
               else Attr.empty)
            ]
          else []
        in
        text ~attrs string)
  in
  let content =
    if textbox_is_focused || String.length title > 0
    then
      Node.hcat
        [ text
            ~attrs:
              [ (if textbox_is_focused
                 then Attr.foreground_color mauve
                 else Attr.foreground_color salmon)
              ]
            "Title search: "
        ; textbox_view
        ]
      :: text ""
      :: manga
    else manga
  in
  Node.vcat content, match image with None -> [] | Some x -> [ x ]
;;

let component =
  let%sub textbox_is_focused, set_textbox_focus = Bonsai.state false in
  let%sub { view = textbox_view; string = title; handler = textbox_handler } =
    Text_box.component ~is_focused:textbox_is_focused
  in
  let%sub manga_list = manga_list title in
  let%sub sexp_for_debugging = Util.sexp_for_debugging in
  match%sub manga_list with
  | None ->
    let%sub () = Loading_state.i_am_loading in
    Bonsai.const (Node.none, [])
  | Some (Error error) ->
    let%sub red = Catpuccin.color Red in
    let%arr error = error
    and sexp_for_debugging = sexp_for_debugging
    and red = red in
    ( sexp_for_debugging
        ~attrs:[ Attr.foreground_color red ]
        [%sexp (error : Error.t)]
    , [] )
  | Some (Ok manga_collection) ->
    table
      ~set_textbox_focus
      ~textbox_is_focused
      ~textbox_view
      ~textbox_handler
      ~title
      manga_collection
;;
