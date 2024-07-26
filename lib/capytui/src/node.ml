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

let dimensions t =
  let width = Notty.I.width t
  and height = Notty.I.height t in
  { Dimensions.width; height }
;;

let center t ~within:{ Dimensions.width; height } =
  let%tydi { width = w; height = h } = dimensions t in
  let right = (width - w) / 2 in
  let top = (height - h) / 2 in
  Notty.I.pad ~r:right ~l:right ~t:top ~b:top t
;;
