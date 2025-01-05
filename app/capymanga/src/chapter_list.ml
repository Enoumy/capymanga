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

let chapter_list ~(manga : Manga.t Bonsai.t) (local_ graph) =
  let chapters, set_chapters = Bonsai.state_opt graph in
  let manga_id =
    let%arr manga in
    manga.id
  in
  let%sub () =
    match%sub chapters with
    | None ->
      Loading_state.i_am_loading graph;
      Bonsai.return ()
    | Some _ -> Bonsai.return ()
  in
  let on_activate =
    let get = Outside_world.Chapter_feed.component graph in
    let%arr get and set_chapters and manga_id in
    let%bind.Effect response = get ~manga_id ~ascending:true () in
    set_chapters (Some response)
  in
  let () = Bonsai.Edge.lifecycle ~on_activate graph in
  chapters
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

let scanlation_groups
  ~(chapter_list : Chapter.t Collection.t Bonsai.t)
  (local_ graph)
  =
  let ids =
    let%arr chapter_list in
    Set.of_list
      (module String)
      (List.filter_map
         ~f:(fun chapter ->
           let%map.Option { id; _ } =
             List.find chapter.Chapter.relationships ~f:(fun relationship ->
               String.equal relationship.type_ "scanlation_group")
           in
           id)
         chapter_list.data)
  in
  let flavor = Catpuccin.flavor graph in
  Bonsai.assoc_set
    (module String)
    ids
    ~f:(fun scanlation_group_id (local_ graph) ->
      let scanlation_group =
        Scanlation_group_cache.fetch ~scanlation_group_id graph
      in
      match%sub scanlation_group with
      | None ->
        Bonsai.map
          (Spinner.component ~kind:Dot (Bonsai.return "") graph)
          ~f:(fun x ~is_focused:_ -> x)
      | Some scanlation_group ->
        let%arr scanlation_group and flavor in
        fun ~is_focused ->
          (match scanlation_group with
           | Error error ->
             (* TODO: Hmm, unsure if showing an error _next_ to the UI is
                super nice in the table, specially if this error will be
                placed once per table. I think using something like a
                "global"/"dynamically scoped" error toast/notification would
                be good here... *)
             Node.text
               ~attrs:
                 [ Attr.background_color (Catpuccin.color ~flavor Crust)
                 ; Attr.foreground_color (Catpuccin.color ~flavor Red)
                 ]
               (Util.normalize_string_lossy (Error.to_string_mach error))
           | Ok { data = { attributes = { name = None; _ }; _ }; _ } ->
             Node.none
           | Ok { data = { attributes = { name = Some name; _ }; _ }; _ } ->
             let name = Util.normalize_string_lossy name in
             let group =
               Node.text
                 ~attrs:
                   [ Attr.background_color (Catpuccin.color ~flavor Surface0)
                   ; Attr.foreground_color
                       (Catpuccin.color
                          ~flavor
                          (if is_focused then Green else Pink))
                   ; (if is_focused then Attr.bold else Attr.empty)
                   ]
                 (" " ^ name ^ " ")
             in
             let by =
               Node.text
                 ~attrs:
                   [ Attr.background_color (Catpuccin.color ~flavor Base)
                   ; Attr.foreground_color
                       (Catpuccin.color
                          ~flavor
                          (if is_focused then Green else Text))
                   ; (if is_focused then Attr.bold else Attr.empty)
                   ]
                 " scanlation by "
             in
             Node.hcat [ by; group ]))
    graph
;;

