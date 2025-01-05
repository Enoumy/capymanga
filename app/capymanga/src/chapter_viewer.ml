open! Core
open Capytui
open Bonsai
open Bonsai.Let_syntax
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let chapter_images ~(chapter_id : string Bonsai.t) (local_ graph) =
  let images, set_images = Bonsai.state_opt graph in
  let%sub () =
    match%sub images with
    | None ->
      Loading_state.i_am_loading graph;
      Bonsai.return ()
    | Some _ -> Bonsai.return ()
  in
  let on_activate =
    let get = Outside_world.Chapter_images.component graph in
    let%arr get and set_images and chapter_id in
    let%bind.Effect response = get ~chapter_id in
    set_images (Some response)
  in
  let () = Bonsai.Edge.lifecycle ~on_activate graph in
  images
;;

(* TODO: Consider making this a flag. *)
type image_quality =
  | High
  | Data_saver
[@@deriving sexp]

type input =
  { go_back : unit Effect.t
  ; images : string Array.t
  }

type action =
  | Next
  | Previous

type progress =
  { current_index : int
  ; total : int
  }

let render_progress ~flavor progress =
  let bg = Attr.background_color (Catpuccin.color ~flavor Surface0) in
  Node.hcat
    [ Node.text ~attrs:[ bg ] " "
    ; Node.text
        ~attrs:
          [ Attr.bold
          ; Attr.foreground_color (Catpuccin.color ~flavor Green)
          ; bg
          ]
        (Int.to_string (progress.current_index + 1))
    ; Node.text ~attrs:[ bg ] "/"
    ; Node.text ~attrs:[ Attr.bold; bg ] (Int.to_string progress.total)
    ; Node.text ~attrs:[ bg ] " "
    ]
;;

let image_viewer
  ~(dimensions : Dimensions.t Bonsai.t)
  ~(chapter_images : Chapter_images.t Bonsai.t)
  ~(quality : image_quality Bonsai.t)
  ~(go_back : unit Effect.t Bonsai.t)
  ~(is_full_screen : bool Bonsai.t)
  (local_ graph)
  =
  let images =
    let%arr chapter_images and quality in
    match quality with
    | High -> Array.of_list chapter_images.chapter.data
    | Data_saver -> Array.of_list chapter_images.chapter.data_saver
  in
  let current_image_index, inject =
    let input =
      let%arr images and go_back in
      { images; go_back }
    in
    Bonsai.state_machine1
      ~default_model:0
      ~apply_action:(fun context input model action ->
        match input with
        | Inactive -> model
        | Active { images; go_back } ->
          (match action with
           | Previous -> Int.max 0 (model - 1)
           | Next when model >= Array.length images - 1 ->
             Apply_action_context.schedule_event context go_back;
             model
           | Next -> Int.min (Array.length images - 1) (model + 1)))
      input
      graph
  in
  let current_image =
    let%arr current_image_index and images in
    images.(current_image_index % Array.length images)
  in
  let%sub base_url, hash =
    let%arr chapter_images in
    chapter_images.base_url, chapter_images.chapter.hash
  in
  let url =
    let%arr quality and current_image and hash and base_url in
    let quality =
      match quality with High -> "data" | Data_saver -> "data-saver"
    in
    [%string "%{base_url}/%{quality}/%{hash}/%{current_image}"]
  in
  let image =
    let%arr dimensions
    and url
    and is_fullscreen = is_full_screen in
    (* NOTE: We subtract 2 from the height and the width so that tmux works
       properly. There seems to be some misunderstanding between kitty and
       tmux on where the screen starts and ends leading to funny visual
       artifacts. *)
    let dimensions =
      { Dimensions.height = dimensions.height - 2
      ; width = dimensions.width - 2
      }
    in
    { Image.url
    ; row = (if is_fullscreen then 1 else 3)
    ; column = 1
    ; dimensions
    ; scale = true
    }
  in
  let%sub handler =
    let%arr inject in
    fun (event : Event.t) ->
      match event with
      | `Key ((`ASCII ('l' | ' ') | `Arrow `Right | `Enter), [])
      | `Mouse (`Press `Left, _, _) ->
        inject Next
      | `Key ((`ASCII 'h' | `Arrow `Left), []) -> inject Previous
      | _ -> Effect.Ignore
  in
  let%sub progress =
    let%arr current_image_index and images in
    { current_index = current_image_index; total = Array.length images }
  in
  let%arr image and handler and progress in
  { Component.view = Node.none; images = [ image ]; handler }, Some progress
