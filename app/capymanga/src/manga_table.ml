open! Core
open Bonsai
open Capytui
open Bonsai.Let_syntax
module Catpuccin = Capytui_catpuccin
open Mangadex_api.Types

let manga_list title (local_ graph) =
  let state, set_state = Bonsai.state_opt graph in
  let effect =
    let search = Outside_world.Manga_search.component graph in
    let%arr search in
    fun title -> search ~title:(match title with "" -> None | x -> Some x)
  in
  let effect = Bonsai.Effect_throttling.poll effect graph in
  let () =
    let callback =
      let%arr set_state and effect in
      fun title ->
        let%bind.Effect () = set_state None in
        let%bind.Effect response = effect title in
        match response with
        | Aborted -> Effect.Ignore
        | Finished response -> set_state (Some response)
    in
    Bonsai.Edge.on_change ~equal:[%equal: string] title ~callback graph
  in
  state
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
          ; focus = Int.min bottom_most (focus + (dimensions.height / 6))
          }
        | Up_half_page ->
          { last_top_press = None
          ; focus = Int.max 0 (focus - (dimensions.height / 6))
          }
      in
      if not (focus = new_model.focus)
      then
        Bonsai.Apply_action_context.schedule_event
          context
          (scroll_into_view
             ~bottom:((new_model.focus * 3) + 1)
             ~top:(new_model.focus * 3));
      new_model
  ;;
end

let render_row
  ~manga
  ~i
  ~focus
  ~dimensions
  ~(text : ?attrs:Attr.t list -> string -> Node.t)
  ~textbox_is_focused
  ~flavor
  =
  let title =
    match manga.Manga.attributes.title with
    | [] -> "Unknown title"
    | { string = title; language = _ } :: _ -> title
  in
  let attrs =
    if i = focus
    then
      [ Attr.bold
      ; (if not textbox_is_focused
         then Attr.foreground_color (Catpuccin.color ~flavor Green)
         else Attr.empty)
      ]
    else [ Attr.bold ]
  in
  let left_bar =
    Node.vcat
      (List.init 2 ~f:(fun _ ->
         text ~attrs (if i = focus then "│ " else "  ")))
  in
  let title = text ~attrs title in
  let tags =
    let tags = Tags.sort_tags manga.attributes.tags in
    let first_6_tags, rem = List.split_n tags 6 in
    let first_6_tags =
      Node.hcat
      @@ List.intersperse ~sep:(text " ")
      @@ List.map first_6_tags ~f:(fun tag -> Tags.render_tag ~flavor tag)
    in
    match rem with
    | [] -> first_6_tags
    | rem ->
      let count = List.length rem in
      Node.hcat
        [ first_6_tags
        ; text " "
        ; Node.text
            ~attrs:
              [ Attr.background_color (Catpuccin.color ~flavor Surface0)
              ; Attr.foreground_color (Catpuccin.color ~flavor Yellow)
              ]
            [%string " +%{count#Int} tags "]
        ]
  in
  let top_row = Node.hcat [ title; text " "; tags ] in
  let chapter_count =
    let preferred_language =
      (* TODO: DO not hard code this... *)
      "en"
    in
    match
      Option.first_some
        (List.find manga.attributes.description ~f:(fun { language; _ } ->
           String.equal language preferred_language))
        (List.hd manga.attributes.description)
    with
    | None -> Node.text ""
    | Some { string = description; language = _ } ->
      let description =
        String.concat_map description ~f:(function
          | c when Char.is_whitespace c -> " "
          | x -> Char.to_string x)
      in
      let description =
        let target_length = dimensions.Dimensions.width / 2 in
        if String.length description <= target_length
        then description
        else
          String.sub description ~pos:0 ~len:(target_length - 3)
          |> String.split ~on:' '
          |> List.rev
          |> List.tl
          |> Option.value ~default:[]
          |> List.rev
          |> String.concat ~sep:" "
          |> fun x ->
          (String.chop_suffix_if_exists ~suffix:"." x
           |> String.chop_suffix_if_exists ~suffix:"."
           |> String.chop_suffix_if_exists ~suffix:"."
           |> String.chop_suffix_if_exists ~suffix:";"
           |> String.chop_suffix_if_exists ~suffix:","
           |> String.chop_suffix_if_exists ~suffix:"!"
           |> String.chop_suffix_if_exists ~suffix:"?")
          ^ "..."
      in
      text
        ~attrs:
          [ Attr.foreground_color
              (Catpuccin.color
                 ~flavor
                 (if i = focus then Yellow else Subtext1))
          ]
        description
  in
  Node.hcat [ left_bar; Node.vcat [ top_row; chapter_count; text "" ] ]
;;

