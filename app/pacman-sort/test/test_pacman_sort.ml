open! Core

let zziplib_test_case =
  {|Name            : zziplib
Version         : 0.13.78-1
Description     : A lightweight library that offers the ability to easily extract data from files archived in a single zip file
Architecture    : x86_64
URL             : https://github.com/gdraheim/zziplib
Licenses        : LGPL  MPL
Groups          : None
Provides        : None
Depends On      : zlib
Optional Deps   : None
Required By     : None
Optional For    : None
Conflicts With  : None
Replaces        : None
Installed Size  : 333.58 KiB
Packager        : Sven-Hendrik Haase <svenstaro@archlinux.org>
Build Date      : Sat Aug 10 03:28:44 2024
Install Date    : Sun Aug 18 15:23:07 2024
Install Reason  : Installed as a dependency for another package
Install Script  : No
Validated By    : Signature
  |}
;;

let test s =
  let s = String.rstrip s in
  let parsed =
    Angstrom.parse_string ~consume:All Pacman_sort.Package.parser s
    |> Result.map_error ~f:Error.of_string
    |> Or_error.ok_exn
  in
  print_s [%sexp (parsed : Pacman_sort.Package.t)]
;;

let%expect_test _ =
  test zziplib_test_case;
  [%expect
    {|
    ((name zziplib) (version 0.13.78-1)
     (description
      "A lightweight library that offers the ability to easily extract data from files archived in a single zip file")
     (architecture x86_64) (url https://github.com/gdraheim/zziplib)
     (licenses (LGPL MPL)) (groups ()) (provides ()) (depends_on (zlib))
     (optional_deps ()) (required_by ()) (optional_for ()) (conflicts_with ())
     (replaces ()) (installed_size 333.5791K)
     (packager "Sven-Hendrik Haase <svenstaro@archlinux.org>")
     (build_date "Sat Aug 10 03:28:44 2024")
     (install_date "Sun Aug 18 15:23:07 2024")
     (install_reason "Installed as a dependency for another package")
     (install_script No) (validated_by Signature))
    |}]
;;
