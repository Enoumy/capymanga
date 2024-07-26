open! Core

type t = Notty.I.t

let text ?(attrs = []) string = Notty.I.string (Attr.many attrs) string
let vcat = Notty.I.vcat
let hcat = Notty.I.hcat

let sexp_for_debugging ?attrs sexp =
  vcat
    (List.map
       ~f:(fun s -> text ?attrs s)
       (String.split_lines (Sexp.to_string_hum sexp)))
;;
