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
    ([author] (author_id 16b98239-6452-4859-b6df-fdb1c7f12b52))
    (chapter_feed (manga_id d8a959f7-648e-4c8d-8f23-f1f3f8e129f3)
     (ascending true) (limit ()) (offset ()))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga ⣾  Backspace back                                                                                           │
    │                                                                                                                        │
    │              One-Punch Man               > Vol 7 Chapter 60.5                                                          │
    │                                            Vol 5 Chapter 42 No title                                                   │
    │                                            Vol 16 Chapter 100.17 Гость из NK                                           │
    │                                            Vol 16 Chapter 100.03 ③                                                     │
    │                                            Vol 2 Chapter 17 Psychic Power and I                                        │
    │                                            Vol 8 Chapter 62 Morphing                                                   │
    │                                            Vol 7 Chapter 60 Истинная личина                                            │
    │                                            Vol 11 Chapter 86 In Plain View                                             │
    │                                            Vol 2 Chapter 15 Completamente Desaparecido                                 │
    │                                            Vol 9 Chapter 74 No title                                                   │
    │  ──────────────────────────────────────    Vol 16 Chapter 100.07 Экстра Летние каникулы                                │
    │                                            Vol 16 Chapter 100.18 ⑭                                                     │
    │  Author:  ONE                              Vol 7 Chapter 55                                                            │
    │  Status:  ONGOING                          Vol 1 Chapter 4 Önmagadért                                                  │
    │                                            Vol 7 Chapter 58.5                                                          │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Chapter 74.5 Экстра Manga ONE                                         │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Chapter 31 Mature                                                     │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Chapter 33 No title                                                   │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Chapter 52.6 Экстра Большая уборка                                    │
    │   ADAPTATION                               Vol 7 Chapter 57                                                            │
    │                                            Vol 15 Chapter 99 No title                                                  │
    │  After rigorously training for three       Vol 10 Chapter 75 Walaupun Demikian                                         │
    │  years, the ordinary Saitama has gained    Vol 6 Chapter 52                                                            │
    │  immense strength which allows him to      Vol 6 Chapter 52.5 Экстра Омакэ                                             │
    │  take out anyone and anything with just    Vol 14 Chapter 97 Dimple Is                                                 │
    │  one punch. He decides to put his new      Vol 16 Chapter 100.01 ①                                                     │
    │  skill to good use by becoming a hero.     Vol 6 Chapter 45                                                            │
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
    │              One-Punch Man               > Vol 7 Chapter 60.5                                                          │
    │  .........((url https://manga..........    Vol 5 Chapter 42 No title                                                   │
    │  .........dex.org/covers/d8a9..........    Vol 16 Chapter 100.17 Гость из NK                                           │
    │  .........59f7-648e-4c8d-8f23..........    Vol 16 Chapter 100.03 ③                                                     │
    │  .........-f1f3f8e129f3/03809..........    Vol 2 Chapter 17 Psychic Power and I                                        │
    │  .........62e-26f8-4233-8c24-..........    Vol 8 Chapter 62 Morphing                                                   │
    │  .........d36b2ebceb3e.jpg)(r..........    Vol 7 Chapter 60 Истинная личина                                            │
    │  .........ow 4)(column 2)(dim..........    Vol 11 Chapter 86 In Plain View                                             │
    │  .........ensions((height 9)(..........    Vol 2 Chapter 15 Completamente Desaparecido                                 │
    │  .........width 38)))(scale t..........    Vol 9 Chapter 74 No title                                                   │
    │  ─────────rue))────────────────────────    Vol 16 Chapter 100.07 Экстра Летние каникулы                                │
    │                                            Vol 16 Chapter 100.18 ⑭                                                     │
    │  Author:  ONE                              Vol 7 Chapter 55                                                            │
    │  Status:  ONGOING                          Vol 1 Chapter 4 Önmagadért                                                  │
    │                                            Vol 7 Chapter 58.5                                                          │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Chapter 74.5 Экстра Manga ONE                                         │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Chapter 31 Mature                                                     │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Chapter 33 No title                                                   │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Chapter 52.6 Экстра Большая уборка                                    │
    │   ADAPTATION                               Vol 7 Chapter 57                                                            │
    │                                            Vol 15 Chapter 99 No title                                                  │
    │  After rigorously training for three       Vol 10 Chapter 75 Walaupun Demikian                                         │
    │  years, the ordinary Saitama has gained    Vol 6 Chapter 52                                                            │
    │  immense strength which allows him to      Vol 6 Chapter 52.5 Экстра Омакэ                                             │
    │  take out anyone and anything with just    Vol 14 Chapter 97 Dimple Is                                                 │
    │  one punch. He decides to put his new      Vol 16 Chapter 100.01 ①                                                     │
    │  skill to good use by becoming a hero.     Vol 6 Chapter 45                                                            │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
