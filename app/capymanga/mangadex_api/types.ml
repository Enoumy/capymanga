open! Core
open Ppx_yojson_conv_lib.Yojson_conv.Primitives

module Type = struct
  type t =
    | Author [@name "author"]
    | Artist [@name "artist"]
    | Cover_art [@name "cover_art"]
    | Manga [@name "manga"]
    | Tag [@name "tag"]
    | Creator [@name "creator"]
  [@@deriving sexp, yojson]
end

module Manga_id = struct
  type t = string [@@deriving sexp, yojson]
end

module I18n_string = struct
  type single_language =
    { language : string
    ; string : string
    }
  [@@deriving sexp]

  type t = single_language list [@@deriving sexp]

  let t_of_yojson (json : Yojson.Safe.t) =
    match json with
    | `Assoc languages ->
      List.map languages ~f:(fun (language, data) ->
        match data with
        | `String string -> { language; string }
        | error_json ->
          raise_s
            [%message
              "Failed while parsing internationalized string value!"
                (Yojson.Safe.to_string error_json : string)])
    | _ ->
      raise_s
        [%message
          "Failed while parsing internationalized string!"
            (Yojson.Safe.to_string json : string)]
  ;;

  let yojson_of_single_t { language; string } = language, `String string

  let yojson_of_t languages =
    `Assoc (List.map languages ~f:yojson_of_single_t)
  ;;
end

module Links = struct
  type link =
    { provider : string
    ; link : string
    }
  [@@deriving sexp]

  type t = link list [@@deriving sexp]

  let t_of_yojson (json : Yojson.Safe.t) =
    match json with
    | `Assoc l ->
      List.map l ~f:(fun (provider, value) ->
        match value with
        | `String link -> { provider; link }
        | error_json ->
          raise_s
            [%message
              "Failed while parsing a link! expected a string"
                (Yojson.Safe.to_string error_json : string)])
    | _ ->
      raise_s
        [%message
          "Failed while parsing a link!"
            (Yojson.Safe.to_string json : string)]
  ;;

  let yojson_of_t links =
    `Assoc
      (List.map links ~f:(fun { provider; link } -> provider, `String link))
  ;;
end

module Tag_id = struct
  type t = string [@@deriving sexp, yojson]
end

module Tag = struct
  module Attributes = struct
    type t =
      { name : I18n_string.t
      ; group : string
      ; version : int
      }
    [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
  end

  type t =
    { id : Tag_id.t
    ; attributes : Attributes.t
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end

module Chapter_id = struct
  type t = string [@@deriving sexp, yojson]
end

module Manga = struct
  module Attributes = struct
    type t =
      { title : I18n_string.t
      ; alt_titles : I18n_string.t list [@key "altTitles"]
      ; description : I18n_string.t
      ; is_locked : bool [@key "isLocked"]
      ; links : Links.t
      ; original_language : string [@key "originalLanguage"]
      ; last_volume : string [@key "lastVolume"]
      ; last_chapter : string [@key "lastChapter"]
      ; publication_demographic : string option
           [@key "publicationDemographic"]
      ; status : string
      ; year : int option
      ; content_rating : string [@key "contentRating"]
      ; tags : Tag.t list
      ; state : string
      ; chapter_numbers_reset_on_new_volume : bool
           [@key "chapterNumbersResetOnNewVolume"]
      ; created_at : string [@key "createdAt"]
      ; updated_at : string [@key "updatedAt"]
      ; version : int
      ; available_translated_languages : string list
           [@key "availableTranslatedLanguages"]
      ; latest_uploaded_chapter : Chapter_id.t [@key "latestUploadedChapter"]
      }
    [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
  end

  module Relationship = struct
    type t =
      { id : string
      ; type_ : string [@key "type"]
      }
    [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
  end

  type t =
    { id : Manga_id.t
    ; attributes : Attributes.t
    ; relationships : Relationship.t list
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end

module Collection = struct
  type 'a t =
    { data : 'a list
    ; limit : int
    ; offset : int
    ; total : int
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end
