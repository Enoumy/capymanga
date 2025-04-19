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
[@@deriving sexp_of, typed_fields]

module Parser_map =
  Typed_field_map.Make_for_records
    (Typed_field)
    (struct
      type 'a t = is_last:bool -> 'a Angstrom.t
    end)

module Option_map = Typed_field_map.Make_for_records (Typed_field) (Option)

let string_parser =
  Angstrom.take_while (function '\n' -> false | _ -> true)
;;

let ( => ) s ret =
  Angstrom.choice
    [ Angstrom.map (Angstrom.string s) ~f:(fun _ -> ret)
    ; Angstrom.fail "if you see this, then this is a bug..."
    ]
;;

let string_list_parser =
  let open Angstrom in
  let open Angstrom.Let_syntax in
  match%bind.Angstrom Angstrom.choice [ "None" => `None; return `List ] with
  | `None -> return []
  | `List ->
    let rec loop () =
      match%bind Angstrom.peek_char with
      | None -> return []
      | Some '\n' -> return []
      | Some c when Char.is_whitespace c -> Angstrom.any_char *> loop ()
      | Some _ ->
        let%bind curr = Angstrom.take_while1 (Fn.non Char.is_whitespace) in
        let%bind remaining = loop () in
        return (curr :: remaining)
    in
    loop ()
;;

let float =
  let open Angstrom.Let_syntax in
  let%bind natural = Angstrom.take_while1 Char.is_digit in
  match%bind Angstrom.peek_char with
  | None -> return (Float.of_string natural)
  | Some '.' ->
    let%bind (_ : string) = Angstrom.string "." in
    let%bind decimal = Angstrom.take_while1 Char.is_digit in
    return (Float.of_string [%string "%{natural}.%{decimal}"])
  | Some _ -> return (Float.of_string natural)
;;

let unit_multiplier =
  let open Angstrom in
  let open Angstrom.Let_syntax in
  let ( => ) s ret =
    let%bind curr = peek_string (String.length s) in
    choice
      [ Angstrom.string curr *> return ret
      ; Angstrom.fail "BUG in pacman sort."
      ]
  in
  choice
    [ "KiB" => 1024.0
    ; "MiB" => 1_048_576.0
    ; "B" => 1.0
    ; "GiB" => 1_073_741_824.0
    ; Angstrom.fail
        "Urecognized unit size prefix! - this is a bug in pacman sort!"
    ]
;;

let byte_units_parser =
  let open Angstrom.Let_syntax in
  let%bind float in
  let%bind (_ : string) = Angstrom.string " " in
  let%bind unit_multiplier in
  return (Byte_units.of_bytes_float_exn (float *. unit_multiplier))
;;

let parser : t Angstrom.t =
  let f : type a. a Typed_field.t -> a Angstrom.t = function
    | Name -> string_parser
    | Version -> string_parser
    | Description -> string_parser
    | Architecture -> string_parser
    | Url -> string_parser
    | Licenses -> string_list_parser
    | Groups -> string_list_parser
    | Provides -> string_list_parser
    | Depends_on -> string_list_parser
    | Optional_deps -> string_list_parser
    | Required_by -> string_list_parser
    | Optional_for -> string_list_parser
    | Conflicts_with -> string_list_parser
    | Replaces -> string_list_parser
    | Installed_size -> byte_units_parser
    | Packager -> string_parser
    | Build_date -> string_parser
    | Install_date -> string_parser
    | Install_reason -> string_parser
    | Install_script -> string_parser
    | Validated_by -> string_parser
  in
  let f : type a. a Typed_field.t -> is_last:bool -> a Angstrom.t =
    fun field ~is_last ->
    let open Angstrom in
    let open Angstrom.Let_syntax in
    let%bind () =
      let name =
        Typed_field.name field
        |> String.split ~on:'_'
        |> List.map ~f:String.capitalize
        |> String.concat ~sep:" "
      in
      let%bind (_ : string) =
        Angstrom.string_ci name
        <?> [%string "field name, expected: %%{name}"]
      in
      skip_while Char.is_whitespace
      *> Angstrom.string ": "
      *> Angstrom.return ()
    in
    let%bind ret =
      f field
      <* if not is_last then Angstrom.return "N/a" else Angstrom.string "\n"
    in
    return ret
  in
  let parsers = Parser_map.create { f } in
  let rec loop (all : Typed_field.Packed.t list) (acc : Option_map.t)
    : Option_map.t Angstrom.t
    =
    match all with
    | [] -> Angstrom.return acc
    | { Typed_field.Packed.f = T f } :: remaining ->
      let is_last = not (List.is_empty remaining) in
      let%bind.Angstrom current =
        Angstrom.( <?> )
          ((Parser_map.find parsers f) ~is_last)
          (Typed_field.name f)
      in
      let acc = Option_map.set acc ~key:f ~data:(Some current) in
      loop remaining acc
  in
  let empty_map =
    let f : type a. a Typed_field.t -> a option = function _ -> None in
    Option_map.create { f }
  in
  let%map.Angstrom parsed = loop Typed_field.Packed.all empty_map in
  let f : type a. a Typed_field.t -> a =
    fun f -> Option.value_exn (Option_map.find parsed f)
  in
  Typed_field.create { f }
;;
