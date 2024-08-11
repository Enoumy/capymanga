open! Core
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
open Capytui
module Catpuccin = Capytui_catpuccin

type t =
  { component : Component.t
  ; is_focuseable : bool
  }

let chapter_list ~(manga : Manga.t Value.t) =
  let%sub chapters, set_chapters = Bonsai.state_opt () in
  let%sub manga_id =
    let%arr manga = manga in
    manga.id
  in
  let%sub () =
    match%sub chapters with
    | None -> Loading_state.i_am_loading
    | Some _ -> Bonsai.const ()
  in
  let%sub on_activate =
    let%sub get = Outside_world.Chapter_feed.component in
    let%arr get = get
    and set_chapters = set_chapters
    and manga_id = manga_id in
    let%bind.Effect response = get ~manga_id ~ascending:true () in
    set_chapters (Some response)
  in
  let%sub () = Bonsai.Edge.lifecycle ~on_activate () in
  return chapters
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
    ; chapter_list : Chapter.t Collection.t
    ; scroll_into_view : bottom:int -> top:int -> unit Effect.t
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
    | Active { chapter_list; time_source; scroll_into_view; dimensions } ->
      let bottom_most = List.length chapter_list.data - 1 in
      let new_model =
        match action with
        | Down ->
          if focus >= List.length chapter_list.data - 1
          then
            { last_top_press = None
            ; focus = List.length chapter_list.data - 1
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
          (scroll_into_view ~bottom:new_model.focus ~top:new_model.focus);
      new_model
  ;;
end

let component
  :  is_focused:bool Value.t -> dimensions:Dimensions.t Value.t
  -> grab_focus:unit Effect.t Value.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Value.t
  -> Manga.t Value.t -> t Computation.t
  =
  fun ~is_focused ~dimensions ~grab_focus ~set_page manga ->
  let%sub chapter_list = chapter_list ~manga in
  let%sub text = Text.component in
  let%sub flavor = Catpuccin.flavor in
  match%sub chapter_list with
  | None ->
    let%sub view =
      Spinner.component ~kind:Dot (Value.return "Loading chapters...")
    in
    let%sub view =
      let%arr view = view
      and dimensions = dimensions in
      Node.center ~within:dimensions view
    in
    let%arr view = view in
    { component =
        { view; images = []; handler = (fun (_ : Event.t) -> Effect.Ignore) }
    ; is_focuseable = false
    }
  | Some (Error error) ->
    let%sub view =
      let%arr text = text
      and error = error
      and flavor = flavor in
      let string = Sexp.to_string_hum [%sexp (error : Error.t)] in
      text
        ~attrs:[ Attr.foreground_color (Catpuccin.color ~flavor Red) ]
        (Util.normalize_string_lossy string)
    in
    let%sub { view; inject = _; less_keybindings_handler } =
      Scroller.component ~dimensions view
    in
    let%arr view = view
    and less_keybindings_handler = less_keybindings_handler in
    { component =
        { Component.view; handler = less_keybindings_handler; images = [] }
    ; is_focuseable = false
    }
  | Some (Ok { data = []; _ }) ->
    let%sub view =
      let%arr text = text
      and dimensions = dimensions
      and flavor = flavor in
      Node.center
        ~within:dimensions
        (text
           ~attrs:
             [ Attr.foreground_color (Catpuccin.color ~flavor Mauve)
             ; Attr.bold
             ]
           "no chapters :(")
    in
    let%arr view = view in
    { component =
        { Component.view
        ; images = []
        ; handler = (fun (_ : Event.t) -> Effect.Ignore)
        }
    ; is_focuseable = false
    }
  | Some (Ok chapter_list) ->
    let%sub () = Bonsai.Edge.lifecycle ~on_activate:grab_focus () in
    let%sub inject_scroller, set_inject_scroller = Bonsai.state_opt () in
    let%sub { Action.focus; last_top_press = _ }, inject_focus =
      let%sub time_source = Bonsai.Incr.with_clock Ui_incr.return in
      let%sub input =
        let%arr time_source = time_source
        and chapter_list = chapter_list
        and dimensions = dimensions
        and inject_scroller = inject_scroller in
        let scroll_into_view ~bottom ~top =
          match inject_scroller with
          | None -> Effect.Ignore
          | Some inject_scroller ->
            inject_scroller (Scroller.Scroll_to { top; bottom })
        in
        { Action.time_source; chapter_list; scroll_into_view; dimensions }
      in
      let%sub manga_id =
        let%arr manga = manga in
        manga.id
      in
      Bonsai.scope_model (module Manga_id) ~on:manga_id
      @@ Bonsai.state_machine1
           ~default_model:{ Action.focus = 0; last_top_press = None }
           ~apply_action:Action.apply_action
           input
    in
    let%sub lines =
      let%arr chapter_list = chapter_list
      and text = text
      and focus = focus
      and flavor = flavor
      and is_focused = is_focused in
      let text ?attrs string =
        text ?attrs (Util.normalize_string_lossy string)
      in
      List.mapi chapter_list.data ~f:(fun i chapter ->
        let title =
          match chapter.attributes.title with
          | None -> "No title"
          | Some title -> title
        in
        let content =
          let text ?(attrs = []) string =
            if i = focus
            then
              text
                ~attrs:
                  (attrs
                   @ [ Attr.bold
                     ; Attr.foreground_color
                         (Catpuccin.color
                            ~flavor
                            (if is_focused then Green else Text))
                     ])
                string
            else text ~attrs string
          in
          List.intersperse ~sep:(text " ")
          @@ List.filter_opt
               [ Option.map chapter.attributes.volume ~f:(fun volume ->
                   Node.hcat [ text "Vol "; text volume ])
               ; Option.map chapter.attributes.chapter ~f:(fun chapter ->
                   Node.hcat [ text "Chapter "; text chapter ])
               ; Some (text title)
               ]
        in
        let prefix = if i = focus then "> " else "  " in
        Node.hcat
          [ text
              ~attrs:
                [ Attr.foreground_color
                    (Catpuccin.color
                       ~flavor
                       (if is_focused then Mauve else Text))
                ]
              prefix
          ; Node.hcat content
          ])
    in
    let%sub view =
      let%arr lines = lines in
      Node.pad ~l:2 @@ Node.vcat lines
    in
    let%sub { view; inject = inject_scroller; less_keybindings_handler = _ } =
      Scroller.component ~dimensions view
    in
    let%sub () =
      let%sub on_activate =
        let%arr inject_scroller = inject_scroller
        and set_inject_scroller = set_inject_scroller in
        set_inject_scroller (Some inject_scroller)
      in
      Bonsai.Edge.lifecycle ~on_activate ()
    in
    let%sub handler =
      let%sub chapter_list = Bonsai.yoink chapter_list in
      let%sub focus = Bonsai.yoink focus in
      let%arr inject_focus = inject_focus
      and inject_scroller = inject_scroller
      and chapter_list = chapter_list
      and focus = focus
      and set_page = set_page in
      fun (event : Event.t) ->
        match event with
        | `Key (`Enter, []) ->
          let%bind.Effect focus = focus
          and chapter_list = chapter_list in
          (match focus, chapter_list with
           | Active focus, Active chapter_list ->
             (match List.nth chapter_list.data focus with
              | None -> Effect.Ignore
              | Some chapter ->
                set_page ~replace:false (Page.Chapter_view { chapter }))
           | _ -> Effect.Ignore)
        | `Key (`ASCII 'k', [])
        | `Key (`Arrow `Up, [])
        | `Mouse (`Press (`Scroll `Up), _, _) ->
          inject_focus Up
        | `Key (`ASCII ('d' | 'D'), ([ `Ctrl ] | [])) ->
          inject_focus Down_half_page
        | `Key (`ASCII ('u' | 'U'), ([ `Ctrl ] | [])) ->
          inject_focus Up_half_page
        | `Key (`ASCII ('e' | 'E'), [ `Ctrl ]) ->
          Effect.all_unit [ inject_scroller Down; inject_focus Down ]
        | `Key (`ASCII ('y' | 'Y'), [ `Ctrl ]) ->
          Effect.all_unit [ inject_scroller Up; inject_focus Up ]
        | `Key (`ASCII 'j', [])
        | `Key (`Arrow `Down, [])
        | `Mouse (`Press (`Scroll `Down), _, _) ->
          inject_focus Down
        | `Key (`ASCII 'G', []) -> inject_focus Bottom
        | `Key (`ASCII 'g', []) -> inject_focus Top
        | _ -> inject_focus Other_key_pressed
    in
    let%arr view = view
    and handler = handler in
    { component = { Component.view; handler; images = [] }
    ; is_focuseable = true
    }
;;
