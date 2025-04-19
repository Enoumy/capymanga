open! Core

type t =
  { name : string
  ; version : string
  ; description : string
  ; architecture : string
  ; url : string
  ; licenses : string list
  ; groups : string list
  ; provides : string list
  ; depends_on : string list
  ; optional_deps : string list
  ; required_by : string list
  ; optional_for : string list
  ; conflicts_with : string list
  ; replaces : string list
  ; installed_size : Byte_units.t
  ; packager : string
  ; build_date : string
  ; install_date : string
  ; install_reason : string
  ; install_script : string
  ; validated_by : string
  }
[@@deriving sexp_of]

val parser : t Angstrom.t
