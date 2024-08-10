open! Core

module Type : sig
  type t =
    | Author
    | Artist
    | Cover_art
    | Manga
    | Tag
    | Creator
  [@@deriving sexp, yojson]
end

module Manga_id : sig
  type t [@@deriving sexp, yojson, equal, compare]

  val to_string : t -> string
  val of_string : string -> t

  include Comparable.S with type t := t
end

module I18n_string : sig
  type single_language =
    { language : string
    ; string : string
    }
  [@@deriving sexp]

  type t = single_language list [@@deriving sexp, yojson]
end

module Links : sig
  type link =
    { provider : string
    ; link : string
    }
  [@@deriving sexp]

  type t = link list [@@deriving sexp, yojson]
end

module Tag_id : sig
  type t
end

module Tag : sig
  module Attributes : sig
    type t =
      { name : I18n_string.t
      ; group : string
      ; version : int
      }
    [@@deriving sexp, yojson]
  end

  type t =
    { id : Tag_id.t
    ; attributes : Attributes.t
    }
  [@@deriving sexp, yojson]
end

module Chapter_id : sig
  type t [@@deriving sexp, yojson]
end

module Relationship : sig
  type t =
    { id : string
    ; type_ : string
    }
  [@@deriving sexp, yojson]
end

module Manga : sig
  module Attributes : sig
    type t =
      { title : I18n_string.t
      ; alt_titles : I18n_string.t list
      ; description : I18n_string.t
      ; is_locked : bool
      ; links : Links.t option
      ; original_language : string
      ; last_volume : string option
      ; last_chapter : string option
      ; publication_demographic : string option
      ; status : string
      ; year : int option
      ; content_rating : string
      ; tags : Tag.t list
      ; state : string
      ; chapter_numbers_reset_on_new_volume : bool
      ; created_at : string
      ; updated_at : string
      ; version : int
      ; available_translated_languages : string option list
      ; latest_uploaded_chapter : Chapter_id.t option
      }
    [@@deriving sexp, yojson]
  end

  type t =
    { id : Manga_id.t
    ; attributes : Attributes.t
    ; relationships : Relationship.t list
    }
  [@@deriving sexp, yojson]
end

module Cover : sig
  module Attributes : sig
    type t = { filename : string } [@@deriving sexp, yojson]
  end

  type t =
    { id : string
    ; attributes : Attributes.t
    }
  [@@deriving sexp, yojson]
end

module Author : sig
  module Attributes : sig
    type t = { name : string } [@@deriving sexp, yojson]
  end

  type t =
    { id : string
    ; attributes : Attributes.t
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end

module Chapter : sig
  module Attributes : sig
    type t =
      { volume : string option
      ; chapter : string option
      ; title : string option
      ; translated_language : string option
      ; pages : int option
      ; version : int option
      }
    [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
  end

  type t =
    { id : string
    ; attributes : Attributes.t
    ; relationships : Relationship.t list
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end

module Collection : sig
  type 'a t =
    { data : 'a list
    ; limit : int
    ; offset : int
    ; total : int
    }
  [@@deriving sexp, yojson]
end

module Chapter_images : sig
  module Chapter : sig
    type t =
      { hash : string
      ; data : string list
      ; data_saver : string list
      }
    [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
  end

  type t =
    { base_url : string
    ; chapter : Chapter.t
    }
  [@@deriving sexp, yojson] [@@yojson.allow_extra_fields]
end

module Entity : sig
  type 'a t = { data : 'a } [@@deriving sexp, yojson]
end
