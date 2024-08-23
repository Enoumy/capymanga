open! Core
open Mangadex_api.Types

let test_cases = [ Embedded_files.scanlation_group_dummy_response_dot_json ]

let%expect_test "parsing a scanlation group" =
  List.iter test_cases ~f:(fun test_case ->
    print_s
    @@ Entity.sexp_of_t Scanlation_group.sexp_of_t
    @@ Entity.t_of_yojson
         Scanlation_group.t_of_yojson
         (Yojson.Safe.from_string test_case));
  [%expect
    {|
    ((data
      ((id c6202414-0711-49f1-a63d-47b1169aff0a)
       (attributes
        ((name ("Hunlight Scans")) (website (https://hunlight.com))
         (description
          ("Hunlight-Scans    We are here to provide best quality chapters for our readers and to have a good time.  Join our disco rd for all annoucements and join de group~ We're always recruitin'.  (The website is live again!)")))))))
    |}]
;;
