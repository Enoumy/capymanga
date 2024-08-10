open! Core
open Mangadex_api.Types

let test_cases = [ Embedded_files.chapter_query_response_dot_json ]

let%expect_test "parsing a big search collection" =
  (* This test just showcases that we are able to parse the json of a
     request... *)
  List.iter test_cases ~f:(fun test_case ->
    Fn.ignore
      (Chapter_images.t_of_yojson (Yojson.Safe.from_string test_case)));
  [%expect {| |}]
;;
