open! Core
open! Capytui
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let constrain_width ~(dimensions : Dimensions.t) node =
  let width = Node.width node in
  Node.crop ~r:(Int.max 0 (width - dimensions.width)) node
;;

let get_description : Manga.t -> string option =
  fun manga ->
  match manga.attributes.description with
  | [] -> None
  | descriptions ->
    let%map.Option description =
      List.find descriptions ~f:(fun description ->
        String.equal "en" description.language)
    in
    description.string
;;

let wrap_into_lines =
  let open struct
    type acc =
      { finished_lines : string list Reversed_list.t
      ; current_line : string Reversed_list.t
      ; current_length : int
      }
  end in
  fun ~target_width (string : string) ->
    let acc =
      String.split_on_chars ~on:[ ' ' ] string
      |> List.fold
           ~init:
             { finished_lines = Reversed_list.[]
             ; current_line = Reversed_list.[]
             ; current_length = 0
             }
           ~f:(fun acc word ->
             let does_word_fit =
               acc.current_length + String.length word + 1 <= target_width
             in
             match does_word_fit with
             | true ->
               let current_line = Reversed_list.(word :: acc.current_line)
               and current_length =
                 acc.current_length + String.length word + 1
               in
               { acc with current_line; current_length }
             | false ->
               let current_line = Reversed_list.[ word ]
               and current_length = String.length word
               and finished_lines =
                 Reversed_list.(
                   Reversed_list.rev acc.current_line :: acc.finished_lines)
               in
               { finished_lines; current_line; current_length })
    in
    let finished_lines =
      match acc.current_line with
      | [] -> Reversed_list.rev acc.finished_lines
      | _ -> Reversed_list.(rev (rev acc.current_line :: acc.finished_lines))
    in
    List.map finished_lines ~f:(fun line -> String.concat ~sep:" " line)
;;

let description_view ~dimensions ~(manga : Manga.t Value.t) =
  let%sub text = Text.component in
  let%sub description = return (manga >>| get_description) in
  let%sub view =
    match%sub description with
    | None | Some "" ->
      let%arr text = text in
      text "No description available"
    | Some description ->
      let%sub lines =
        let%arr description = description in
        String.split ~on:'\n' description
        |> List.map ~f:Util.normalize_string_lossy
      in
      let%sub wrapped_lines =
        let%arr lines = lines
        and { Dimensions.width = target_width; _ } = dimensions in
        List.map lines ~f:(fun line -> wrap_into_lines ~target_width line)
      in
      let%arr text = text
      and wrapped_lines = wrapped_lines in
      Node.vcat
        (List.map wrapped_lines ~f:(fun wrapped_line ->
           Node.vcat (List.map wrapped_line ~f:text)))
  in
  let%arr view = view in
  view
;;

let author ~(manga : Manga.t Value.t) =
  let%sub author, set_author = Bonsai.state_opt () in
  let%sub author_id =
    let%arr manga = manga in
    List.find_map manga.relationships ~f:(fun relationship ->
      match relationship.type_ with
      | "author" -> Some relationship.id
      | _ -> None)
  in
  let%sub () =
    match%sub author with
    | None -> Loading_state.i_am_loading
    | Some _ -> Bonsai.const ()
  in
  match%sub author_id with
  | None -> Bonsai.const None
  | Some author_id ->
    let%sub on_activate =
      let%sub get = Outside_world.Author.component in
      let%arr get = get
      and set_author = set_author
      and author_id = author_id in
      let%bind.Effect response = get ~author_id in
      set_author (Some response)
    in
    let%sub () = Bonsai.Edge.lifecycle ~on_activate () in
    return author
;;

let author_view ~(manga : Manga.t Value.t) =
  let%sub author = author ~manga in
  let%sub text = Text.component in
  match%sub author with
  | None ->
    let%sub spinner = Spinner.component ~kind:Dot (Value.return "") in
    let%arr spinner = spinner
    and text = text in
    Some (Node.hcat [ text "Author: "; spinner ])
  | Some (Error _) -> Bonsai.const None
  | Some (Ok author) ->
    let%sub flavor = Catpuccin.flavor in
    let%arr author = author
    and text = text
    and flavor = flavor in
    Some
      (Node.hcat
         [ text ~attrs:[] "Author: "
         ; text
             ~attrs:
               [ Attr.foreground_color (Catpuccin.color ~flavor Yellow)
               ; Attr.background_color (Catpuccin.color ~flavor Surface0)
               ; Attr.bold
               ]
             (" "
              ^ String.map author.data.attributes.name ~f:(fun c ->
                if Char.is_whitespace c then ' ' else c)
              ^ " ")
         ])
