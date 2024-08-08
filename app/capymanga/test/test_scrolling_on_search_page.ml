open! Core
open! Bonsai
open Bonsai_test

let%expect_test "jk" =
  let handle =
    Test_util.create_handle
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
  Capytui_test.send_event handle (`Key (`ASCII 'j', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
    │    One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
    │    After rigorously training for three years, the ordinary...                                                          │
    │                                                                                                                        │
    │  │ DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
    │  │ Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
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
  Capytui_test.send_event handle (`Key (`ASCII 'j', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
    │    One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
    │    After rigorously training for three years, the ordinary...                                                          │
    │                                                                                                                        │
    │    DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
    │    Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
    │                                                                                                                        │
    │  │ One-Punch Man - Wash Yourself Before Entering The Bath (Doujinshi)  DOUJINSHI   ONESHOT   COMEDY   SUPERHERO        │
    │  │ After winning a public bath voucher, Saitama wanted to...                                                           │
    │                                                                                                                        │
    │    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
    │    Follows the life of an average part-time hero who...                                                                │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'k', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
    │    One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
    │    After rigorously training for three years, the ordinary...                                                          │
    │                                                                                                                        │
    │  │ DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
    │  │ Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
    │                                                                                                                        │
    │    One-Punch Man - Wash Yourself Before Entering The Bath (Doujinshi)  DOUJINSHI   ONESHOT   COMEDY   SUPERHERO        │
    │    After winning a public bath voucher, Saitama wanted to...                                                           │
    │                                                                                                                        │
    │    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
    │    Follows the life of an average part-time hero who...                                                                │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "du" =
  let handle =
    Test_util.create_handle
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
  Capytui_test.send_event handle (`Key (`ASCII 'd', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
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
    │  │ One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   COMEDY   BOYS' LOVE   │
    │  │ Saitama x Genos doujin.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'd', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
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
    │  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   BOYS' LOVE   SUPERHERO                    │
    │  │ Saitama x Genos douijn.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'u', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
    │  │ One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
    │  │ Follows the life of an average part-time hero who...                                                                │
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
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "G" =
  let handle =
    Test_util.create_handle
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
  Capytui_test.send_event handle (`Key (`ASCII 'G', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
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
    │  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   BOYS' LOVE   SUPERHERO                    │
    │  │ Saitama x Genos douijn.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;

let%expect_test "gg" =
  let handle =
    Test_util.create_handle
      ~initial_dimensions:{ height = 15; width = 120 }
      ()
  in
  Handle.store_view handle;
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'G', []));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([manga_search] (title ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
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
    │  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   BOYS' LOVE   SUPERHERO                    │
    │  │ Saitama x Genos douijn.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
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
    |}]
;;

let%expect_test "gg - but waited too long" =
  let handle =
    Test_util.create_handle
      ~initial_dimensions:{ height = 15; width = 120 }
      ()
  in
  Handle.store_view handle;
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'G', []));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Handle.store_view handle;
  Handle.recompute_view handle;
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.5);
  Handle.show handle;
  [%expect
    {|
    ([manga_search] (title ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                                                                                   │
    │                                                                                                                        │
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
    │  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   ROMANCE   ONESHOT   BOYS' LOVE   SUPERHERO                    │
    │  │ Saitama x Genos douijn.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([manga_cover] (cover_id 98d904d9-9e92-4cd6-af77-8630acd71270))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    / Search  j Down  k Up                       ............................................................│
    │                                                            ............................................................│
    │                                                            ............................................................│
    │    One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujin...............((url https://mangadex.org/cov...............│
    │    Saitama x Genos doujin.                                 ...............ers/9147871d-eb19-4acf-8530-23...............│
    │                                                            ...............3b88e4fe91/0380962e-26f8-4233-...............│
    │    One-Punch Man - The Fight of Gods (Doujinshi)  DOUJINSHI...............8c24-d36b2ebceb3e.jpg)(row 1)(...............│
    │    A fanmade comic by Cminglap, depicting Saitama vs a...  ...............column 60)(dimensions((height ...............│
    │                                                            ...............13)(width 60)))(scale true)).................│
    │    One-Punch Man - Saitama in the One Piece Universe (Douji............................................................│
    │                                                            ............................................................│
    │                                                            ............................................................│
    │  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   RO............................................................│
    │  │ Saitama x Genos douijn.                                                                                             │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.5);
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Handle.show_diff handle;
  [%expect {| |}];
  (* Doing gg quickly works! *)
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 0.1);
  Handle.recompute_view handle;
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'g', []));
  Handle.show_diff handle;
  [%expect
    {|
      ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
      │                                                                                                                        │
    -|│  Capymanga    / Search  j Down  k Up                       ............................................................│
    -|│                                                            ............................................................│
    -|│                                                            ............................................................│
    -|│    One-Punch Man - Hatachi ni Naru Made Machinasai! (Doujin...............((url https://mangadex.org/cov...............│
    -|│    Saitama x Genos doujin.                                 ...............ers/9147871d-eb19-4acf-8530-23...............│
    -|│                                                            ...............3b88e4fe91/0380962e-26f8-4233-...............│
    -|│    One-Punch Man - The Fight of Gods (Doujinshi)  DOUJINSHI...............8c24-d36b2ebceb3e.jpg)(row 1)(...............│
    -|│    A fanmade comic by Cminglap, depicting Saitama vs a...  ...............column 60)(dimensions((height ...............│
    -|│                                                            ...............13)(width 60)))(scale true)).................│
    +|│  Capymanga    / Search  j Down  k Up                                                                                   │
    +|│                                                                                                                        │
    +|│  │ One-Punch Man  AWARD WINNING   SCI-FI   GORE   MONSTERS   ACTION   COMEDY   +7 tags                                 │
    +|│  │ After rigorously training for three years, the ordinary...                                                          │
    +|│                                                                                                                        │
    +|│    DB X Saitama (Doujinshi)  DOUJINSHI   ACTION   COMEDY   SUPERHERO   MARTIAL ARTS   ADVENTURE   +2 tags              │
    +|│    Fan-drawn crossover of DBZ and OPM.       **Links:**  ...                                                           │
    +|│                                                                                                                        │
    -|│    One-Punch Man - Saitama in the One Piece Universe (Douji............................................................│
    -|│                                                            ............................................................│
    -|│                                                            ............................................................│
    -|│  │ One-Punch Man - Shikin Kyori (Doujinshi)  DOUJINSHI   RO............................................................│
    -|│  │ Saitama x Genos douijn.                                                                                             │
    +|│    One-Punch Man - Wash Yourself Before Entering The Bath (Doujinshi)  DOUJINSHI   ONESHOT   COMEDY   SUPERHERO        │
    +|│    After winning a public bath voucher, Saitama wanted to...                                                           │
    +|│                                                                                                                        │
    +|│    One Punch Man (Webcomic/Original)  AWARD WINNING   SCI-FI   SLICE OF LIFE   MONSTERS   ACTION   COMEDY   +4 tags    │
    +|│    Follows the life of an average part-time hero who...                                                                │
    +|│                                                                                                                        │
      └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
