open! Core
open Async
open Deferred.Or_error.Let_syntax
module Package = Package

let parse_pacman_qi _ = []

let command =
  Command.async_or_error
    ~summary:{|Sorts installed pacman packages by installed size|}
  @@
  let%map_open.Command () = return () in
  fun () ->
    let%bind output = Process.run ~prog:"pacman" ~args:[ "-Qi" ] () in
    print_endline output;
    let packages =
      Re.split (Re.compile (Re.str "\n\n")) output
      |> List.map ~f:(fun package ->
        match
          Angstrom.parse_string ~consume:All Package.parser package
          |> Result.map_error ~f:Error.of_string
        with
        | Ok x -> x
        | Error error ->
          raise_s
            [%message
              "Error while parsing package"
                (error : Error.t)
                (package : string)])
    in
    print_s [%sexp (packages : Package.t list)];
    return ()
;;

module For_testing = struct
  let parse_pacman_qi = parse_pacman_qi
end
