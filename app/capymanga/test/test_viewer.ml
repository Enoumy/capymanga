open! Core
open! Bonsai
open Bonsai_test

let%expect_test "Manga viewer" =
  let handle = Test_util.create_handle () in
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
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`Enter, []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga    Backspace back                                                                                           │
    │                                                                                                                        │
    │              One-Punch Man                                                                                             │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │                                                                                                                        │
    │  (manga                                                                                                                │
    │   ((id d8a959f7-648e-4c8d-8f23-f1f3f8e1                                                                                │
    │    (attributes                                                                                                         │
    │     ((title (((language en) (string "On                      List of manga chapters goes here!                         │
    │      (alt_titles                                                                                                       │
    │       ((((language es) (string "El homb                                                                                │
    │        (((language en) (string "One Pun                                                                                │
    │        (((language en) (string "One-Pun                                                                                │
    │        (((language en) (string OPM))) (                                                                                │
    │        (((language ja-ro) (string Wanpa                                                                                │
    │        (((language ru)                                                                                                 │
    │          (string                                                                                                       │
    │           "\208\146\208\176\208\189\208                                                                                │
    │        (((language fa)                                                                                                 │
    │          (string                                                                                                       │
    │           "\217\133\216\177\216\175 \21                                                                                │
    │        (((language fa)                                                                                                 │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 1.0);
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([manga_cover] (cover_id c1037a0c-aa5e-4cd9-bd33-6514a2eb332b))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga ⣾  Backspace back                                                                                           │
    │                                                                                                                        │
    │              One-Punch Man                                                                                             │
    │  .........((url https://manga..........                                                                                │
    │  .........dex.org/covers/d8a9..........                                                                                │
    │  .........59f7-648e-4c8d-8f23..........                                                                                │
    │  .........-f1f3f8e129f3/03809..........                                                                                │
    │  .........62e-26f8-4233-8c24-..........                                                                                │
    │  .........d36b2ebceb3e.jpg)(r..........                                                                                │
    │  .........ow 4)(column 2)(dim..........                                                                                │
    │  .........ensions((height 9)(..........                                                                                │
    │  .........width 38)))(scale t..........                                                                                │
    │  (manga   rue))                                                                                                        │
    │   ((id d8a959f7-648e-4c8d-8f23-f1f3f8e1                                                                                │
    │    (attributes                                                                                                         │
    │     ((title (((language en) (string "On                      List of manga chapters goes here!                         │
    │      (alt_titles                                                                                                       │
    │       ((((language es) (string "El homb                                                                                │
    │        (((language en) (string "One Pun                                                                                │
    │        (((language en) (string "One-Pun                                                                                │
    │        (((language en) (string OPM))) (                                                                                │
    │        (((language ja-ro) (string Wanpa                                                                                │
    │        (((language ru)                                                                                                 │
    │          (string                                                                                                       │
    │           "\208\146\208\176\208\189\208                                                                                │
    │        (((language fa)                                                                                                 │
    │          (string                                                                                                       │
    │           "\217\133\216\177\216\175 \21                                                                                │
    │        (((language fa)                                                                                                 │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