let table
  ~dimensions
  ~manga_title
  ~textbox_is_focused
  ~set_page
  manga_collection
  (local_ graph)
  =
  let inject_scroller, set_inject_scroller = Bonsai.state_opt graph in
  let%sub { Action.focus; last_top_press = _ }, inject_focus =
    let time_source = Bonsai.Incr.with_clock ~f:Ui_incr.return graph in
    let input =
      let%arr time_source
      and manga_collection
      and dimensions
      and inject_scroller in
      let scroll_into_view ~bottom ~top =
        match inject_scroller with
        | None -> Effect.Ignore
        | Some inject_scroller ->
          inject_scroller (Capytui_scroller.Scroll_to { top; bottom })
      in
      { Action.time_source; manga_collection; scroll_into_view; dimensions }
    in
    Tuple2.uncurry Bonsai.both
    @@ Bonsai.scope_model_n
         ~n:Two
         (module String)
         ~on:manga_title
         ~for_:(fun (local_ graph) ->
           Bonsai.state_machine1
             ~default_model:{ Action.focus = 0; last_top_press = None }
             ~apply_action:Action.apply_action
             input
             graph)
         graph
  in
  let text = Text.component graph in
  let flavor = Catpuccin.flavor graph in
  let selected_manga =
    let%arr manga_collection and focus in
    List.nth manga_collection.data focus
  in
  let url = Manga_cover.component selected_manga graph in
  let images =
    (* NOTE: I want to use the terminal dimensions here as I want the entire
       image to be big. *)
    let dimensions = Capytui.terminal_dimensions graph in
    let%arr url and dimensions in
    match url with
    | None -> []
    | Some { url } ->
      [ { Image.url
        ; row = 1
        ; column = dimensions.Dimensions.width / 2
        ; dimensions =
            { width = dimensions.width / 2; height = dimensions.height - 2 }
        ; scale = true
        }
      ]
  in
  let view =
    let%arr manga_collection
    and text
    and focus
    and flavor
    and textbox_is_focused
    and dimensions in
    let manga =
      List.mapi manga_collection.data ~f:(fun i manga ->
        render_row
          ~manga
          ~i
          ~focus
          ~dimensions
          ~text
          ~textbox_is_focused
          ~flavor)
    in
    Node.vcat manga
  in
  let%sub { view; inject = inject_scroller; less_keybindings_handler = _ } =
    Bonsai.scope_model
      (module String)
      ~on:manga_title
      ~for_:(fun (local_ graph) ->
        Capytui_scroller.component ~dimensions view graph)
      graph
  in
  let () =
    let on_activate =
      let%arr inject_scroller and set_inject_scroller in
      set_inject_scroller (Some inject_scroller)
    in
    Bonsai.Edge.lifecycle ~on_activate graph
  in
  let handler =
    let manga_collection = Bonsai.peek manga_collection graph in
    let focus = Bonsai.peek focus graph in
    let%arr inject_focus
    and inject_scroller
    and manga_collection
    and focus
    and set_page in
    fun (event : Event.t) ->
      match event with
      | `Key (`Enter, []) ->
        let%bind.Effect focus and manga_collection in
        (match focus, manga_collection with
         | Active focus, Active manga_collection ->
           (match List.nth manga_collection.data focus with
            | None -> Effect.Ignore
            | Some manga ->
              set_page ~replace:false (Page.Manga_view { manga }))
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
        Effect.all_unit
          [ inject_scroller Down
          ; inject_scroller Down
          ; inject_scroller Down
          ; inject_focus Down
          ]
      | `Key (`ASCII ('y' | 'Y'), [ `Ctrl ]) ->
        Effect.all_unit
          [ inject_scroller Up
          ; inject_scroller Up
          ; inject_scroller Up
          ; inject_focus Up
          ]
      | `Key (`ASCII 'j', [])
      | `Key (`Arrow `Down, [])
      | `Mouse (`Press (`Scroll `Down), _, _) ->
        inject_focus Down
      | `Key (`ASCII 'G', []) -> inject_focus Bottom
      | `Key (`ASCII 'g', []) -> inject_focus Top
      | _ -> inject_focus Other_key_pressed
  in
  let%arr view and images and handler in
  { Component.view; images; handler }
;;

let component
  ~dimensions
  ~textbox_is_focused
  ~manga_title
  ~set_page
  (local_ graph)
  =
  let manga_title =
    let bounced =
      let bounced =
        Bonsai_extra.value_stability
          ~equal:[%equal: string]
          ~time_to_stable:(Bonsai.return (Time_ns.Span.of_sec 1.0))
          manga_title
          graph
      in
      match%sub bounced with
      | Stable x -> x
      | Unstable { previously_stable = Some x; _ } -> x
      | Unstable { previously_stable = None; unstable_value } ->
        unstable_value
    in
    match%sub textbox_is_focused with
    | false -> manga_title
    | true -> bounced
  in
  let manga_list = manga_list manga_title graph in
  let sexp_for_debugging = Util.sexp_for_debugging graph in
  let flavor = Catpuccin.flavor graph in
  match%sub manga_list with
  | None ->
    let () = Loading_state.i_am_loading graph in
    Bonsai.return
      { Component.view = Node.none
      ; images = []
      ; handler = (fun _ -> Effect.Ignore)
      }
  | Some (Error error) ->
    let%arr error and sexp_for_debugging and flavor in
    { Component.view =
        sexp_for_debugging
          ~attrs:[ Attr.foreground_color (Catpuccin.color ~flavor Red) ]
          [%sexp (error : Error.t)]
    ; images = []
    ; handler = (fun _ -> Effect.Ignore)
    }
  | Some (Ok { data = []; _ }) ->
    let%arr flavor in
    let view =
      Node.vcat
        [ Node.hcat
            [ Node.text
                ~attrs:
                  [ Attr.background_color (Catpuccin.color ~flavor Crust)
                  ; Attr.foreground_color (Catpuccin.color ~flavor Text)
                  ; Attr.bold
                  ]
                "No results "
            ; Node.text
                ~attrs:
                  [ Attr.background_color (Catpuccin.color ~flavor Crust)
                  ; Attr.foreground_color (Catpuccin.color ~flavor Mauve)
                  ; Attr.bold
                  ]
                ":("
            ]
        ; Node.text
            ~attrs:
              [ Attr.background_color (Catpuccin.color ~flavor Crust)
              ; Attr.foreground_color (Catpuccin.color ~flavor Subtext0)
              ]
            "please try another search"
        ]
    in
    let images = [] in
    let handler _ = Effect.Ignore in
    { Component.view; images; handler }
  | Some (Ok manga_collection) ->
    table
      ~dimensions
      ~manga_title
      ~textbox_is_focused
      ~set_page
      manga_collection
      graph
;;
