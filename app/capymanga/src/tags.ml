open! Core
open Capytui
open Mangadex_api.Types
module Catpuccin = Capytui_catpuccin

let render_tag : flavor:Catpuccin.Flavor.t -> Tag.t -> Node.t =
  fun ~flavor tag ->
  match tag.attributes.name with
  | [] -> Node.text " "
  | { string; _ } :: _ ->
    let color =
      match String.lowercase string with
      (* NOTE: These are the same colored tags as https://mangadex.org *)
      | "doujinshi" | "romance" -> Catpuccin.Mauve
      | "gore" -> Catpuccin.Red
      | x when String.is_substring x ~substring:"violence" -> Red
      | "suggestive" | "award winning" -> Catpuccin.Yellow
      | "slice of life" -> Flamingo
      | "sci-fi" -> Teal
      | _ -> Subtext0
    in
    Node.text
      ~attrs:
        [ Attr.background_color (Catpuccin.color ~flavor Surface0)
        ; Attr.foreground_color (Catpuccin.color ~flavor color)
        ; Attr.bold
        ]
      (" " ^ String.uppercase string ^ " ")
;;

let sort_of_tag_name name =
  (* NOTE: These are the same priorities/colored tags as mangadex. *)
  match String.lowercase name with
  | "award winning" -> -1
  | "doujinshi" -> 0
  | "gore" -> 1
  | "sci-fi" -> 1
  | "suggestive" | "romance" -> 2
  | "slice of life" -> 2
  | x when String.is_substring x ~substring:"violence" -> 1
  | _ -> 3
;;

let sort_tags : Tag.t list -> Tag.t list =
  fun tags ->
  List.sort
    ~compare:
      (Comparable.lift
         ~f:(fun (tag : Tag.t) ->
           let name =
             match tag.attributes.name with
             | [] -> ""
             | { string; _ } :: _ -> string
           in
           sort_of_tag_name name)
         Int.ascending)
    tags
;;