;;

let status_view ~(manga : Manga.t Value.t) =
  let%sub status =
    let%arr manga = manga in
    manga.attributes.status
  in
  let%sub flavor = Catpuccin.flavor in
  let%sub text = Text.component in
  let%arr status = status
  and text = text
  and flavor = flavor in
  let color =
    match status with
    | "completed" -> Catpuccin.color ~flavor Green
    | "ongoing" -> Catpuccin.color ~flavor Lavender
    | "hiatus" -> Catpuccin.color ~flavor Mauve
    | _ -> Catpuccin.color ~flavor Text
  in
  Node.hcat
    [ text ~attrs:[] "Status: "
    ; text
        ~attrs:
          [ Attr.foreground_color color
          ; Attr.background_color (Catpuccin.color ~flavor Surface0)
          ; Attr.bold
          ]
        (" " ^ (String.uppercase @@ Util.normalize_string_lossy status) ^ " ")
    ]
;;

let tags_view ~dimensions ~(manga : Manga.t Value.t) =
  let%sub flavor = Catpuccin.flavor in
  let%sub tags =
    let%arr flavor = flavor
    and manga = manga in
    Tags.sort_tags manga.attributes.tags
    |> List.map ~f:(fun tag -> Tags.render_tag ~flavor tag)
  in
  let%sub text = Text.component in
  let%arr tags = tags
  and text = text
  and { Dimensions.width = target_width; _ } = dimensions in
  let open struct
    type acc =
      { finished_lines : Node.t list Reversed_list.t
      ; current_line : Node.t Reversed_list.t
      ; current_length : int
      }
  end in
  let acc =
    List.fold
      tags
      ~init:
        { finished_lines = Reversed_list.[]
        ; current_line = Reversed_list.[]
        ; current_length = 0
        }
      ~f:(fun acc tag ->
        let width = Node.width tag in
        let does_tag_fit = acc.current_length + width + 1 <= target_width in
        match does_tag_fit with
        | true ->
          { acc with
            current_line = Reversed_list.(tag :: acc.current_line)
          ; current_length = acc.current_length + 1 + width
          }
        | false ->
          let current_line = Reversed_list.[ tag ]
          and current_length = width
          and finished_lines =
            Reversed_list.(rev acc.current_line :: acc.finished_lines)
          in
          { current_line; current_length; finished_lines })
  in
  let finished_lines =
    match acc.current_line with
    | [] -> Reversed_list.rev acc.finished_lines
    | _ -> Reversed_list.(rev (rev acc.current_line :: acc.finished_lines))
  in
  Node.vcat
  @@ List.map finished_lines ~f:(fun line ->
    Node.hcat @@ List.intersperse ~sep:(text " ") line)
;;

