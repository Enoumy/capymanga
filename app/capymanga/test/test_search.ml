open! Core
open! Bonsai
open Bonsai_test
open Mangadex_api.Types

let%expect_test "Searching a new box" =
  let handle =
    Test_util.create_handle
      ~manga_search:
        (Value.return
         @@ fun ~title ->
         match title with
         | None -> Test_util.default_manga_search ~title
         | Some _title ->
           Ui_effect.return
             (Ok
                { Collection.data =
                    [ force Test_util.mock_chainsaw_man_response ]
                ; limit = 10
                ; total = 1
                ; offset = 1
                }))
      ~initial_dimensions:{ height = 15; width = 120 }
      ()
  in
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([manga_search] (title ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga ⣾  / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
    │  │ One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
    │  │ After rigorously training for three years, the ordinary...                                                          │
    │                                                                                                                        │
    │    DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
    │    Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
    │                                                                                                                        │
    │    One-Punch Man - Wash Yourself Before Entering The Bath (Doujinshi)  DOUJINSHI   ONESHOT   COMEDY   SUPERHERO        │
    │    After winning a public bath voucher, Saitama wanted to...                                                           │
    │                                                                                                                        │
    │    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
    │    Follows the life of an average part-time hero who...                                                                │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'K', [ `Ctrl ]));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Handle.show_diff handle;
  [%expect
    {|
      ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
      │                                                                                                                        │
    -|│  Capymanga ⣾  / Search  j Down  k Up                                                                                   │
    +|│  Capymanga      Search:                                                                                                │
      │                                                                                                                        │
      │  │ One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
      │  │ After rigorously training for three years, the ordinary...                                                          │
      │                                                                                                                        │
      │    DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
      │    Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
      │                                                                                                                        │
      │    One-Punch Man - Wash Yourself Before Entering The Bath (Doujinshi)  DOUJINSHI   ONESHOT   COMEDY   SUPERHERO        │
      │    After winning a public bath voucher, Saitama wanted to...                                                           │
      │                                                                                                                        │
      │    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
      │    Follows the life of an average part-time hero who...                                                                │
      │                                                                                                                        │
      └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
  |}];
  String.iter "Chainsaw Man" ~f:(fun c ->
    Capytui_test.send_event handle (`Key (`ASCII c, [])));
  Capytui_test.send_event handle (`Key (`Enter, []));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  [%expect {| ([manga_search] (title ("Chainsaw Man"))) |}];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up  Search:  Chainsaw Man                                                            │
    │                                                                                                                        │
    │  │ Chainsaw Man  AWARD WINNING   GORE   MONSTERS   ACTION   DEMONS   COMEDY   +2 tags                                  │
    │  │ Broke young man + chainsaw dog demon = Chainsaw Man!   ...                                                          │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
         |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 1.0);
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([manga_cover] (cover_id c862f594-aa07-4df2-a2c8-361640f7a3ff))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga ⣾  / Search  j Down  k Up  Search:  Chainsaw Man............................................................│
    │                                                            ............................................................│
    │  │ Chainsaw Man  AWARD WINNING   GORE   MONSTERS   ACTION  ............................................................│
    │  │ Broke young man + chainsaw dog demon = Chainsaw Man!   ................((url https://mangadex.org/cov...............│
    │                                                            ...............ers/a77742b1-befd-49a4-bff5-1a...............│
    │                                                            ...............d4e6b0ef7b/0380962e-26f8-4233-...............│
    │                                                            ...............8c24-d36b2ebceb3e.jpg)(row 1)(...............│
    │                                                            ...............column 60)(dimensions((height ...............│
    │                                                            ...............13)(width 60)))(scale true)).................│
    │                                                            ............................................................│
    │                                                            ............................................................│
    │                                                            ............................................................│
    │                                                            ............................................................│
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
