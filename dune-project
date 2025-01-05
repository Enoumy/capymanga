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
  (ppx_yojson_conv
   (= "v0.18~preview.130.04+450"))
  (bonsai
   (= "v0.18~preview.130.04+450"))
  (bonsai_test
   (= "v0.18~preview.130.04+450"))
  (async_ssl
   (= "v0.18~preview.130.04+450"))
  cohttp-async
  (async
   (= "v0.18~preview.130.04+450"))
  (expectable
   (= "v0.18~preview.130.04+450"))
  (core_unix
   (= "v0.18~preview.130.04+450"))
  (core
   (= "v0.18~preview.130.04+450"))
  (expect_test_helpers_core
   (= "v0.18~preview.130.04+450"))
  ;;
  )
 (tags
  (ocaml ui tui "terminal ui" manga notty bonsai)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
