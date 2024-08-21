(lang dune 3.9)

(name capy)

(generate_opam_files true)

(source
 (github enoumy/capy))

(authors "Enoumy")

(maintainers "Enoumy")

(license MIT)

(documentation https://github.com/Enoumy/capy)

(package
 (name capy)
 (synopsis "Terminal UIs in OCaml")
 (description "Terminal UIs in OCaml")
 (allow_empty)
 (depends
  ocaml
  dune
  (yojson
   (= "2.2.2"))
  (ppx_yojson_conv
   (= "v0.17.0"))
  (bonsai
   (= "v0.17.0")))
 (tags
  (ocaml ui tui "terminal ui" manga notty bonsai)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