let sidebar
  ~(is_focused : bool Value.t)
  ~(dimensions : Dimensions.t Value.t)
  (manga : Manga.t Value.t)
  =
  let%sub flavor = Catpuccin.flavor in
  let%sub description_view = description_view ~dimensions ~manga in
  let%sub author_view = author_view ~manga in
  let%sub status_view = status_view ~manga in
  let%sub tags_view = tags_view ~dimensions ~manga in
  let%sub view =
    let%arr description_view = description_view
    and author_view = author_view
    and status_view = status_view
    and tags_view = tags_view in
    Node.pad ~t:1
    @@ Node.vcat
    @@ List.intersperse ~sep:(Node.text "")
    @@ List.filter_opt
    @@ [ Some (Node.vcat @@ List.filter_opt [ author_view; Some status_view ])
       ; Some tags_view
       ; Some description_view
       ]
  in
  let%sub url = Manga_cover.component (Value.map ~f:Option.some manga) in
  let%sub image_height =
    let%arr { height; _ } = dimensions in
    height / 3
  in
  let%sub images =
    let%arr url = url
    and dimensions = dimensions
    and image_height = image_height in
    match url with
    | None -> []
    | Some { url } ->
      [ { Image.url
        ; row = 4
        ; column = 2
        ; dimensions = { height = image_height; width = dimensions.width }
        ; scale = true
        }
      ]
  in
  let%sub top_section =
    let%sub title, bottom_bar =
      let%arr manga = manga
      and flavor = flavor
      and { width; _ } = dimensions
      and is_focused = is_focused in
      let title =
        match manga.attributes.title with
        | [] -> "Unknown title"
        | { string = title; _ } :: _ -> title
      in
      let title =
        Node.text
          ~attrs:
            [ Attr.foreground_color (Catpuccin.color ~flavor Yellow)
            ; Attr.background_color (Catpuccin.color ~flavor Base)
            ; Attr.bold
            ]
          (Util.normalize_string_lossy title)
      in
      let pad =
        Node.text
          ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Base) ]
          (String.make (Int.max 0 ((width - Node.width title) / 2)) ' ')
      in
      let normal = Node.hcat [ pad; title; pad ] in
      ( Node.hcat
          [ normal
          ; Node.text
              ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Base) ]
              (String.make (Int.max 0 @@ (width - Node.height normal)) ' ')
          ]
      , Node.text
          ~attrs:
            [ Attr.background_color (Catpuccin.color ~flavor Base)
            ; Attr.foreground_color (Catpuccin.color ~flavor Green)
            ]
          (String.concat
           @@ List.init width ~f:(fun _ -> if is_focused then "─" else " "))
      )
    in
    let%sub picture =
      let%arr { width; _ } = dimensions
      and flavor = flavor
      and image_height = image_height in
      Node.vcat
        (List.init image_height ~f:(fun _ ->
           Node.text
             ~attrs:
               [ Attr.background_color (Catpuccin.color ~flavor Mantle) ]
             (String.make width ' ')))
    in
    let%arr title = title
    and picture = picture
    and bottom_bar = bottom_bar in
    Node.vcat [ title; picture; bottom_bar ]
  in
  let%sub { view = sexp_view; inject = _; less_keybindings_handler } =
    let%sub dimensions =
      let%arr dimensions = dimensions
      and top_section = top_section in
      { Dimensions.height = dimensions.height - Node.height top_section
      ; width = dimensions.width
      }
    in
    Capytui_scroller.component ~dimensions view
  in
  let%sub view =
    let%arr sexp_view = sexp_view
    and top_section = top_section in
    Node.vcat [ top_section; sexp_view ]
  in
  let%sub view =
    let%arr dimensions = dimensions
    and view = view in
    constrain_width ~dimensions view
  in
  let%sub handler =
    let%arr less_keybindings_handler = less_keybindings_handler in
    fun (event : Event.t) ->
      match event with _ -> less_keybindings_handler event
  in
  let%arr view = view
  and handler = handler
  and images = images in
  { Component.view; handler; images }
;;

let chapter_table ~(dimensions : Dimensions.t Value.t) ~grab_focus manga =
  Chapter_list.component ~dimensions manga ~grab_focus
;;

type focus =
  | Sidebar
  | Chapter_table
  | Search_bar
[@@deriving equal]

