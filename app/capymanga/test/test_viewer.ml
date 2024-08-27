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
    │  Capymanga powered by Mangadex  ⣾  Backspace back  Tab switch focus                                                    │
    │                                                                                                                        │
    │              One-Punch Man               > Vol 7 Ch 60.5  ⣾                                                            │
    │                                            Vol 5 Ch 42 No title ⣾                                                      │
    │                                            Vol 16 Ch 100.17 Гость из NK ⣾                                              │
    │                                            Vol 16 Ch 100.03 ③ ⣾                                                        │
    │                                            Vol 2 Ch 17 Psychic Power and I ⣾                                           │
    │                                            Vol 8 Ch 62 Morphing ⣾                                                      │
    │                                            Vol 7 Ch 60 Истинная личина ⣾                                               │
    │                                            Vol 11 Ch 86 In Plain View ⣾                                                │
    │                                            Vol 2 Ch 15 Completamente Desaparecido ⣾                                    │
    │                                            Vol 9 Ch 74 No title ⣾                                                      │
    │  ──────────────────────────────────────    Vol 16 Ch 100.07 Экстра Летние каникулы ⣾                                   │
    │                                            Vol 16 Ch 100.18 ⑭ ⣾                                                        │
    │  Author:  ONE                              Vol 7 Ch 55  ⣾                                                              │
    │  Status:  ONGOING                          Vol 1 Ch 4 Önmagadért ⣾                                                     │
    │                                            Vol 7 Ch 58.5  ⣾                                                            │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Ch 74.5 Экстра Manga ONE ⣾                                            │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Ch 31 Mature ⣾                                                        │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Ch 33 No title ⣾                                                      │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Ch 52.6 Экстра Большая уборка ⣾                                       │
    │   ADAPTATION                               Vol 7 Ch 57  ⣾                                                              │
    │                                            Vol 15 Ch 99 No title ⣾                                                     │
    │  After rigorously training for three       Vol 10 Ch 75 Walaupun Demikian ⣾                                            │
    │  years, the ordinary Saitama has gained    Vol 6 Ch 52  ⣾                                                              │
    │  immense strength which allows him to      Vol 6 Ch 52.5 Экстра Омакэ ⣾                                                │
    │  take out anyone and anything with just    Vol 14 Ch 97 Dimple Is ⣾                                                    │
    │  one punch. He decides to put his new      Vol 16 Ch 100.01 ① ⣾                                                        │
    │  skill to good use by becoming a hero.     Vol 6 Ch 45  ⣾                                                              │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Handle.advance_clock_by handle (Time_ns.Span.of_sec 1.0);
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([scanlation_group]
     (scanlation_group_id 11a83245-d05f-45ff-9cba-42bf535ab54d))
    ([scanlation_group]
     (scanlation_group_id 16f54fa6-44e8-41e4-857b-3ea4397ad784))
    ([scanlation_group]
     (scanlation_group_id 50dbd326-619a-4751-aeb3-da76f8b52688))
    ([scanlation_group]
     (scanlation_group_id 56ddcbfa-ac51-43ee-8055-5f93d3757386))
    ([scanlation_group]
     (scanlation_group_id 5f7b2b86-0f13-4e2e-b9f7-c07faa65b3c1))
    ([scanlation_group]
     (scanlation_group_id 63251a29-a04e-42e1-a842-4a0d6fdebdd0))
    ([scanlation_group]
     (scanlation_group_id 89edf9e3-6698-4502-a495-24579ecb91d0))
    ([scanlation_group]
     (scanlation_group_id 9387f5c9-04ae-40d1-b781-3c89968cfa03))
    ([scanlation_group]
     (scanlation_group_id a96cc99d-7ceb-43b1-99ef-02e6ae30c7cf))
    ([scanlation_group]
     (scanlation_group_id b312bed7-abd9-4d00-bbb8-150af1081fac))
    ([scanlation_group]
     (scanlation_group_id ca6e48f8-f580-4cee-8eed-c30ead54b3d0))
    ([scanlation_group]
     (scanlation_group_id d4bb3ad1-2451-4110-9940-0cd39d6db0a4))
    ([manga_cover] (cover_id c1037a0c-aa5e-4cd9-bd33-6514a2eb332b))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex  ⣾  Backspace back  Tab switch focus                                                    │
    │                                                                                                                        │
    │              One-Punch Man               > Vol 7 Ch 60.5   scanlation by  Hunlight Scans                               │
    │  .........((url https://manga..........    Vol 5 Ch 42 No title  scanlation by  Hunlight Scans                         │
    │  .........dex.org/covers/d8a9..........    Vol 16 Ch 100.17 Гость из NK  scanlation by  Hunlight Scans                 │
    │  .........59f7-648e-4c8d-8f23..........    Vol 16 Ch 100.03 ③  scanlation by  Hunlight Scans                           │
    │  .........-f1f3f8e129f3/03809..........    Vol 2 Ch 17 Psychic Power and I  scanlation by  Hunlight Scans              │
    │  .........62e-26f8-4233-8c24-..........    Vol 8 Ch 62 Morphing  scanlation by  Hunlight Scans                         │
    │  .........d36b2ebceb3e.jpg)(r..........    Vol 7 Ch 60 Истинная личина  scanlation by  Hunlight Scans                  │
    │  .........ow 4)(column 2)(dim..........    Vol 11 Ch 86 In Plain View  scanlation by  Hunlight Scans                   │
    │  .........ensions((height 9)(..........    Vol 2 Ch 15 Completamente Desaparecido  scanlation by  Hunlight Scans       │
    │  .........width 38)))(scale t..........    Vol 9 Ch 74 No title  scanlation by  Hunlight Scans                         │
    │           rue))                            Vol 16 Ch 100.07 Экстра Летние каникулы  scanlation by  Hunlight Scans      │
    │                                            Vol 16 Ch 100.18 ⑭  scanlation by  Hunlight Scans                           │
    │  Author:  ONE                              Vol 7 Ch 55   scanlation by  Hunlight Scans                                 │
    │  Status:  ONGOING                          Vol 1 Ch 4 Önmagadért  scanlation by  Hunlight Scans                        │
    │                                            Vol 7 Ch 58.5   scanlation by  Hunlight Scans                               │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Ch 74.5 Экстра Manga ONE  scanlation by  Hunlight Scans               │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Ch 31 Mature  scanlation by  Hunlight Scans                           │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Ch 33 No title  scanlation by  Hunlight Scans                         │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Ch 52.6 Экстра Большая уборка  scanlation by  Hunlight Scans          │
    │   ADAPTATION                               Vol 7 Ch 57   scanlation by  Hunlight Scans                                 │
    │                                            Vol 15 Ch 99 No title  scanlation by  Hunlight Scans                        │
    │  After rigorously training for three       Vol 10 Ch 75 Walaupun Demikian  scanlation by  Hunlight Scans               │
    │  years, the ordinary Saitama has gained    Vol 6 Ch 52   scanlation by  Hunlight Scans                                 │
    │  immense strength which allows him to      Vol 6 Ch 52.5 Экстра Омакэ  scanlation by  Hunlight Scans                   │
    │  take out anyone and anything with just    Vol 14 Ch 97 Dimple Is  scanlation by  Hunlight Scans                       │
    │  one punch. He decides to put his new      Vol 16 Ch 100.01 ①  scanlation by  Hunlight Scans                           │
    │  skill to good use by becoming a hero.     Vol 6 Ch 45   scanlation by  Hunlight Scans                                 │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  Capytui_test.send_event handle (`Key (`ASCII 'l', []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex     Backspace back  Tab switch focus                                                    │
    │                                                                                                                        │
    │              One-Punch Man               > Vol 7 Ch 60.5   scanlation by  Hunlight Scans                               │
    │  .........((url https://manga..........    Vol 5 Ch 42 No title  scanlation by  Hunlight Scans                         │
    │  .........dex.org/covers/d8a9..........    Vol 16 Ch 100.17 Гость из NK  scanlation by  Hunlight Scans                 │
    │  .........59f7-648e-4c8d-8f23..........    Vol 16 Ch 100.03 ③  scanlation by  Hunlight Scans                           │
    │  .........-f1f3f8e129f3/03809..........    Vol 2 Ch 17 Psychic Power and I  scanlation by  Hunlight Scans              │
    │  .........62e-26f8-4233-8c24-..........    Vol 8 Ch 62 Morphing  scanlation by  Hunlight Scans                         │
    │  .........d36b2ebceb3e.jpg)(r..........    Vol 7 Ch 60 Истинная личина  scanlation by  Hunlight Scans                  │
    │  .........ow 4)(column 2)(dim..........    Vol 11 Ch 86 In Plain View  scanlation by  Hunlight Scans                   │
    │  .........ensions((height 9)(..........    Vol 2 Ch 15 Completamente Desaparecido  scanlation by  Hunlight Scans       │
    │  .........width 38)))(scale t..........    Vol 9 Ch 74 No title  scanlation by  Hunlight Scans                         │
    │           rue))                            Vol 16 Ch 100.07 Экстра Летние каникулы  scanlation by  Hunlight Scans      │
    │                                            Vol 16 Ch 100.18 ⑭  scanlation by  Hunlight Scans                           │
    │  Author:  ONE                              Vol 7 Ch 55   scanlation by  Hunlight Scans                                 │
    │  Status:  ONGOING                          Vol 1 Ch 4 Önmagadért  scanlation by  Hunlight Scans                        │
    │                                            Vol 7 Ch 58.5   scanlation by  Hunlight Scans                               │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Ch 74.5 Экстра Manga ONE  scanlation by  Hunlight Scans               │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Ch 31 Mature  scanlation by  Hunlight Scans                           │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Ch 33 No title  scanlation by  Hunlight Scans                         │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Ch 52.6 Экстра Большая уборка  scanlation by  Hunlight Scans          │
    │   ADAPTATION                               Vol 7 Ch 57   scanlation by  Hunlight Scans                                 │
    │                                            Vol 15 Ch 99 No title  scanlation by  Hunlight Scans                        │
    │  After rigorously training for three       Vol 10 Ch 75 Walaupun Demikian  scanlation by  Hunlight Scans               │
    │  years, the ordinary Saitama has gained    Vol 6 Ch 52   scanlation by  Hunlight Scans                                 │
    │  immense strength which allows him to      Vol 6 Ch 52.5 Экстра Омакэ  scanlation by  Hunlight Scans                   │
    │  take out anyone and anything with just    Vol 14 Ch 97 Dimple Is  scanlation by  Hunlight Scans                       │
    │  one punch. He decides to put his new      Vol 16 Ch 100.01 ①  scanlation by  Hunlight Scans                           │
    │  skill to good use by becoming a hero.     Vol 6 Ch 45   scanlation by  Hunlight Scans                                 │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Handle.recompute_view handle;
  String.iter "jjjjjjjjj" ~f:(fun c ->
    Capytui_test.send_event handle (`Key (`ASCII c, [])));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex     Backspace back  Tab switch focus                                                    │
    │                                                                                                                        │
    │              One-Punch Man                 Vol 7 Ch 60.5   scanlation by  Hunlight Scans                               │
    │  .........((url https://manga..........    Vol 5 Ch 42 No title  scanlation by  Hunlight Scans                         │
    │  .........dex.org/covers/d8a9..........    Vol 16 Ch 100.17 Гость из NK  scanlation by  Hunlight Scans                 │
    │  .........59f7-648e-4c8d-8f23..........    Vol 16 Ch 100.03 ③  scanlation by  Hunlight Scans                           │
    │  .........-f1f3f8e129f3/03809..........    Vol 2 Ch 17 Psychic Power and I  scanlation by  Hunlight Scans              │
    │  .........62e-26f8-4233-8c24-..........    Vol 8 Ch 62 Morphing  scanlation by  Hunlight Scans                         │
    │  .........d36b2ebceb3e.jpg)(r..........    Vol 7 Ch 60 Истинная личина  scanlation by  Hunlight Scans                  │
    │  .........ow 4)(column 2)(dim..........    Vol 11 Ch 86 In Plain View  scanlation by  Hunlight Scans                   │
    │  .........ensions((height 9)(..........    Vol 2 Ch 15 Completamente Desaparecido  scanlation by  Hunlight Scans       │
    │  .........width 38)))(scale t..........  > Vol 9 Ch 74 No title  scanlation by  Hunlight Scans                         │
    │           rue))                            Vol 16 Ch 100.07 Экстра Летние каникулы  scanlation by  Hunlight Scans      │
    │                                            Vol 16 Ch 100.18 ⑭  scanlation by  Hunlight Scans                           │
    │  Author:  ONE                              Vol 7 Ch 55   scanlation by  Hunlight Scans                                 │
    │  Status:  ONGOING                          Vol 1 Ch 4 Önmagadért  scanlation by  Hunlight Scans                        │
    │                                            Vol 7 Ch 58.5   scanlation by  Hunlight Scans                               │
    │   AWARD WINNING   SCI-FI   GORE            Vol 9 Ch 74.5 Экстра Manga ONE  scanlation by  Hunlight Scans               │
    │   MONSTERS   ACTION   COMEDY               Vol 4 Ch 31 Mature  scanlation by  Hunlight Scans                           │
    │   SUPERHERO   MARTIAL ARTS   DRAMA         Vol 4 Ch 33 No title  scanlation by  Hunlight Scans                         │
    │   WEB COMIC   SUPERNATURAL   MYSTERY       Vol 6 Ch 52.6 Экстра Большая уборка  scanlation by  Hunlight Scans          │
    │   ADAPTATION                               Vol 7 Ch 57   scanlation by  Hunlight Scans                                 │
    │                                            Vol 15 Ch 99 No title  scanlation by  Hunlight Scans                        │
    │  After rigorously training for three       Vol 10 Ch 75 Walaupun Demikian  scanlation by  Hunlight Scans               │
    │  years, the ordinary Saitama has gained    Vol 6 Ch 52   scanlation by  Hunlight Scans                                 │
    │  immense strength which allows him to      Vol 6 Ch 52.5 Экстра Омакэ  scanlation by  Hunlight Scans                   │
    │  take out anyone and anything with just    Vol 14 Ch 97 Dimple Is  scanlation by  Hunlight Scans                       │
    │  one punch. He decides to put his new      Vol 16 Ch 100.01 ①  scanlation by  Hunlight Scans                           │
    │  skill to good use by becoming a hero.     Vol 6 Ch 45   scanlation by  Hunlight Scans                                 │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}];
  Capytui_test.send_event handle (`Key (`Enter, []));
  Handle.recompute_view handle;
  Handle.show handle;
  [%expect
    {|
    ([chapter_id] (chapter_id 00e9c6ab-0ff6-4967-9d86-448e6245e61b))
    ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
    │                                                                                                                        │
    │  Capymanga powered by Mangadex  ⣾  Backspace go back  f go fullscreen  1/27                                            │
    │                                                                                                                        │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │.............................((url https://cmdxd98sb0x3yprd.mangadex.network/data-saver/..............................  │
    │.............................ad9bc794465f484c0e0a83d2e1203ec9/1-2b06f7cba184a57f4ad9ccb9..............................  │
    │.............................76d8d8197d979a5bcf15fa79c0f8003a17713c6c.jpg)(row 3)(column..............................  │
    │............................. 0)(dimensions((height 25)(width 118)))(scale true)).....................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │......................................................................................................................  │
    │                                                                                                                        │
    │                                                                                                                        │
    └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
    |}]
;;