let component
  :  is_focused:bool Bonsai.t -> dimensions:Dimensions.t Bonsai.t
  -> grab_focus:unit Effect.t Bonsai.t
  -> set_page:(replace:bool -> Page.t -> unit Effect.t) Bonsai.t
  -> Manga.t Bonsai.t -> local_ Bonsai.graph -> t Bonsai.t
  =
  fun ~is_focused ~dimensions ~grab_focus ~set_page manga (local_ graph) ->
  let chapter_list = chapter_list ~manga graph in
  let text = Text.component graph in
  let flavor = Catpuccin.flavor graph in
  match%sub chapter_list with
  | None ->
    let view =
      Spinner.component ~kind:Dot (Bonsai.return "Loading chapters...") graph
    in
    let view =
      let%arr view and dimensions in
      Node.center ~within:dimensions view
    in
    let%arr view in
    { component =
        { view; images = []; handler = (fun (_ : Event.t) -> Effect.Ignore) }
    ; is_focuseable = false
    }
  | Some (Error error) ->
    let view =
      let%arr text and error and flavor in
      let string = Sexp.to_string_hum [%sexp (error : Error.t)] in
      text
        ~attrs:[ Attr.foreground_color (Catpuccin.color ~flavor Red) ]
        (Util.normalize_string_lossy string)
    in
    let%sub { view; inject = _; less_keybindings_handler } =
      Capytui_scroller.component ~dimensions view graph
    in
    let%arr view and less_keybindings_handler in
    { component =
        { Component.view; handler = less_keybindings_handler; images = [] }
    ; is_focuseable = false
    }
  | Some (Ok { data = []; _ }) ->
    let view =
      let%arr text and dimensions and flavor in
      Node.center
        ~within:dimensions
        (text
           ~attrs:
             [ Attr.foreground_color (Catpuccin.color ~flavor Mauve)
             ; Attr.bold
             ]
           "no chapters :(")
    in
    let%arr view in
    { component =
        { Component.view
        ; images = []
        ; handler = (fun (_ : Event.t) -> Effect.Ignore)
        }
    ; is_focuseable = false
    }
  | Some (Ok chapter_list) ->
    let () = Bonsai.Edge.lifecycle ~on_activate:grab_focus graph in
    let inject_scroller, set_inject_scroller = Bonsai.state_opt graph in
    let%sub { Action.focus; last_top_press = _ }, inject_focus =
      let time_source = Bonsai.Incr.with_clock ~f:Ui_incr.return graph in
      let input =
        let%arr time_source
        and chapter_list
        and dimensions
        and inject_scroller in
        let scroll_into_view ~bottom ~top =
          match inject_scroller with
          | None -> Effect.Ignore
          | Some inject_scroller ->
            inject_scroller (Capytui_scroller.Scroll_to { top; bottom })
        in
        { Action.time_source; chapter_list; scroll_into_view; dimensions }
      in
      let manga_id =
        let%arr manga in
        manga.id
      in
      (Bonsai.scope_model
         (module Manga_id)
         ~on:manga_id
         ~for_:(fun (local_ graph) ->
           Tuple2.uncurry Bonsai.both
           @@ Bonsai.state_machine1
                ~default_model:{ Action.focus = 0; last_top_press = None }
                ~apply_action:Action.apply_action
                input
                graph))
        graph
    in
    let scanlation_groups = scanlation_groups ~chapter_list graph in
    let lines =
      let%arr chapter_list
      and text
      and focus
      and flavor
      and is_focused
      and scanlation_groups in
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
          let scanlation_group =
            let%bind.Option { id; _ } =
              List.find chapter.relationships ~f:(fun relationship ->
                String.equal relationship.type_ "scanlation_group")
            in
            Core.Map.find scanlation_groups id
          in
          let row_is_focused = is_focused && i = focus in
          List.intersperse ~sep:(text " ")
          @@ List.filter_opt
               [ Option.map chapter.attributes.volume ~f:(fun volume ->
                   Node.hcat
                     [ text
                         ~attrs:
                           [ Attr.foreground_color
                               (Catpuccin.color ~flavor Lavender)
                           ]
                         ("Vol " ^ volume)
                     ])
               ; Option.map chapter.attributes.chapter ~f:(fun chapter ->
                   Node.hcat
                     [ text
                         ~attrs:
                           [ Attr.foreground_color
                               (Catpuccin.color ~flavor Yellow)
                           ]
                         ("Ch " ^ chapter)
                     ])
               ; Some (text ~attrs:[ Attr.bold ] title)
               ; Option.map scanlation_group ~f:(fun f ->
                   f ~is_focused:row_is_focused)
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
      let%arr lines in
      Node.pad ~l:2 @@ Node.vcat lines
    in
    let%sub { view; inject = inject_scroller; less_keybindings_handler = _ } =
      Capytui_scroller.component ~dimensions view graph
    in
    let () =
      let on_activate =
        let%arr inject_scroller and set_inject_scroller in
        set_inject_scroller (Some inject_scroller)
      in
      Bonsai.Edge.lifecycle ~on_activate graph
    in
    let handler =
      let chapter_list = Bonsai.peek chapter_list graph in
      let focus = Bonsai.peek focus graph in
      let%arr inject_focus
      and inject_scroller
      and chapter_list
      and focus
      and set_page in
      fun (event : Event.t) ->
        match event with
        | `Key (`Enter, []) ->
          let%bind.Effect focus and chapter_list in
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
    let%arr view and handler in
    { component = { Component.view; handler; images = [] }
    ; is_focuseable = true
    }
;;
