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
  notty
  (yojson
   (= "2.2.2"))
  ppx_yojson_conv
  bonsai
  bonsai_test
  async_ssl
  async
  expectable
  core_unix
  core
  expect_test_helpers_core
  ;;
  )
 (tags
  (ocaml ui tui "terminal ui" manga notty bonsai)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