;;

let component ~dimensions ~chapter ~go_back (local_ graph) =
  let flavor = Catpuccin.flavor graph in
  let text = Text.component graph in
  let chapter_id =
    let%arr chapter in
    chapter.Chapter.id
  in
  let is_full_screen, toggle_fullscreen =
    Bonsai.state_machine0
      ~default_model:false
      ~apply_action:(fun _ current () -> not current)
      graph
  in
  Bonsai.scope_model
    (module String)
    ~on:chapter_id
    ~for_:(fun (local_ graph) ->
      let dimensions =
        let%arr dimensions and is_full_screen in
        if is_full_screen
        then dimensions
        else
          { Dimensions.height = dimensions.Dimensions.height - 3
          ; width = dimensions.width - 2
          }
      in
      let chapter_images = chapter_images ~chapter_id graph in
      let top_bar =
        Top_bar.component
          ~instructions:
            (Bonsai.return [ "Backspace", "go back"; "f", "go fullscreen" ])
          graph
      in
      let%sub { view; images; handler }, progress =
        match%sub chapter_images with
        | None ->
          let view =
            Spinner.component
              ~kind:Dot
              (Bonsai.return "Loading chapters...")
              graph
          in
          let view =
            let%arr view and dimensions in
            Node.center ~within:dimensions view
          in
          let%arr view in
          ( { Component.view
            ; images = []
            ; handler = (fun (_ : Event.t) -> Effect.Ignore)
            }
          , None )
        | Some (Error error) ->
          let view =
            let%arr text and error and flavor in
            let string = Sexp.to_string_hum [%sexp (error : Error.t)] in
            Node.vcat
            @@ (String.split string ~on:'\n'
                |> List.map ~f:(fun line ->
                  text
                    ~attrs:
                      [ Attr.foreground_color (Catpuccin.color ~flavor Red) ]
                    (Util.normalize_string_lossy line)))
          in
          let%sub { view; inject = _; less_keybindings_handler } =
            Capytui_scroller.component ~dimensions view graph
          in
          let%arr view and less_keybindings_handler in
          ( { Component.view
            ; handler = less_keybindings_handler
            ; images = []
            }
          , None )
        | Some
            (Ok { chapter = { data = []; _ } | { data_saver = []; _ }; _ })
          ->
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
          ( { Component.view
            ; images = []
            ; handler = (fun _ -> Effect.Ignore)
            }
          , None )
        | Some (Ok chapter_images) ->
          image_viewer
            ~dimensions
            ~is_full_screen
            ~chapter_images
            ~quality:(Bonsai.return Data_saver)
            ~go_back
            graph
      in
      let handler =
        let%arr handler and go_back and toggle_fullscreen in
        fun (event : Event.t) ->
          match event with
          | `Key (`Backspace, []) -> go_back
          | `Key (`ASCII ('f' | 'F'), []) -> toggle_fullscreen ()
          | event -> handler event
      in
      let top_bar =
        let%arr progress
        and top_bar
        and flavor
        and text
        and is_full_screen in
        match progress, is_full_screen with
        | None, _ -> top_bar
        | Some progress, true -> render_progress ~flavor progress
        | Some progress, false ->
          Node.hcat [ top_bar; text " "; render_progress ~flavor progress ]
      in
      let view =
        let%arr view and top_bar in
        Node.pad ~l:2 ~t:1 @@ Node.vcat [ top_bar; Node.text ""; view ]
      in
      let%arr view and images and handler in
      { Component.view; images; handler })
    graph
;;