let component ~dimensions ~(manga : Manga.t Value.t) ~set_page ~go_back =
  let%sub text = Text.component in
  let%sub flavor = Catpuccin.flavor in
  let%sub manga_id =
    let%arr manga = manga in
    manga.id
  in
  (* NOTE: Maybe this scope_model should only be for the scroller? *)
  Bonsai.scope_model (module Manga_id) ~on:manga_id
  @@
  let%sub content_dimensions =
    let%arr dimensions = dimensions in
    let height = dimensions.Dimensions.height - 3 in
    let width = dimensions.width - 4 in
    { Dimensions.height; width }
  in
  let%sub left_dimensions, right_dimensions =
    let%arr content_dimensions = content_dimensions in
    let left =
      { content_dimensions with width = content_dimensions.width / 3 }
    in
    let right =
      { content_dimensions with
        width = content_dimensions.width - left.width
      }
    in
    left, right
  in
  let%sub focus, set_focus = Bonsai.state Sidebar in
  let%sub is_textbox_focused =
    return (focus >>| function Search_bar -> true | _ -> false)
  in
  let%sub { view = search_box_view
          ; string = search_box_string
          ; handler = search_box_handler
          ; set = _
          }
    =
    let%sub extra_attrs =
      let%arr flavor = flavor in
      [ Attr.background_color (Catpuccin.color ~flavor Base) ]
    in
    Text_box.component ~extra_attrs ~is_focused:is_textbox_focused
  in
  let%sub top_bar =
    Top_bar.component
      ~instructions:
        (Value.return [ "Backspace", "back"; "Tab", "switch focus" ])
  in
  let%sub top_bar =
    let%arr top_bar = top_bar
    and search_box_view = search_box_view
    and is_textbox_focused = is_textbox_focused
    and text = text
    and flavor = flavor in
    match is_textbox_focused with
    | false -> top_bar
    | true ->
      Node.hcat
        [ top_bar
        ; text " "
        ; text
            ~attrs:
              [ Attr.foreground_color (Catpuccin.color ~flavor Green)
              ; Attr.bold
              ; Attr.background_color (Catpuccin.color ~flavor Surface0)
              ]
            " Search: "
        ; text
            ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Base) ]
            " "
        ; search_box_view
        ; text
            ~attrs:[ Attr.background_color (Catpuccin.color ~flavor Base) ]
            " "
        ]
  in
  let%sub { view = sidebar_view; images; handler = sidebar_handler } =
    let%sub is_focused =
      let%arr focus = focus in
      match focus with Sidebar -> true | _ -> false
    in
    sidebar ~dimensions:left_dimensions manga ~is_focused
  in
  let%sub { component =
              { view = chapter_table_view
              ; images = _
              ; handler = chapter_table_handler
              }
          ; is_focuseable = is_table_focuseable
          }
    =
    let%sub is_focused =
      let%arr focus = focus in
      match focus with Chapter_table -> true | _ -> false
    in
    let%sub grab_focus =
      let%arr set_focus = set_focus in
      set_focus Chapter_table
    in
    chapter_table
      ~dimensions:right_dimensions
      manga
      ~is_focused
      ~grab_focus
      ~set_page
  in
  let%sub () =
    let%sub callback =
      let%arr set_focus = set_focus in
      function false -> set_focus Sidebar | true -> Effect.Ignore
    in
    Bonsai.Edge.on_change ~equal:[%equal: bool] is_table_focuseable ~callback
  in
  let%sub handler =
    let%sub search_box_string = Bonsai.yoink search_box_string in
    let%arr focus = focus
    and set_focus = set_focus
    and sidebar_handler = sidebar_handler
    and chapter_table_handler = chapter_table_handler
    and is_table_focuseable = is_table_focuseable
    and go_back = go_back
    and search_box_handler = search_box_handler
    and search_box_string = search_box_string
    and set_page = set_page in
    fun (event : Event.t) ->
      let set_focus x =
        match x with
        | Chapter_table when not is_table_focuseable -> Effect.Ignore
        | x -> set_focus x
      in
      match event, focus with
      | `Key (`Backspace, []), (Sidebar | Chapter_table) -> go_back
      | `Key (`Tab, []), Sidebar -> set_focus Chapter_table
      | `Key (`Tab, []), Chapter_table -> set_focus Sidebar
      | `Key (`Escape, []), Search_bar -> set_focus Chapter_table
      | ( `Key (`ASCII '/', [] | `ASCII ('k' | 'K'), [ `Ctrl ])
        , (Chapter_table | Sidebar) ) ->
        set_focus Search_bar
      | `Key ((`Arrow `Left | `ASCII 'h'), []), Chapter_table ->
        set_focus Sidebar
      | `Key ((`Arrow `Right | `ASCII 'l'), []), Sidebar ->
        set_focus Chapter_table
      | event, Sidebar -> sidebar_handler event
      | event, Chapter_table -> chapter_table_handler event
      | `Key (`Enter, []), Search_bar ->
        (match%bind.Effect search_box_string with
         | Inactive | Active "" -> Effect.Ignore
         | Active title when String.for_all title ~f:Char.is_whitespace ->
           Effect.Ignore
         | Active title ->
           set_page ~replace:false (Page.Manga_search { title = Some title }))
      | event, Search_bar -> search_box_handler event
  in
  let%sub view =
    let%arr sidebar_view = sidebar_view
    and chapter_table_view = chapter_table_view in
    Node.hcat [ sidebar_view; chapter_table_view ]
  in
  let%sub view =
    let%arr view = view
    and top_bar = top_bar in
    Node.pad
      ~l:2
      ~t:1
      ~r:2
      (Node.vcat [ top_bar; Node.text ""; view; Node.text "" ])
  in
  let%arr view = view
  and handler = handler
  and images = images in
  { Component.view; images; handler }
;;
