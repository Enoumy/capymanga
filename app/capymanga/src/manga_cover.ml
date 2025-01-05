open! Core
open Bonsai
open Capytui
open Bonsai.Let_syntax
open Mangadex_api.Types

type t = { url : string }

let cover_filename ~cover_id (local_ graph) =
  let state, set_state = Bonsai.state_opt graph in
  let%sub () =
    match%sub state with
    | None ->
      Loading_state.i_am_loading graph;
      Bonsai.return ()
    | Some _ -> Bonsai.return ()
  in
  let effect =
    let cover = Outside_world.Manga_cover.component graph in
    let%arr cover in
    fun cover_id -> cover ~cover_id
  in
  let effect = Bonsai.Effect_throttling.poll effect graph in
  let () =
    let callback =
      let%arr set_state and effect in
      fun cover_id ->
        let%bind.Effect () = set_state None in
        let%bind.Effect response = effect cover_id in
        match response with
        | Aborted -> Effect.Ignore
        | Finished response -> set_state (Some response)
    in
    Bonsai.Edge.on_change ~equal:[%equal: string] cover_id ~callback graph
  in
  state
;;

let component
  :  Mangadex_api.Types.Manga.t option Bonsai.t -> local_ Bonsai.graph
  -> t option Bonsai.t
  =
  fun manga (local_ graph) ->
  (* TODO: Add some caching here (there are duplicate queries on the manga
     search and the manga view pages.)... *)
  match%sub manga with
  | None -> Bonsai.return None
  | Some manga ->
    let cover_id =
      let%arr manga in
      List.find_map manga.relationships ~f:(fun { type_; id } ->
        match type_ with "cover_art" -> Some id | _ -> None)
    in
    (match%sub cover_id with
     | None -> Bonsai.return None
     | Some cover_id ->
       let manga_id =
         let%arr manga in
         manga.id
       in
       let bounced =
         Bonsai_extra.value_stability
           ~equal:[%equal: string * Manga_id.t]
           ~time_to_stable:(Bonsai.return (Time_ns.Span.of_sec 0.3))
           (Bonsai.both cover_id manga_id)
           graph
       in
       (match%sub bounced with
        | Unstable _ -> Bonsai.return None
        | Stable (cover_id, manga_id) ->
          let filename =
            (Bonsai.scope_model
               (module String)
               ~on:cover_id
               ~for_:(fun (local_ graph) -> cover_filename ~cover_id graph))
              graph
          in
          (match%sub filename with
           | Some (Ok { data = { attributes = { filename; _ }; _ } }) ->
             let%arr filename and manga_id in
             let url =
               [%string
                 "https://mangadex.org/covers/%{manga_id#Manga_id}/%{filename}"]
             in
             Some { url }
           | _ -> Bonsai.return None)))
;;
