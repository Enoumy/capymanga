open! Core

type t =
  { height : int
  ; width : int
  }
[@@deriving sexp, equal]

module Private = struct
  let variable =
    Bonsai.Dynamic_scope.create
      ~name:"terminal dimensions"
      ~fallback:{ height = 20; width = 20 }
      ()
  ;;
end
