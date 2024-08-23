open! Core
open! Bonsai
open Bonsai_test

let%expect_test "Initial load" =
  let handle = Test_util.create_handle () in
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex     / Search  j Down  k Up                                                              │
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
  Handle.show handle;
  [%expect
    {|
    ([manga_search] (title ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex  ⣾  / Search  j Down  k Up                                                              │
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
    │    One-Punch Man - My Student Won't Go Back Home (Doujinshi)  DOUJINSHI   ROMANCE   SLICE OF LIFE   ONESHOT   GENDERSWA│
    │    One Punch Man AU, where everything is the same except...                                                            │
    │                                                                                                                        │
    │    One-Punch Man - Because I'm a Monster (Doujinshi)  DOUJINSHI   THRILLER   MONSTERS   ACTION   SUPERHERO   MARTIAL AR│
    │    Fan redraw of chapter 90 of One Punch Man.                                                                          │
    │                                                                                                                        │
    │    One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   COMEDY   BOYS' LOVE   │
    │    Saitama x Genos doujin.                                                                                             │
    │                                                                                                                        │
    │    One-Punch Man - The Fight of Gods (Doujinshi)  DOUJINSHI   SCI-FI   MONSTERS   ACTION   SUPERHERO   MARTIAL ARTS   +│
    │    A fanmade comic by Cminglap, depicting Saitama vs a...                                                              │
    │                                                                                                                        │
    │    One-Punch Man - Saitama in the One Piece Universe (Doujinshi)  DOUJINSHI   MONSTERS   ACTION   LONG STRIP   COMEDY  │
    │                                                                                                                        │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "About page" =
  let handle = Test_util.create_handle () in
  Handle.recompute_view handle;
  Handle.store_view handle;
  Capytui_test.send_event handle (`Key (`ASCII '?', []));
  Handle.show handle;
  [%expect
    {|
    ([manga_search] (title ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
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
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                  Capymanga 2024                                                        │
    │                                                  powered by MangaDex                                                   │
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
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`Escape, []));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex     / Search  j Down  k Up                                                              │
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
    │    One-Punch Man - My Student Won't Go Back Home (Doujinshi)  DOUJINSHI   ROMANCE   SLICE OF LIFE   ONESHOT   GENDERSWA│
    │    One Punch Man AU, where everything is the same except...                                                            │
    │                                                                                                                        │
    │    One-Punch Man - Because I'm a Monster (Doujinshi)  DOUJINSHI   THRILLER   MONSTERS   ACTION   SUPERHERO   MARTIAL AR│
    │    Fan redraw of chapter 90 of One Punch Man.                                                                          │
    │                                                                                                                        │
    │    One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   COMEDY   BOYS' LOVE   │
    │    Saitama x Genos doujin.                                                                                             │
    │                                                                                                                        │
    │    One-Punch Man - The Fight of Gods (Doujinshi)  DOUJINSHI   SCI-FI   MONSTERS   ACTION   SUPERHERO   MARTIAL ARTS   +│
    │    A fanmade comic by Cminglap, depicting Saitama vs a...                                                              │
    │                                                                                                                        │
    │    One-Punch Man - Saitama in the One Piece Universe (Doujinshi)  DOUJINSHI   MONSTERS   ACTION   LONG STRIP   COMEDY  │
    │                                                                                                                        │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 1.0);
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  [%expect
    {| ([manga_cover] (cover_id c1037a0c-aa5e-4cd9-bd33-6514a2eb332b)) |}];
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex     / Search  j Down  k Up  ............................................................│
    │                                                            ............................................................│
    │  │ One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS ............................................................│
    │  │ After rigorously training for three years, the ordinary.............................................................│
    │                                                            ............................................................│
    │    DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   ............................................................│
    │    Fan-drawn crossover of DBZ and OPM.       **Links:**  ..............................................................│
    │                                                            ............................................................│
    │    One-Punch Man - Wash Yourself Before Entering The Bath (............................................................│
    │    After winning a public bath voucher, Saitama wanted to..............................................................│
    │                                                            ............................................................│
    │    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-F...............((url https://mangadex.org/cov...............│
    │    Follows the life of an average part-time hero who...    ...............ers/d8a959f7-648e-4c8d-8f23-f1...............│
    │                                                            ...............f3f8e129f3/0380962e-26f8-4233-...............│
    │    One-Punch Man - My Student Won't Go Back Home (Doujinshi...............8c24-d36b2ebceb3e.jpg)(row 1)(...............│
    │    One Punch Man AU, where everything is the same except..................column 60)(dimensions((height ...............│
    │                                                            ...............28)(width 60)))(scale true)).................│
    │    One-Punch Man - Because I'm a Monster (Doujinshi)  DOUJI............................................................│
    │    Fan redraw of chapter 90 of One Punch Man.              ............................................................│
    │                                                            ............................................................│
    │    One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujin............................................................│
    │    Saitama x Genos doujin.                                 ............................................................│
    │                                                            ............................................................│
    │    One-Punch Man - The Fight of Gods (Doujinshi)  DOUJINSHI............................................................│
    │    A fanmade comic by Cminglap, depicting Saitama vs a...  ............................................................│
    │                                                            ............................................................│
    │    One-Punch Man - Saitama in the One Piece Universe (Douji............................................................│
    │                                                            ............................................................│
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
