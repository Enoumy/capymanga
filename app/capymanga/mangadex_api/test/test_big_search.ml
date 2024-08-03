open! Core
open Mangadex_api.Types

let%expect_test "parsing a big search collection" =
  (* This test just showcases that we are able to parse the json of a
     request... *)
  let collection =
    Collection.t_of_yojson
      Manga.t_of_yojson
      (Yojson.Safe.from_string Embedded_files.big_response_dot_json)
  in
  print_s [%sexp (collection : Manga.t Collection.t)];
  [%expect {|
    ((data
      (((id b1629d65-f177-418a-a04f-ae4ee6929f90)
        (attributes
         ((title
           (((language en)
             (string "Imprisoned with the Horror Game's Male Lead"))))
          (alt_titles
           ((((language ko)
              (string
               "\234\179\181\237\143\172\234\178\140\236\158\132 \235\130\168\236\163\188\236\153\128 \234\176\144\234\184\136\235\139\185\237\150\136\235\139\164")))
            (((language en)
              (string
               "Confined Together with the Horror Game\226\128\153s Male Lead")))
            (((language es-la)
              (string
               "Me convert\195\173 en la sirvienta del protagonista de un juego de terror")))))
          (description
           (((language en)
             (string
               "I became a maid inside of a horror game.\
              \nPenalties were given to the male lead, who was trying to escape being locked up in a large mansion, and I acted as a guide. \
              \n\
              \nI was going to fulfill my duties until the male lead\226\128\153s play ends.\
              \n\
              \n\226\128\156When I get out, I\226\128\153ll lock you up exactly the same way.\226\128\157\
              \n\
              \nThe male lead is so noisy. \
              \nIf it\226\128\153s going to be like this, I\226\128\153ll just help him escape faster. \
              \n\
              \n\226\128\156Let\226\128\153s eat, Dietrich.\226\128\157\
              \n\226\128\156This is a potion, it\226\128\153ll help you recover faster if you take it.\226\128\157\
              \n\226\128\156The hint to escape is over there\226\128\166\226\128\157\
              \n\
              \nI fed him well to prepare for the next play, and when the male lead got hurt, I gave him a potion so he could quickly play the next game,\
              \nI even gave him a hint for the problem. \
              \n\
              \nYou\226\128\153ll be able to get out now, right?\
              \n\
              \nHowever. \
              \n\
              \n\226\128\156I don\226\128\153t really know the answer.\226\128\157\
              \n\
              \nWhat\226\128\153s the meaning of this? Aren\226\128\153t you supposed to be smart?\
              \n\
              \n\226\128\166The male lead doesn\226\128\153t think about leaving the mansion at all. \
              \n\
              \n\226\128\156If you won\226\128\153t get out, I will.\226\128\157\
              \n\
              \nI shouted in anger because I was so sick of the thought of having to see the face of someone I don\226\128\153t want to keep seeing. \
              \n\
              \n\226\128\156Is it possible for you to get out of here?\226\128\157\
              \n\
              \nHis eyes sank bitterly. \
              \n\
              \n\226\128\156Let me tell you this, I have no intention of leaving this place.\226\128\157\
              \n\226\128\156What?\226\128\157\
              \n\226\128\156And you have no way of getting out, either.\226\128\157\
              \n\
              \nWhat the hell is going on?"))))
          (is_locked false)
          (links
           (((provider ap)
             (link confined-together-with-the-horror-games-male-lead))
            ((provider mu) (link kbbudsw))
            ((provider nu)
             (link confined-together-with-the-horror-games-male-lead))
            ((provider mal) (link 168502))
            ((provider raw) (link https://page.kakao.com/content/63764693))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating suggestive)
          (tags
           (((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdad7e68-1419-41dd-bdce-27753074a640)
             (attributes
              ((name (((language en) (string Horror)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-03-16T20:51:42+00:00)
          (updated_at 2024-07-14T21:00:56+00:00) (version 7)
          (available_translated_languages (pt-br es-la en))
          (latest_uploaded_chapter b19cd6d7-f153-4990-b885-9ca2dfac721f)))
        (relationships
         (((id f7787b05-5835-45c7-a16d-eb1db4fcddd1) (type_ author))
          ((id c930dee5-a26d-41b2-91f7-26fbc33b3f18) (type_ artist))
          ((id b230f35a-1116-4bf2-b59f-53dbbcb74ff1) (type_ cover_art))
          ((id e4d9c8ec-5f0c-48db-b0d9-0a6de515935c) (type_ creator)))))
       ((id a1db428c-685c-4d11-927b-bf71eb4b254b)
        (attributes
         ((title (((language en) (string "Juuou to Yakusou"))))
          (alt_titles
           ((((language ja-ro) (string "Juuou to Yakusou")))
            (((language ru)
              (string
               "\208\154\208\190\209\128\208\190\208\187\209\140 \208\183\208\178\208\181\209\128\208\181\208\185 \208\184 \208\187\208\181\208\186\208\176\209\128\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\181 \209\130\209\128\208\176\208\178\209\139.")))
            (((language ja)
              (string
               "\231\141\163\231\142\139\227\129\168\232\150\172\232\141\137")))
            (((language ja-ro) (string "Kemono wo to Kusuri")))
            (((language en) (string "Beast King & Medicinal Herb")))))
          (description
           (((language en)
             (string
              "Dungeons are the stuff of dreams\226\128\148defeat the monsters, take their loot, and then venture into uncharted territory to discover hidden riches! Tina, an upstart adventurer with just such a dream, ends up mortally wounded while exploring a dungeon. Suddenly, the great demon known as the Beast King Garon, who was supposed to have been slain by a hero in the distant past, appears before her!  Dungeon fantasy meets medical drama!"))
            ((language ru)
             (string
               "\208\159\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\209\143 - \209\141\209\130\208\190 \208\178\208\190\208\191\208\187\208\190\209\137\208\181\208\189\208\184\208\181 \208\188\208\181\209\135\209\130\209\139\226\128\166\
              \n\208\161\208\190\208\177\208\184\209\128\208\176\208\185\209\130\208\181 \208\188\208\176\209\130\208\181\209\128\208\184\208\176\208\187\209\139 \209\129 \208\191\208\190\208\178\208\181\209\128\208\182\208\181\208\189\208\189\209\139\209\133 \208\188\208\190\208\189\209\129\209\130\209\128\208\190\208\178,\
              \n\208\180\208\190\208\177\208\184\209\128\208\176\208\185\209\130\208\181\209\129\209\140 \208\180\208\190 \208\189\208\181\208\184\209\129\209\129\208\187\208\181\208\180\208\190\208\178\208\176\208\189\208\189\209\139\209\133 \208\188\208\181\209\129\209\130 \208\184 \208\183\208\176\208\178\208\187\208\176\208\180\208\181\208\178\208\176\208\185\209\130\208\181 \209\129\208\190\208\186\209\128\208\190\208\178\208\184\209\137\208\176\208\188\208\184!\
              \n\208\162\208\184\208\189\208\176, \208\176\208\178\208\176\208\189\209\130\209\142\209\128\208\184\209\129\209\130\208\186\208\176, \208\188\208\181\209\135\209\130\208\176\208\181\209\130 \208\190 \209\130\208\176\208\186\208\190\208\188 \209\131\209\129\208\191\208\181\209\133\208\181,\
              \n\208\152\209\129\209\129\208\187\208\181\208\180\209\131\209\143 \208\191\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\208\181, \208\190\208\189\208\176 \208\191\208\190\208\187\209\131\209\135\208\176\208\181\209\130 \209\130\209\143\208\182\208\181\208\187\208\190\208\181 \209\128\208\176\208\189\208\181\208\189\208\184\208\181.\
              \n\208\159\208\181\209\128\208\181\208\180 \208\189\208\181\208\185 \208\191\208\190\209\143\208\178\208\187\209\143\208\181\209\130\209\129\209\143 \209\129\208\184\208\187\209\140\208\189\208\181\208\185\209\136\208\184\208\185 \208\180\208\181\208\188\208\190\208\189 \194\171\208\154\208\190\209\128\208\190\208\187\209\140 \208\183\208\178\208\181\209\128\208\181\208\185 \208\147\208\176\209\128\208\190\208\189\194\187, \208\186\208\190\208\179\208\180\208\176-\209\130\208\190 \208\178 \208\191\209\128\208\190\209\136\208\187\208\190\208\188 \208\190\208\189 \208\180\208\190\208\187\208\182\208\181\208\189 \208\177\209\139\208\187 \208\177\209\139\209\130\209\140 \209\131\208\177\208\184\209\130 \208\179\208\181\209\128\208\190\208\181\208\188?..\
              \n\
              \n\208\164\209\141\208\189\209\130\208\181\208\183\208\184 \208\184 \208\188\208\181\208\180\208\184\209\134\208\184\208\189\209\129\208\186\208\176\209\143 \208\180\209\128\208\176\208\188\208\176 \208\191\208\190 \208\188\208\190\209\130\208\184\208\178\208\176\208\188 \208\191\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\209\143 \208\190\209\130 Konda Tatsukazu, \208\176\208\178\209\130\208\190\209\128\208\176 \208\190\209\128\208\184\208\179\208\184\208\189\208\176\208\187\209\140\208\189\208\190\208\185 \208\184\209\129\209\130\208\190\209\128\208\184\208\184 \194\171Ginrou Bloodborne/\208\161\208\181\209\128\208\181\208\177\209\128\209\143\208\189\209\139\208\185 \208\178\208\190\208\187\208\186, \209\128\208\190\208\182\208\180\208\181\208\189\208\189\209\139\208\185 \208\178 \208\186\209\128\208\190\208\178\208\184\194\187, \208\189\208\176\209\135\208\184\208\189\208\176\208\181\209\130\209\129\209\143!"))))
          (is_locked false)
          (links
           (((provider al) (link 173339)) ((provider ap) (link juuou-to-yakusou))
            ((provider bw) (link series/443631))
            ((provider kt) (link juuou-to-yakusou))
            ((provider mu) (link wsp1c0v))
            ((provider amz) (link https://www.amazon.co.jp/-/en/dp/B0CM7C7KMF))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2909146))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/797327/))
            ((provider mal) (link 167574))
            ((provider raw) (link https://urasunday.com/title/2379/214131))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id c8cbe35b-1b2b-4a3f-9c37-db84c4514856)
             (attributes
              ((name (((language en) (string Medical)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-10-31T17:36:49+00:00)
          (updated_at 2024-07-13T09:31:28+00:00) (version 21)
          (available_translated_languages (ru en))
          (latest_uploaded_chapter a8ec13b5-91ad-471a-a2f0-4a15e6cea5d5)))
        (relationships
         (((id 47ee56af-df3d-4062-8a05-3cfff2d428b6) (type_ author))
          ((id a8e8702f-0123-4dc7-8a1c-34097a4f649a) (type_ artist))
          ((id d2e22a4b-7eed-45d5-9278-71cb86dbc850) (type_ cover_art))
          ((id 92f1689d-35c0-4fa3-ad0a-ef01bd16032e) (type_ creator)))))
       ((id 4c53c85c-0303-4cf0-887b-15092774c6a1)
        (attributes
         ((title (((language en) (string "Shugo Chara! Jewel Joker"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\151\227\130\133\227\129\148\227\130\173\227\131\163\227\131\169\239\188\129 \227\130\184\227\131\165\227\130\168\227\131\171\227\130\184\227\131\167\227\131\188\227\130\171\227\131\188")))
            (((language ja-ro) (string "Shugo Chara! Jewel Joker")))))
          (description
           (((language en)
             (string
               "The long-awaited comeback! A new story of Amu and her guardian characters begins...!\
              \n\
              \nThe cool and spicy Amu Hinamori has graduated from Seiyo Academy's elementary school and is finally a junior high school student! She thought she would have carefree days with her precious friends in junior high... until she is asked to take on a mission related to guardian characters and has to transfer to a new school...!"))))
          (is_locked false) (links (((provider mu) (link jyz8gob))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shoujo)) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 81c836c9-914a-4eca-981a-560dad663e73)
             (attributes
              ((name (((language en) (string "Magical Girls")))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-31T09:51:20+00:00)
          (updated_at 2024-08-01T21:02:44+00:00) (version 7)
          (available_translated_languages (en))
          (latest_uploaded_chapter f3f851a0-b923-4ee2-b6ee-024f61e2cd39)))
        (relationships
         (((id b9dc6b55-5ced-4631-969d-5956c9e3411a) (type_ author))
          ((id b9dc6b55-5ced-4631-969d-5956c9e3411a) (type_ artist))
          ((id 2b9ee00b-c401-42e3-b9f0-e1c70f2dfba1) (type_ cover_art))
          ((id 72b27201-7911-48fc-b042-4ca39590114e) (type_ manga))
          ((id 132c7600-c1bd-4263-bcaf-c0e0c1a644ab) (type_ creator)))))
       ((id 65512e8c-71c6-4143-ab88-1f62942e7dd2)
        (attributes
         ((title (((language en) (string Ramia-Yana))))
          (alt_titles
           ((((language en) (string "Hero & Demon Lord Chronicles")))
            (((language en) (string Ramia)))
            (((language en) (string "Ramia - Hero & Demon Lord Chronicles")))
            (((language ru)
              (string
               "\208\160\208\176\208\188\208\184\209\143-\208\175\208\189\208\176: \208\165\209\128\208\190\208\189\208\184\208\186\208\184 \208\147\208\181\209\128\208\190\209\143 \208\184 \208\159\208\190\208\178\208\181\208\187\208\184\209\130\208\181\208\187\209\143 \208\148\208\181\208\188\208\190\208\189\208\190\208\178")))
            (((language id) (string "Ramia-Yana: Hikayat Bahadur & Raja Iblis")))
            (((language id) (string "Ramia-Yana: Kisah Pahlawan & Raja Iblis")))
            (((language ru)
              (string
               "\208\160\208\176\208\188\208\184\209\143-\208\175\208\189\208\176")))
            (((language ru) (string "\208\160\208\176\208\188\208\184\209\143")))
            (((language hi)
              (string
               "\224\164\176\224\164\174\224\164\191\224\164\175\224\164\190\224\164\175\224\164\163")))
            (((language tr)
              (string
               "Ramia-Yana; Kahraman ve \196\176blis Lordu G\195\188nl\195\188kleri")))
            (((language es-la)
              (string
               "Ramia-Yana: Cr\195\179nicas de la hero\195\173na Ramia & Lord de los Demonios")))))
          (description
           (((language en)
             (string
               "Each time a Demon Lord has appeared, a human hero has slain it, pushing back the demons in the dark lands. \r\
              \nAs the cycle starts over again, a mysterious ancient hero called Ramia reappears. Meanwhile, an abnormal Demon army suddenly strikes the kingdom\226\128\166"))
            ((language fr)
             (string
               "L'histoire fantastique de l'excentrique et myst\195\169rieuse h\195\169ro\195\175ne Ramia et des d\195\169mons qui s'opposent \195\160 elle.  \r\
              \n\r\
              \n\r\
              \n---\r\
              \n\r\
              \n**Links:**  \r\
              \n- [Author's Twitter](https://twitter.com/TheGoldenSmurf)  \r\
              \n- [Author's Pixiv](https://www.pixiv.net/en/users/10669208)  \r\
              \n- [Author's Patreon](https://www.patreon.com/thegoldensmurf)"))
            ((language id)
             (string
               "Setiap kali seorang Raja Iblis memunculkan diri, seorang bahadur manusia telah tampak \226\128\153tuk menakluknya, mendorong mundur para iblis ke negeri gulita.\r\
              \nDengan mulainya lagi daurnya, seorang bahadur kuno misterius bernama Ramia muncul kembali. Sementara itu, sebuah laskar Iblis taknormal tiba-tiba menyerang kerajaannya..."))
            ((language ru)
             (string
              "\208\164\209\141\208\189\209\130\208\181\208\183\208\184\208\185\208\189\209\139\208\185 \209\141\208\191\208\190\209\129, \208\191\208\190\209\129\208\178\209\143\209\137\208\181\208\189\208\189\209\139\208\185 \208\189\208\181\208\190\208\177\209\139\209\135\208\189\208\190\208\188\209\131 \208\184 \209\130\208\176\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\208\190\208\188\209\131 \208\179\208\181\209\128\208\190\209\142 \208\191\208\190 \208\184\208\188\208\181\208\189\208\184 \208\160\208\176\208\188\208\184\209\143."))
            ((language tr)
             (string
               "Ne zaman bir \196\176blis Lordu ortaya \195\167\196\177ksa, bir insan kahraman onu \195\182ld\195\188rerek karanl\196\177k topraklardaki iblisleri geri p\195\188sk\195\188rtm\195\188\197\159t\195\188r.\
              \nD\195\182ng\195\188 yeniden ba\197\159larken, Ramia ad\196\177nda gizemli bir antik kahraman yeniden ortaya \195\167\196\177kar. Bu s\196\177rada, anormal bir \196\176blis ordusu aniden krall\196\177\196\159a sald\196\177r\196\177r..."))
            ((language es-la)
             (string
               "Cada vez que aparec\195\173a un Lord de los Demonios, un h\195\169roe humano lo eliminaba, haciendo retroceder a los demonios a las tierras oscuras.\
              \nMientras el ciclo empieza una vez m\195\161s, una antigua y misteriosa hero\195\173na llamada Ramia reaparece. Y mientras tanto, un ej\195\169rcito anormal de Demonios azota repentinamente al reino..."))))
          (is_locked false)
          (links
           (((provider kt) (link ramia-yana))
            ((provider engtl)
             (link https://www.pixiv.net/user/10669208/series/88816))))
          (original_language en) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year ())
          (content_rating safe)
          (tags
           (((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 891cf039-b895-47f0-9229-bef4c96eccd4)
             (attributes
              ((name (((language en) (string Self-Published)))) (group format)
               (version 1))))
            ((id 97893a4c-12af-4dac-b6be-0dffb353568e)
             (attributes
              ((name (((language en) (string "Sexual Violence"))))
               (group content) (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-09-07T06:18:47+00:00)
          (updated_at 2024-06-27T05:07:49+00:00) (version 31)
          (available_translated_languages
           (es id tr ru en de zh-hk es-la pt-br pl fr hi))
          (latest_uploaded_chapter 1e82307d-7295-4c3c-9e76-440f6baeca5c)))
        (relationships
         (((id 4eb91858-2c93-41b3-953c-5bd59ea369f7) (type_ author))
          ((id 4eb91858-2c93-41b3-953c-5bd59ea369f7) (type_ artist))
          ((id 5b9b8a93-c8b0-46ba-b1e8-c7593f60038f) (type_ cover_art)))))
       ((id 304ceac3-8cdb-4fe7-acf7-2b6ff7a60613)
        (attributes
         ((title (((language en) (string "Attack on Titan"))))
          (alt_titles
           ((((language ja)
              (string
               "\233\128\178\230\146\131\227\129\174\229\183\168\228\186\186")))
            (((language ja-ro) (string "Shingeki no Kyojin")))
            (((language ja-ro) (string SnK)))
            (((language en) (string "The Invading Giants")))
            (((language en) (string AoT)))
            (((language en) (string "The Advancing Giants")))
            (((language de) (string "Angriff auf Titan")))
            (((language de) (string "Angreifender Riese")))
            (((language sv) (string "Framryckande j\195\164tten")))
            (((language la) (string "Oppugnatione titan")))
            (((language fr) (string "L'attaque des titans")))
            (((language fr) (string "L'attaque sur les titans")))
            (((language ca) (string "Tit\195\160 d'atac")))
            (((language es) (string "Ataque de titanes")))
            (((language es-la) (string "Ataque a los titanes")))
            (((language es-la) (string "Ataque de los titanes")))
            (((language pt) (string "Ataque dos tit\195\163s")))
            (((language pt-br) (string "Ataque dos tit\195\163s")))
            (((language it) (string "L'attacco dei giganti")))
            (((language sq) (string "Sulmi Titan")))
            (((language pl) (string "Atak Tytan\195\179w")))
            (((language cs) (string "\195\154tok Tit\195\161n\197\175")))
            (((language cs) (string "\197\160ingeki no kjod\197\190in")))
            (((language hr) (string "Napad Titana")))
            (((language hr) (string "Napad na Titan")))
            (((language hr) (string "Napad na Divove")))
            (((language sr)
              (string
               "\208\157\208\176\208\191\208\176\208\180 \209\130\208\184\209\130\208\176\208\189\208\176")))
            (((language ru)
              (string
               "\208\144\209\130\208\176\208\186\208\176 \209\130\208\184\209\130\208\176\208\189\208\190\208\178")))
            (((language ru)
              (string
               "\208\144\209\130\208\176\208\186\208\176 \208\189\208\176 \209\130\208\184\209\130\208\176\208\189\208\190\208\178")))
            (((language ru)
              (string
               "\208\161\208\184\208\189\208\179\209\141\208\186\208\184 \208\189\208\190 \208\154\209\145\208\180\208\183\208\184\208\189")))
            (((language uk)
              (string
               "\208\144\209\130\208\176\208\186\208\176 \209\130\208\184\209\130\208\176\208\189\209\150\208\178")))
            (((language uk)
              (string
               "\208\144\209\130\208\176\208\186\209\131\209\142\209\135\208\184\208\185 \209\130\208\184\209\130\208\176\208\189")))
            (((language fa)
              (string
               "\216\173\217\133\217\132\217\135 \216\168\217\135 \216\170\216\167\219\140\216\170\216\167\217\134")))
            (((language fa)
              (string
               "\216\170\216\167\219\140\216\170\216\167\217\134 \217\133\217\135\216\167\216\172\217\133")))
            (((language bn)
              (string
               "\224\166\133\224\167\141\224\166\175\224\166\190\224\166\159\224\167\141\224\166\175\224\166\190\224\166\149 \224\166\133\224\166\168 \224\166\159\224\166\190\224\166\135\224\166\159\224\166\190\224\166\168")))
            (((language ne)
              (string
               "\224\164\159\224\164\190\224\164\135\224\164\159\224\164\168\224\164\174\224\164\190 \224\164\134\224\164\149\224\165\141\224\164\176\224\164\174\224\164\163")))
            (((language ka)
              (string
               "\225\131\162\225\131\152\225\131\162\225\131\144\225\131\156\225\131\148\225\131\145\225\131\150\225\131\148 \225\131\168\225\131\148\225\131\162\225\131\148\225\131\149\225\131\144")))
            (((language ka)
              (string
               "\225\131\168\225\131\152\225\131\156\225\131\146\225\131\148\225\131\153\225\131\152 \225\131\156\225\131\157 \225\131\153\225\131\152\225\131\157\225\131\175\225\131\152\225\131\156")))
            (((language et) (string "R\195\188ndav hiiglane")))
            (((language fi) (string "Titaanien sota")))
            (((language hu) (string "Singeki no kjodzsin")))
            (((language he)
              (string
               "\215\158\215\170\215\167\215\164\215\170 \215\148\215\152\215\153\215\152\215\144\215\160\215\153\215\157")))
            (((language he)
              (string
               "\215\169\214\180\215\153\215\160\214\176\215\146\214\182\215\167\214\180\215\153 \215\160\215\149\214\185 \215\167\215\153\215\149\214\185\215\146\214\180'\215\153\215\159")))
            (((language ar)
              (string
               "\217\135\216\172\217\136\217\133 \216\167\217\132\216\185\217\133\216\167\217\132\217\130\216\169")))
            (((language ar)
              (string
               "\216\167\217\132\216\185\217\133\217\132\216\167\217\130 \216\167\217\132\217\133\217\135\216\167\216\172\217\133")))
            (((language ar)
              (string
               "\216\167\217\132\217\135\216\172\217\136\217\133 \216\185\217\132\217\137 \216\167\217\132\216\185\217\133\216\167\217\132\217\130\216\169")))
            (((language zh)
              (string
               "\232\191\155\229\135\187\231\154\132\229\183\168\228\186\186")))
            (((language zh-hk)
              (string
               "\233\128\178\230\147\138\231\154\132\229\183\168\228\186\186")))
            (((language tr) (string "Titana Sald\196\177r\196\177")))
            (((language az) (string "N\201\153h\201\153ng\201\153 h\195\188cum")))
            (((language az)
              (string "H\195\188cum ed\201\153n n\201\153h\201\153ng")))
            (((language kk)
              (string
               "\208\162\208\184\209\130\208\176\208\189\208\180\208\176\209\128\210\147\208\176 \209\136\208\176\208\177\209\131\209\139\208\187")))
            (((language kk)
              (string
               "\208\144\208\187\209\139\208\191\209\130\208\176\209\128\210\147\208\176 \209\136\208\176\208\177\209\131\209\139\208\187")))
            (((language ko)
              (string
               "\236\167\132\234\178\169\236\157\152 \234\177\176\236\157\184")))
            (((language th)
              (string
               "\224\184\156\224\185\136\224\184\178\224\184\158\224\184\180\224\184\160\224\184\158\224\185\132\224\184\151\224\184\151\224\184\177\224\184\153")))
            (((language vi)
              (string "\196\144\225\186\161i chi\225\186\191n Titan")))
            (((language ms) (string "Gergasi Penyerang")))
            (((language es) (string "Ataque a los titanes")))
            (((language ca) (string "Atac als titans")))
            (((language mn)
              (string
               "\208\148\208\190\208\178\209\130\208\190\208\187\208\179\208\190\208\190\208\189\209\139 \210\174\208\187\209\141\208\188\208\182 \208\145\208\184\208\181\209\130")))))
          (description
           (((language ar)
             (string
              "\217\133\217\134\216\176 \217\130\216\177\217\134 \217\133\217\134 \216\167\217\132\216\178\217\133\217\134 \216\184\217\135\216\177 \217\132\217\132\216\168\216\180\216\177\217\138\216\169 \216\185\216\175\217\136 \216\172\216\175\217\138\216\175 \218\170\216\167\217\134 \216\167\217\132\217\129\216\177\217\130 \216\168\217\138\217\134 \217\130\217\136\219\131 \216\167\217\132\216\168\216\180\216\177\217\138\216\169 \217\136\217\135\216\176\216\167 \216\167\217\132\216\185\216\175\217\136 \216\167\217\132\216\172\216\175\217\138\216\175 \216\180\216\167\216\179\216\185\216\167\217\139 \217\136\217\130\216\168\217\132 \216\163\217\134 \216\170\216\170\216\185\216\177\216\182 \216\167\217\132\216\168\216\180\216\177\217\138\216\169 \217\132\217\132\216\165\217\134\217\130\216\177\216\167\216\182\216\140 \217\130\216\167\217\133 \216\167\217\132\217\134\216\167\216\172\217\136\217\134 \217\133\217\134 \216\167\217\132\216\168\216\180\216\177 \216\168\216\168\217\134\216\167\216\161 \216\171\217\132\216\167\216\171\216\169 \216\172\216\175\216\177\216\167\217\134 \217\132\216\170\216\173\216\181\217\138\217\134 \216\163\217\134\217\129\216\179\217\135\217\133 \217\133\217\134 \217\135\216\176\216\167 \216\167\217\132\216\185\216\175\217\136 \" \216\172\216\175\216\167\216\177 \217\133\216\167\216\177\217\138\216\167 \216\140 \216\172\216\175\216\167\216\177 \216\177\217\136\216\178 \216\140 \216\172\216\175\216\167\216\177 \216\179\217\138\217\134\216\167 \" \217\136\217\138\216\168\217\132\216\186 \216\183\217\136\217\132 \218\170\217\132 \217\136\216\167\216\173\216\175 \217\133\217\134 \217\135\216\176\217\135 \216\167\217\132\216\172\216\175\216\177\216\167\217\134 50 \217\133\216\170\216\177\216\167\217\139\216\140 \217\136\216\185\216\167\216\180\216\170 \216\167\217\132\216\168\216\180\216\177\217\138\216\169 \216\168\216\179\217\132\216\167\217\133 \217\132\217\128 \217\133\216\175\219\131 \217\130\216\177\217\134 \217\133\217\134 \216\167\217\132\216\178\217\133\216\167\217\134 \216\168\217\129\216\182\217\132 \217\135\216\176\219\129 \216\167\217\132\216\172\216\175\216\177\216\167\217\134 \217\136\217\132\218\170\217\134 \217\135\216\176\216\167 \216\167\217\132\216\179\217\132\216\167\217\133 \217\132\217\133 \217\138\216\175\217\143\217\133 \216\183\217\136\217\138\217\132\216\167\217\139..."))
            ((language cs)
             (string
              "Kdysi d\195\161vno m\196\155lo lidstvo nam\195\161le - to kdy\197\190 zem\196\155 dun\196\155la pod kro\196\141ejemi stra\197\161liv\195\189ch lido\197\190rav\195\189ch tit\195\161n\197\175, kter\195\189m se t\195\169m\196\155\197\153 povedlo zlikvidovat lidskou populaci. Od t\195\169 doby v\197\161ak uplynulo v\195\173c jak sto let, tit\195\161ni se st\195\161hli a zbytek lid\195\173 \197\190ije ve m\196\155st\196\155 chr\195\161n\196\155n\195\169m vysokou zd\195\173. Jen\197\190e mlad\195\189 a horkokrevn\195\189 Eren Yeager nen\195\173 s \197\190ivotem v z\195\161v\196\155t\197\153\195\173 spokojen a r\195\161d by zjistil, co v\197\161echno se ve sv\196\155t\196\155 za zd\195\173 skr\195\189v\195\161. A jeho p\197\153\195\161n\195\173 se vypln\195\173... ov\197\161em t\195\173m nejhor\197\161\195\173m mo\197\190n\195\189m zp\197\175sobem."))
            ((language de)
             (string
               "Wir befinden uns 2.000 Jahre in der Zukunft... Bis zu 15 Meter gro\195\159e, menschenfressende Riesen haben fast die gesamte Menschheit augerottet. Der kl\195\164gliche Rest verschanzt sich hinter hohen Mauern. Als eines Tages ein noch viel gr\195\182\195\159erer Riese auftaucht, scheint die vor\195\188bergehende Sicherheit beendet zu sein. Der letzte Kampf beginnt...\
              \n\
              \n---\
              \nDie Erde geh\195\182rt riesigen Menschenfressern: den TITANEN! Die letzten Menschen leben zusammengepfercht in einer Festung mit 50 Meter hohen Mauern. Als ein kolossaler Titan die \195\164u\195\159ere Mauer einrei\195\159t, bricht ein letzter Kampf aus \226\128\147 um das \195\156berleben der Menschheit!"))
            ((language en)
             (string
               "Several hundred years ago, humans were nearly exterminated by Titans. Titans are typically several stories tall, seem to have no intelligence, devour human beings and, worst of all, seem to do it for pleasure rather than as a food source.\
              \nA small percentage of humanity survived by walling themselves in a city protected by extremely high walls, even taller than the biggest of Titans. Flash forward to the present and the southern district of Shinganshina has not seen a Titan in over 100 years.\
              \n\
              \nTeenage boy Eren and his foster sister Mikasa witness something horrific as one of the outer district walls is damaged by a 60 meter (196.85 feet) Titan causing a breach in the wall. As the smaller Titans flood the city, the two kids watch in horror the tragic events that follow, as the Titans devour people unimpeded.\
              \n\
              \nEren vows that he will wipe out every single Titan and take revenge for all of mankind.\
              \n\
              \n---\
              \n- **Won the Kodansha Manga Award for Shonen in 2011**\
              \n- **Won the Noma Publishing Culture Award in 2021**\
              \n\
              \n**Links:**\
              \n- Alternative Official English - [Kodansha US](https://kodansha.us/series/attack-on-titan/), [Azuki](https://www.azuki.co/series/attack-on-titan), [Manga Planet](https://mangaplanet.com/comic/618e30af823f4), [MangaPlaza](https://mangaplaza.com/title/0303001570/?content_id=103030015700001), [Coolmic](https://coolmic.me/titles/524), [K MANGA](https://kmanga.kodansha.com/title/10136/episode/312468) (U.S. Only)"))
            ((language fi)
             (string
               "Ep\195\164toivoinen taistelu alkaa! \
              \n\
              \nIhmiskunnan viimeiset rippeet piileskelev\195\164t massiivisten muurien turvaamassa kaupungissa. Kaupungin ulkopuolella v\195\164ijyv\195\164t ihmisi\195\164 sy\195\182v\195\164t arvoitukselliset titaanit. Pian turvamuurin murtaa j\195\164ttil\195\164ism\195\164inen titaani ja nuoret ihmissoturit joutuvat el\195\164m\195\164ns\195\164 haasteen eteen, kun verinen sota armotonta ja entist\195\164kin ylivoimaisempaa vihollista vastaan k\195\164ynnistyy j\195\164lleen..."))
            ((language fr)
             (string
              "Eren est un petit gar\195\167on r\195\170vant de voyager dans le monde ext\195\169rieur. Mais cela est impossible car il vit dans une ville fortifi\195\169e aux murailles d\195\169passant les cinquante m\195\168tres de haut. Ces remparts sont n\195\169cessaires \195\160 la s\195\169curit\195\169 des habitants car ils sont les derniers repr\195\169sentants de l'humanit\195\169, oblig\195\169s de se cacher pour \195\169chapper aux titans qui ont massacr\195\169 la majeure partie du genre humain un si\195\168cle plus t\195\180t. Eren est t\195\170tu: il ne se doute pas de la violence des combats qui ont oppos\195\169 les hommes aux titans. Il d\195\169cide de poster sa candidature pour devenir \195\169claireur, car il s'agit des seuls soldats autoris\195\169s \195\160 sortir de la ville pour en savoir plus sur les titans. Mais un beau jour, un g\195\169ant parvient \195\160 d\195\169truire le mur qui prot\195\169geait la ville et ouvre la voie \195\160 plusieurs dizaines de ses cong\195\169n\195\168res! Eren assiste impuissant \195\160 la mort atroce de sa m\195\168re qui finit d\195\169vor\195\169e. Alors qu'il fuit avec d'autres survivants, il se jure de se venger et de d\195\169truire la race des titans jusqu'\195\160 ce qu'il n'en reste plus un seul!!"))
            ((language hr)
             (string
               "Godina je 845., \196\141ovje\196\141anstvo je zatvoreno iza zidina, koje mu pru\197\190a jedinu za\197\161titu od divova ve\196\135 stotinu godina. Rijetko tko se usudi napustiti zidine te krenuti u ekspediciju, no oni koji imaju hrabrosti iza\196\135i, naj\196\141e\197\161\196\135e zavr\197\161e u raljama krvolo\196\141nih Divova. Preko sto godina zidine su pru\197\190ale sigurnost ljudima iza \196\141ijih bedema su se bavili svojim svakodnevnim poslovima, sve do jednoga dana... \196\140udnovato svijetlo udari\197\161e, eksplozija odjekne, digne se dim, a iz dima do\196\145e Kolosalni div visok pedeset metara koji svojom silom uni\197\161tava vratnicu zida \226\128\158Marije\226\128\156 i pu\197\161ta nemilosrdne divove da pro\197\190deru i onaj mali dio ljudstva koji je ostao na ovome svijetu.\
              \n\
              \n---\
              \nSvet se promenio. \196\140ove\196\141anstvo je gotovo istrebljeno. Mo\196\135ni titani su do\197\161li i uni\197\161tili sve predsobom. Celokupno preostalo \196\141ove\196\141anstvo sklonilo se unutar tri koncetri\196\141na kruga visokih zidina, bez ideje kako da nastavi dalje. Nakon stotinu godina od invazije titana generacije koje \197\190ive unutar zidova vi\197\161e nemaju predstavu o spolja\197\161njem svetu. Pri\196\141a se da su nekada postajala prostranstva kojima se moglo kretati. Pri\196\141a se da su postojale planine i \197\161ume ispunjene \197\190ivim svetom. Da su postojale ogromne vodene povr\197\161ine nazivane morima i okeanima. Pri\196\141a se da su postojali gradovi mnogo ve\196\135i od tog mesta na kome ljudi sada \197\190ive. Ipak, i u takvim uslovima uspostavlja se privid svakodnevnog \197\190ivota ispunjenog rutinama i pomirenost sa zato\196\141eni\197\161tvom unutar zidina. Ali titani ne nameravaju da se zaustave pred visokim zidovima. Pred nama \196\135e se odigrati epska borba. Borba za opstanak \196\141ove\196\141anstva!"))
            ((language id)
             (string
               "Dunia ini dikuasai Titan! \
              \n\
              \nOrang-orang yang menjadi mangsa para Titan membangun tembok, menukar kebebasan mereka pergi ke dunia luar, demi menghindari serangan Titan. \
              \n\
              \nTapi, ketenangan itu hilang karena datang Titan besar yang menghancurkan tembok. Lalu, dari keputusasaan itu dimulailah perang."))
            ((language it)
             (string
               "Un gigante che compare dal nulla distruggendo le mura della citt\195\160. Quel giorno, l\226\128\153umanit\195\160 ricord\195\178 il terrore di essere controllati da loro... l\226\128\153umiliazione di vivere come uccelli in gabbia. Tutto accadde 107 anni fa. L\226\128\153intero genere umano... tranne pochi\226\128\166 fu divorato dai giganti. Tutta quella gente fin\195\172 direttamente nello stomaco di quegli esseri. Fu cos\195\172 che i nostri antenati pensarono di costruire delle enormi mura che i giganti non avrebbero mai potuto oltrepassare. Riuscirono a creare un territorio al riparo dalla minaccia dei giganti, ma...tutto ci\195\178 fino a cinque anni fa. Ma ora \195\168 il nostro turno, degli esseri umani. D\226\128\153ora in avanti... saremo noi a divorare i giganti! Adesso finalmente il genere umano pu\195\178 riprendersi la propria dignit\195\160. Possiamo vincere. Per l\226\128\153umanit\195\160 \195\168 il momento... di attaccare!\
              \n\
              \n---\
              \nDiverse centinaia di anni fa, la razza umana fu quasi sterminata dai giganti. Si racconta di quanto questi fossero alti, privi di intelligenza e affamati di carne umana; peggio ancora, essi sembra divorassero umani pi\195\185 per piacere che per necessario sostentamento. Una piccola percentuale dell'umanit\195\160 per\195\178 sopravvisse asserragliandosi in una citt\195\160 circondata da mura estremamente alte, anche pi\195\185 alte del pi\195\185 grande di giganti.\
              \n\
              \n---\
              \nL\226\128\153evento manga del 2012, lo shonen d\226\128\153azione pi\195\185 emozionante e travolgente degli ultimi anni, premiato in patria con il prestigioso premio Kodansha come \226\128\156miglior manga per ragazzi\226\128\157. Un gigante che compare dal nulla distruggendo le mura della citt\195\160. Quel giorno, l\226\128\153umanit\195\160 ricord\195\178 il terrore di essere controllati da loro... l\226\128\153umiliazione di vivere come uccelli in gabbia. Tutto accadde 107 anni fa. L\226\128\153intero genere umano... tranne pochi\226\128\166 fu divorato dai giganti. Tutta quella gente fin\195\172 direttamente nello stomaco di quegli esseri. Fu cos\195\172 che i nostri antenati pensarono di costruire delle enormi mura che i giganti non avrebbero mai potuto oltrepassare. Riuscirono a creare un territorio al riparo dalla minaccia dei giganti, ma...tutto ci\195\178 fino a cinque anni fa. Ma ora \195\168 il nostro turno, degli esseri umani. D\226\128\153ora in avanti... saremo noi a divorare i giganti! Adesso finalmente il genere umano pu\195\178 riprendersi la propria dignit\195\160. Possiamo vincere. Per l\226\128\153umanit\195\160 \195\168 il momento... di attaccare!\
              \n[riassunto preso dal sito panini.it]"))
            ((language ja)
             (string
              "\230\137\139\232\182\179\227\130\146\227\130\130\227\129\140\227\130\140\227\128\129\233\164\140\227\129\168\230\136\144\227\130\138\230\158\156\227\129\166\227\130\136\227\129\134\227\129\168\227\128\129\228\186\186\233\161\158\227\129\175\229\183\168\228\186\186\227\129\171\230\140\145\227\130\128!!\227\128\128\229\183\168\228\186\186\227\129\140\227\129\153\227\129\185\227\129\166\227\130\146\230\148\175\233\133\141\227\129\153\227\130\139\228\184\150\231\149\140\227\128\130\229\183\168\228\186\186\227\129\174\233\164\140\227\129\168\229\140\150\227\129\151\227\129\159\228\186\186\233\161\158\227\129\175\229\183\168\229\164\167\227\129\170\229\163\129\227\130\146\231\175\137\227\129\141\227\128\129\229\163\129\229\164\150\227\129\184\227\129\174\232\135\170\231\148\177\227\129\168\229\188\149\227\129\141\230\143\155\227\129\136\227\129\171\228\190\181\231\149\165\227\130\146\233\152\178\227\129\132\227\129\167\227\129\132\227\129\159\227\128\130\227\129\160\227\129\140\229\144\141\227\129\176\227\129\139\227\130\138\227\129\174\229\185\179\229\146\140\227\129\175\229\163\129\227\130\146\232\182\138\227\129\136\227\130\139\229\164\167\229\183\168\228\186\186\227\129\174\229\135\186\231\143\190\227\129\171\227\130\136\227\130\138\229\180\169\227\130\140\227\128\129\231\181\182\230\156\155\227\129\174\230\136\166\227\129\132\227\129\140\229\167\139\227\129\190\227\129\163\227\129\166\227\129\151\227\129\190\227\129\134\227\128\130\226\128\149\226\128\149\233\156\135\227\129\136\227\130\139\230\137\139\227\129\167\227\128\129\227\129\157\227\130\140\227\129\167\227\130\130\227\129\130\227\129\170\227\129\159\227\129\175\227\131\154\227\131\188\227\130\184\227\130\146\230\141\178\227\130\139\227\128\130\232\182\133\229\164\167\228\189\156\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179\232\170\149\231\148\159\239\188\129\227\128\128\227\129\147\227\130\140\227\129\14021\228\184\150\231\180\128\227\129\174\231\142\139\233\129\147\229\176\145\229\185\180\230\188\171\231\148\187\227\129\160!!"))
            ((language kk)
             (string
              "\208\144\208\180\208\176\208\188\208\183\208\176\209\130 \208\176\208\187\209\139\208\191\209\130\208\176\209\128\208\180\209\139\210\163 \208\186\210\175\208\185\209\128\208\181\209\130\209\131 \208\186\210\175\209\136\209\150\208\189\209\150\210\163 \208\176\209\129\209\130\209\139\208\189\208\180\208\176 \210\155\208\176\208\187\208\180\209\139. \208\144\208\183\208\176\209\130\209\130\209\139\210\147\209\139\208\189 \210\155\210\177\209\128\208\177\208\176\208\189 \208\181\209\130\208\186\208\181\208\189 \208\176\208\180\208\176\208\188\208\183\208\176\209\130 \209\130\209\150\209\128\209\150 \210\155\208\176\208\187\210\147\208\176\208\189\208\180\208\176\209\128\208\180\209\139 \208\176\208\188\208\176\208\189 \209\129\208\176\210\155\209\130\208\176\208\191 \210\155\208\176\208\187\209\131\210\147\208\176 \210\175\208\188\209\150\209\130\209\130\208\181\208\189\209\150\208\191, \208\177\208\184\209\150\208\186 \210\155\208\176\208\177\209\139\209\128\210\147\208\176\208\187\209\139 \210\155\208\176\208\187\208\176\208\187\208\176\209\128\208\180\209\139 \208\191\208\176\208\189\208\176\208\187\208\176\208\180\209\139. \208\145\209\150\209\128\208\176\210\155 \208\177\209\150\209\128 \210\155\208\190\209\128\210\155\209\139\208\189\209\139\209\136\209\130\209\139 \208\186\210\175\208\189\209\150 \208\186\211\169\208\187\208\181\208\188\209\150 \208\182\208\176\210\147\209\139\208\189\208\176\208\189 \209\130\209\150\208\191\209\130\209\150 \210\155\208\176\208\187\208\176 \210\155\208\176\208\177\209\139\209\128\210\147\208\176\208\187\208\176\209\128\209\139\208\189\208\176\208\189 \208\180\208\176 \208\176\209\129\209\139\208\191 \209\130\210\175\209\129\208\181\209\130\209\150\208\189 \208\151\208\190\209\128\208\176\210\163 \208\144\208\187\209\139\208\191 \208\191\208\176\208\185\208\180\208\176 \208\177\208\190\208\187\208\180\209\139. \208\157\211\153\208\183\209\150\208\186 \210\175\208\188\209\150\209\130 \209\136\208\176\210\163\210\147\208\176 \208\176\208\185\208\189\208\176\208\187\209\139\208\191, \209\130\209\150\209\128\209\150 \210\155\208\176\208\187\209\131 \210\175\209\136\209\150\208\189 \208\186\210\175\209\128\208\181\209\129 \210\155\208\176\208\185\209\130\208\176\208\180\208\176\208\189 \208\177\208\176\209\129\209\130\208\176\208\187\208\180\209\139."))
            ((language pl)
             (string
              "Oto \197\155wiat niemal w ca\197\130o\197\155ci opanowany przez tytan\195\179w. \197\154wiat, w kt\195\179rym niedobitki ludzko\197\155ci schroni\197\130y si\196\153 za masywnymi murami, by nie sko\197\132czy\196\135 jako po\197\188ywienie tych pot\196\153\197\188nych, przera\197\188aj\196\133cych istot... Od tamtych wydarze\197\132 min\196\153\197\130o ponad sto lat. Przez ten czas tytani ani razu nie przypu\197\155cili ataku na mury. Jednak pewnego dnia ten pozorny pok\195\179j zostaje brutalnie przerwany. Oto bowiem wr\195\179g powr\195\179ci\197\130, a ludzko\197\155\196\135 czeka straszliwa batalia o przetrwanie..."))
            ((language ru)
             (string
               "\208\146\208\188\208\181\209\129\209\130\208\190 \208\191\209\128\208\190\208\179\209\128\208\181\209\129\209\129\208\176 \209\135\208\181\208\187\208\190\208\178\208\181\209\135\208\181\209\129\209\130\208\178\208\190 \208\190\208\186\208\176\208\183\208\176\208\187\208\190\209\129\209\140 \208\190\209\130\208\177\209\128\208\190\209\136\208\181\208\189\208\190 \208\189\208\176\208\183\208\176\208\180 \208\191\208\190\209\143\208\178\208\187\208\181\208\189\208\184\208\181\208\188 \209\128\208\176\209\129\209\139 \208\179\208\184\208\179\208\176\208\189\209\130\208\190\208\178. \208\158\208\179\209\128\208\190\208\188\208\189\209\139\208\181 \208\179\209\131\208\188\208\176\208\189\208\190\208\184\208\180\209\139 \208\189\208\181 \208\190\208\177\208\187\208\176\208\180\208\176\208\187\208\184 \208\189\208\184 \209\128\208\181\209\135\209\140\209\142, \208\189\208\184 \209\128\208\176\208\183\209\131\208\188\208\190\208\188, \208\189\208\190 \208\191\209\128\208\184 \209\141\209\130\208\190\208\188 \208\191\208\190\208\182\208\184\209\128\208\176\208\187\208\184 \208\187\209\142\208\180\208\181\208\185, \208\186\208\176\208\186 \209\135\208\184\208\191\209\129\209\139, \208\176 \208\190\208\177\209\139\209\135\208\189\208\190\208\181 \208\190\209\128\209\131\208\182\208\184\208\181 \209\131\209\128\208\190\208\178\208\189\209\143 XIX \208\178\208\181\208\186\208\176 \208\190\208\186\208\176\208\183\208\176\208\187\208\190\209\129\209\140 \208\177\208\181\209\129\209\129\208\184\208\187\209\140\208\189\208\190. \208\158\209\129\209\130\208\176\209\130\208\186\208\184 \209\128\208\190\208\180\208\176 \208\187\209\142\208\180\209\129\208\186\208\190\208\179\208\190 \209\129\208\188\208\190\208\179\208\187\208\184 \208\178\209\139\208\182\208\184\209\130\209\140 \208\187\208\184\209\136\209\140 \208\183\208\176 \209\134\208\184\208\186\208\187\208\190\208\191\208\184\209\135\208\181\209\129\208\186\208\184\208\188\208\184 \209\129\209\130\208\181\208\189\208\176\208\188\208\184, \208\186\208\190\209\130\208\190\209\128\209\139\208\181 \209\130\209\128\208\190\208\185\208\189\209\139\208\188 \208\186\208\190\208\187\209\140\209\134\208\190\208\188 \208\190\208\191\208\190\209\143\209\129\208\176\208\187\208\184 \208\191\208\190\209\129\208\187\208\181\208\180\208\189\208\184\208\181 \208\191\208\190\208\187\209\143, \208\179\208\190\209\128\208\190\208\180\208\176 \208\184 \208\180\208\181\209\128\208\181\208\178\208\189\208\184. \208\151\208\176\209\130\208\184\209\136\209\140\208\181 \208\191\209\128\208\190\208\180\208\190\208\187\208\182\208\176\208\187\208\190\209\129\209\140 \209\129\209\130\208\190 \208\187\208\181\209\130, \208\183\208\176 \209\141\209\130\208\190 \208\178\209\128\208\181\208\188\209\143 \208\187\209\142\208\180\208\184 \209\131\209\129\208\191\208\190\208\186\208\190\208\184\208\187\208\184\209\129\209\140, \208\176\209\128\208\188\208\184\209\143 \208\177\209\139\208\187\208\176 \209\129\208\190\208\186\209\128\208\176\209\137\208\181\208\189\208\176, \208\176 \208\179\208\190\209\128\208\190\208\180\209\129\208\186\208\176\209\143 \209\129\209\130\209\128\208\176\208\182\208\176 \208\191\209\128\208\181\208\178\209\128\208\176\209\130\208\184\208\187\208\176\209\129\209\140 \208\178 \208\180\208\176\209\128\208\188\208\190\208\181\208\180\208\190\208\178. \208\145\208\190\208\181\209\129\208\191\208\190\209\129\208\190\208\177\208\189\208\190\209\129\209\130\209\140 \209\129\208\190\209\133\209\128\208\176\208\189\208\184\208\187 \208\187\208\184\209\136\209\140 \208\160\208\176\208\183\208\178\208\181\208\180\208\186\208\190\209\128\208\191\209\131\209\129 \226\128\147 \208\189\208\190 \208\186\208\190\208\188\209\131 \208\189\209\131\208\182\208\189\209\139 \209\129\208\176\208\188\208\190\209\131\208\177\208\184\208\185\209\134\209\139, \209\135\209\130\208\190 \208\191\208\190\209\129\209\130\208\190\209\143\208\189\208\189\208\190 \209\128\208\184\209\129\208\186\209\131\209\142\209\130 \208\182\208\184\208\183\208\189\209\140\209\142 \208\183\208\176 \209\129\209\130\208\181\208\189\208\176\208\188\208\184, \208\186\208\190\208\179\208\180\208\176 \208\188\208\190\208\182\208\189\208\190 \209\129\208\191\208\190\208\186\208\190\208\185\208\189\208\190 \209\129\208\184\208\180\208\181\209\130\209\140 \208\183\208\176 \208\186\208\176\208\188\208\181\208\189\208\189\209\139\208\188 \208\183\208\176\208\177\208\190\209\128\208\190\208\188?  \r\
              \n\208\163\208\178\209\139, \208\178\209\129\208\181 \209\133\208\190\209\128\208\190\209\136\208\181\208\181 \208\186\208\190\208\189\209\135\208\176\208\181\209\130\209\129\209\143. \208\163\208\182\208\176\209\129\208\176\209\142\209\137\208\184\208\185 \208\186\208\190\208\187\208\190\209\129\209\129 \209\129\208\190\208\186\209\128\209\131\209\136\208\184\208\187 \208\178\208\189\208\181\209\136\208\189\209\142\209\142 \209\129\209\130\208\181\208\189\209\131 \194\171\208\156\208\176\209\128\208\184\209\143\194\187, \208\184 \208\179\208\184\208\179\208\176\208\189\209\130\209\139 \209\131\208\189\208\184\209\135\209\130\208\190\208\182\208\184\208\187\208\184 \208\190\208\180\208\184\208\189 \208\184\208\183 \208\179\208\190\209\128\208\190\208\180\208\190\208\178. \208\156\208\176\209\130\209\140 \209\142\208\189\208\190\208\179\208\190 \208\173\209\128\208\181\208\189\208\176 \208\191\208\190\208\179\208\184\208\177\208\187\208\176, \208\190\209\130\208\181\209\134 \208\191\209\128\208\190\208\191\208\176\208\187, \208\184 \208\191\208\176\209\128\208\181\208\189\209\140, \208\186\208\184\208\191\209\143\209\137\208\184\208\185 \208\182\208\176\208\182\208\180\208\190\208\185 \208\188\208\181\209\129\209\130\208\184, \208\178\208\188\208\181\209\129\209\130\208\181 \209\129 \208\191\209\128\208\184\208\181\208\188\208\189\208\190\208\185 \209\129\208\181\209\129\209\130\209\128\208\190\208\185 \208\156\208\184\208\186\208\176\209\129\208\190\208\185 \208\191\208\190\209\129\209\130\209\131\208\191\208\184\208\187 \208\178 \208\154\208\190\209\128\208\191\209\131\209\129, \209\135\209\140\208\184 \209\141\208\187\208\184\209\130\208\189\209\139\208\181 \208\177\208\190\208\185\209\134\209\139 \208\188\208\190\208\179\209\131\209\130 \208\191\208\190\208\177\208\181\208\182\208\180\208\176\209\130\209\140 \208\179\208\184\208\179\208\176\208\189\209\130\208\190\208\178 \208\190\208\180\208\184\208\189 \208\189\208\176 \208\190\208\180\208\184\208\189. \208\158\208\178\208\187\208\176\208\180\208\181\209\130\209\140 \209\129\208\184\209\129\209\130\208\181\208\188\208\190\208\185 \209\130\209\128\208\190\209\129\208\190\208\178, \208\187\208\181\208\177\208\181\208\180\208\190\208\186 \208\184 \208\179\208\176\208\183\208\190\208\178\209\139\209\133 \209\131\209\129\208\186\208\190\209\128\208\184\209\130\208\181\208\187\208\181\208\185 \208\189\208\181\208\187\208\181\208\179\208\186\208\190, \208\189\208\190 \208\187\208\184\209\136\209\140 \208\191\208\190\208\180\208\190\208\177\208\189\208\176\209\143 \209\130\208\181\209\133\208\189\208\184\208\186\208\176 \208\191\208\190\208\188\208\190\208\179\208\176\208\181\209\130 \208\180\208\181\208\187\208\176\209\130\209\140 \208\177\208\181\208\183\209\131\208\188\208\189\209\139\208\181 \208\191\209\128\209\139\208\182\208\186\208\184 \208\184 \208\191\208\190\209\128\208\176\208\182\208\176\209\130\209\140 \208\188\208\190\208\189\209\129\209\130\209\128\208\190\208\178 \208\178 \208\183\208\176\209\130\209\139\208\187\208\190\208\186 \226\128\147 \208\181\208\180\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\208\190\208\181 \209\131\209\143\208\183\208\178\208\184\208\188\208\190\208\181 \208\188\208\181\209\129\209\130\208\190. \208\163\209\135\208\184\209\130\209\140\209\129\209\143 \208\189\208\176\208\180\208\190 \208\177\209\139\209\129\209\130\209\128\208\190, \208\184\208\177\208\190 \208\184\208\180\208\181\209\130 \208\178\208\190\208\185\208\189\208\176, \208\184 \208\180\208\181\208\185\209\129\209\130\208\178\208\184\209\143 \208\178\209\128\208\176\208\179\208\176 \209\129\209\130\208\176\208\189\208\190\208\178\209\143\209\130\209\129\209\143 \208\178\209\129\208\181 \208\176\208\179\209\128\208\181\209\129\209\129\208\184\208\178\208\189\208\181\208\181 \226\128\147 \208\177\209\131\208\180\209\130\208\190 \208\183\208\176 \208\177\208\181\208\183\208\188\208\190\208\183\208\179\208\187\209\139\208\188\208\184 \208\179\208\190\209\128\208\176\208\188\208\184 \208\191\208\187\208\190\209\130\208\184 \209\129\209\130\208\190\208\184\209\130 \209\135\208\181\208\185-\209\130\208\190 \209\135\209\131\208\182\208\180\209\139\208\185 \209\128\208\176\208\183\209\131\208\188. \208\152\208\187\208\184\226\128\166 \208\189\208\181 \209\130\208\176\208\186\208\190\208\185 \209\131\208\182 \209\135\209\131\208\182\208\180\209\139\208\185? \208\173\209\128\208\181\208\189\209\131 \208\184 \208\181\208\179\208\190 \208\180\209\128\209\131\208\183\209\140\209\143\208\188 \209\129\209\128\208\181\208\180\208\184 \208\177\208\190\208\181\208\178 \208\184 \209\129\209\128\208\176\208\182\208\181\208\189\208\184\208\185 \208\191\209\128\208\181\208\180\209\129\209\130\208\190\208\184\209\130 \208\190\209\130\208\186\209\128\209\139\209\130\209\140 \208\189\208\181\208\188\208\176\208\187\208\190 \208\191\209\131\208\179\208\176\209\142\209\137\208\184\209\133 \209\130\208\176\208\185\208\189!  \r\
              \n\r\
              \n\r\
              \n---"))
            ((language tr)
             (string
              "Titanlar\196\177n her \197\159eyi kontrol etti\196\159i bir d\195\188nya. \"titan yemi\"ne d\195\182n\195\188\197\159en insan \196\177rk\196\177, dev gibi bir duvar in\197\159a edip i\197\159galden korunmay\196\177 duvar d\196\177\197\159\196\177n\196\177n \195\182zg\195\188rl\195\188\196\159\195\188ne tercih etmi\197\159tir. Ama sadece ad\196\177 \"huzur\" olan \197\159ey, duvar\196\177 a\197\159abilen dev bir titan\196\177n ortaya \195\167\196\177kmas\196\177yla parampar\195\167a olur ve umutsuz bir sava\197\159 ba\197\159lar."))
            ((language es-la)
             (string
               "\194\161Una desesperada batalla comienza!\
              \n\
              \nDurante el \195\186ltimo siglo, lo que quedaba de la humanidad se vio obligada a refugiarse en una ciudad enorme y escondida, protegida por tres inmensos muros debido al temor hacia los extra\195\177os y gigantescos humanoides conocidos como los Titanes. Poco se sabe acerca de sus or\195\173genes o por qu\195\169 est\195\161n empecinados en consumir a la humanidad, pero la repentina aparici\195\179n de un enorme Tit\195\161n est\195\161 a punto de cambiarlo todo.\
              \n\
              \n---\
              \nEste es un mundo controlado por los titanes. La humanidad, convertida en alimento de titanes, construy\195\179 paredes gigantes y pag\195\179 con su libertad el estar segura contra los ataques. Sin embargo, la aparici\195\179n del tit\195\161n colosal destruye la paz simb\195\179lica que se hab\195\173a conseguido y provoca el inicio de una guerra sin esperanza.\
              \n\
              \n---\
              \nLa raza humana, anta\195\177o due\195\177a del mundo, se enfrenta a la extinci\195\179n a manos de los titanes, gigantescos monstruos de inteligencia limitada que cazan y devoran personas por diversi\195\179n. Los supervivientes se hacinan e intentan sobrevivir en una peque\195\177a ciudad\226\128\166 pero algunos ya est\195\161n hartos: \194\161van a atacar!"))
            ((language pt-br)
             (string
               "O mundo foi dominado por Tit\195\163s, criaturas gigantescas devoradoras de humanos! Os poucos sobreviventes viram sua civiliza\195\167\195\163o reduzida a um territ\195\179rio protegido por muralhas, que foram capazes de manter a amea\195\167a afastada por mais de cem anos. Mas tanto tempo de tranquilidade est\195\161 prestes a ruir, com o ataque de um tit\195\163 mais alto e poderoso do que a enorme muralha!\
              \n\
              \n---\
              \nH\195\161 muito tempo atr\195\161s, os humanos foram quase exterminados pelos Tit\195\163s. Seres humanoides gigantes que devoram as pessoas sem nenhum motivo aparente. Os poucos sobreviventes fugiram, levantaram muralhas de 50 metros para se protegerem desses seres e tentarem viver em paz\226\128\166 Por\195\169m, 100 anos depois, a humanidade come\195\167a a pagar por seus anos de paz: um tit\195\163 colossal aparece, destruindo a muralha e dando in\195\173cio a um cen\195\161rio de carnificina e destrui\195\167\195\163o. \195\137 nesse momento em que as vidas de Eren, Mikasa e Armin ser\195\163o mudadas para sempre. E assim come\195\167a uma batalha \195\169pica entre a ra\195\167a humana e esses seres. A busca pela sobreviv\195\170ncia e o desejo de liberdade s\195\163o o que movem a humanidade.\
              \n\
              \n---\
              \nA hist\195\179ria do mang\195\161 aborda um mundo em que a humanidade vive em cidades protegidas por muros de 50 metros de altura para se defender das invas\195\181es externas dos temidos Tit\195\163s, criaturas gigantes com formato humano e que se alimentam apenas de seres humanos. Conforme a hist\195\179ria avan\195\167a, atrav\195\169s dos 26 volumes j\195\161 publicados atualmente, descobrem-se muitas verdades inquietantes sobre politicas e governos para o nascimento e desenvolvimento dos temidos Tit\195\163s.\
              \n\
              \nA edi\195\167\195\163o portuguesa de \"Ataque dos Tit\195\163s\" traz um b\195\179nus: uma entrevista nunca antes publicada em portugu\195\170s, com o autor Isayama. S\195\163o tr\195\170s p\195\161ginas em que ele responde \195\160s perguntas dos f\195\163s japoneses. Al\195\169m disso, tem tamb\195\169m um desenho feito por ele em que mostra o ambiente de trabalho em que \"Ataque dos Tit\195\163s\" foi criado."))
            ((language zh-hk)
             (string
              "\228\184\128\229\128\139\231\148\177\229\183\168\228\186\186\230\137\128\230\142\140\230\142\167\231\154\132\228\184\150\231\149\140\227\128\130\230\136\144\231\130\186\229\183\168\228\186\186\233\163\159\231\137\169\231\154\132\228\186\186\233\161\158\231\175\137\232\181\183\228\186\134\229\183\168\229\164\167\233\171\152\232\129\179\231\154\132\229\159\142\231\137\134\239\188\140\231\138\167\231\137\178\233\128\154\229\190\128\231\137\134\229\164\150\231\154\132\232\135\170\231\148\177\239\188\140\230\143\155\228\190\134\233\152\178\230\173\162\229\176\141\230\150\185\231\154\132\228\190\181\231\149\165\227\128\130\228\189\134\230\152\175\232\153\155\230\156\137\229\133\182\232\161\168\231\154\132\229\146\140\229\185\179\229\141\187\229\156\168\232\182\179\228\187\165\232\183\168\232\182\138\229\159\142\231\137\134\231\154\132\229\164\167\229\183\168\228\186\186\229\135\186\231\143\190\228\185\139\228\184\139\231\147\166\232\167\163\239\188\140\228\184\128\229\160\180\231\181\149\230\156\155\231\154\132\230\136\176\231\136\173\229\176\177\230\173\164\233\150\139\229\167\139\227\128\130"))))
          (is_locked false)
          (links
           (((provider al) (link 53390)) ((provider ap) (link attack-on-titan))
            ((provider bw) (link series/4214)) ((provider kt) (link 14916))
            ((provider mu) (link 47446))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B07C5ZN36D))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-1599854))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/121579/))
            ((provider mal) (link 23390))
            ((provider raw)
             (link
              https://pocket.shonenmagazine.com/episode/10834108156635088814))
            ((provider engtl)
             (link
              https://comics.inkr.com/title/409-attack-on-titan?utm_source=mgd))))
          (original_language ja) (last_volume (34)) (last_chapter (139))
          (publication_demographic (shounen)) (status completed) (year (2009))
          (content_rating safe)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 9467335a-1b83-4497-9231-765337a00b96)
             (attributes
              ((name (((language en) (string Post-Apocalyptic)))) (group theme)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdad7e68-1419-41dd-bdce-27753074a640)
             (attributes
              ((name (((language en) (string Horror)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-01-26T21:42:42+00:00)
          (updated_at 2024-05-26T17:15:28+00:00) (version 132)
          (available_translated_languages
           (pt-br ru hu es-la en pl es uk ar zh-hk kk it tr id fr))
          (latest_uploaded_chapter eef732ff-c85a-4537-91cf-946ab67a3c2e)))
        (relationships
         (((id 31e059c9-6040-4765-b7bd-40a16d657a94) (type_ author))
          ((id 31e059c9-6040-4765-b7bd-40a16d657a94) (type_ artist))
          ((id 2b888ee6-eb25-4f48-86b0-f4fe898ab234) (type_ cover_art))
          ((id 048eed21-5e52-4936-9064-2331ab830965) (type_ manga))
          ((id 0574b968-63da-467a-a41e-31a666817dca) (type_ manga))
          ((id 06539daf-e44b-4a06-9793-dc9f6ba8dd55) (type_ manga))
          ((id 0a4a9f8e-03f2-4ccd-8fbb-e87913d67f0e) (type_ manga))
          ((id 0ac05896-01de-4a65-8418-fcaadc91c705) (type_ manga))
          ((id 0c7cdcfd-69db-4b16-8a85-5a8bd7b02dce) (type_ manga))
          ((id 14839ae8-9d2f-4fc4-a18d-54a424a67d9d) (type_ manga))
          ((id 182260eb-2052-4785-a001-9720cef8fd69) (type_ manga))
          ((id 1cbc2b0d-bfdf-48ff-a7d9-b246b4cdae0f) (type_ manga))
          ((id 2392c16f-ce2a-4680-8b08-4244899c6e1e) (type_ manga))
          ((id 2a05af10-4156-40f1-865e-10dae6a913bc) (type_ manga))
          ((id 30954fc3-c206-4978-baac-782d86f4692f) (type_ manga))
          ((id 3608547d-6ade-4366-892e-47f1c07c2828) (type_ manga))
          ((id 36614dc8-52f3-404f-b2d5-63957524ffec) (type_ manga))
          ((id 390ad2fb-3709-45d4-957b-dba89427ff6f) (type_ manga))
          ((id 3a224dc2-e250-4b71-9a2a-551fb46f492a) (type_ manga))
          ((id 3de7d8ae-6411-4d3f-8181-d2baefe04516) (type_ manga))
          ((id 405f6956-164e-4722-9f6e-035a379e84f9) (type_ manga))
          ((id 4073743f-bbbb-40da-a52c-acaca6911ab7) (type_ manga))
          ((id 429cf82b-b56b-4a22-a0ed-9d9ea08cae51) (type_ manga))
          ((id 4a4eb4dd-14d4-4dde-93a8-da8bd8c1e51b) (type_ manga))
          ((id 501e36d5-8f2c-4a72-b61a-24066f1cea12) (type_ manga))
          ((id 51e31bd3-958d-4550-8cd5-b82d1f23d9c9) (type_ manga))
          ((id 5201f7c3-e3d8-40ab-a786-1d7904cda76c) (type_ manga))
          ((id 5293d436-6c68-49c2-9733-23b30fcbe4de) (type_ manga))
          ((id 54d2f0bc-0a37-4653-8d1a-6edd8c112324) (type_ manga))
          ((id 592e44d9-20dd-4a45-99a9-65609b4a6b33) (type_ manga))
          ((id 59b5d199-10b8-4cd3-8404-6b8437706267) (type_ manga))
          ((id 5b8958fc-9f7e-4fea-90fa-71facc73a8c6) (type_ manga))
          ((id 5c7fe209-d20b-47e1-8d55-45cc7c2145a6) (type_ manga))
          ((id 5d88ad91-a32e-461d-9da6-3df955359565) (type_ manga))
          ((id 5dc8d212-eda7-47ea-a1ab-8ff420ffa6d0) (type_ manga))
          ((id 60fe655f-2180-4017-a036-d46ec7a8500e) (type_ manga))
          ((id 660f5e5b-0b85-4cd8-908f-fee25332ebd9) (type_ manga))
          ((id 67239eca-d524-4c5c-b6e6-3f7c0a48f118) (type_ manga))
          ((id 6a27d855-7970-4eef-a1fd-11f27a604021) (type_ manga))
          ((id 6f3d704e-ad28-4fde-acd3-c36b07b29353) (type_ manga))
          ((id 738cb558-fe34-44e3-b77d-7ffe02ba1635) (type_ manga))
          ((id 74f49a72-3d81-4760-a9ac-6c4cbae03277) (type_ manga))
          ((id 765a5792-39a2-44c7-aec0-6fa9954dead6) (type_ manga))
          ((id 79c35c57-3846-4c69-8c6d-a2116579927b) (type_ manga))
          ((id 7e205249-2d25-4c3a-adf5-1c8cc7146688) (type_ manga))
          ((id 81a391d4-15b0-42b0-9ffb-e40752ffebb8) (type_ manga))
          ((id 823874e4-2d4a-4ce1-8d71-5953105c6741) (type_ manga))
          ((id 84aecfbd-e5aa-40a5-ae28-8ef49ea6e43f) (type_ manga))
          ((id 893e6c02-79d2-4661-9200-d5fe558a1b28) (type_ manga))
          ((id 8e4e6280-b568-4de1-aa89-ca64a2d66670) (type_ manga))
          ((id 918763f4-0e7a-4a3b-9b02-83e043419022) (type_ manga))
          ((id 93eec60f-0232-4fd6-accf-cea698345c22) (type_ manga))
          ((id 9431666a-2d56-4d86-bb24-6fec7f516bd3) (type_ manga))
          ((id 959fed74-b49b-44e1-8ae2-f12a6eb60ba2) (type_ manga))
          ((id 986a29e6-391c-4a9d-9b40-1b9c0d088f45) (type_ manga))
          ((id 9889a324-87a8-4ed4-b404-daadf2851519) (type_ manga))
          ((id 994878e3-5b07-4dc7-a5cc-bdb452847c71) (type_ manga))
          ((id 9e4a9453-2124-44c1-a11d-42d56e60d979) (type_ manga))
          ((id a3e57507-60b3-4bb4-9e37-0336d5e47100) (type_ manga))
          ((id a594c62d-8b55-4dc3-b8c5-f75ec32b04dc) (type_ manga))
          ((id ad7069df-9fa1-4e2d-9dcc-76cc723f299f) (type_ manga))
          ((id af912262-b277-4d09-9dfb-b52c266ea366) (type_ manga))
          ((id b10dd436-9da1-4f5b-9145-1d07a4e92f7d) (type_ manga))
          ((id b469af69-cc5c-4a61-806f-cd90e2418c1f) (type_ manga))
          ((id b6c39018-50ff-4838-8a24-6413c519fab8) (type_ manga))
          ((id ba176c91-fe44-49c8-84da-6b99647880ee) (type_ manga))
          ((id d2606f91-32c8-4b95-adfa-f0aac8b9aee7) (type_ manga))
          ((id d2d27f4f-dfab-47fa-90e6-66085c7ec28b) (type_ manga))
          ((id d3321be9-2156-441a-8bc8-74dd6e6785dd) (type_ manga))
          ((id d404f1f0-108a-40e8-ac83-d22c651e57b4) (type_ manga))
          ((id d5a3d9cb-b1ad-4ba1-9a92-a7569cb600f2) (type_ manga))
          ((id d90d56af-aeee-49f1-880d-ed5ab1ba9d94) (type_ manga))
          ((id da23612c-7855-42ef-ba9e-32635ad36dd1) (type_ manga))
          ((id e0bb39f8-642d-482d-9fa1-d504a2dc3079) (type_ manga))
          ((id e369b04a-3472-4c4b-8a75-005adeed41d1) (type_ manga))
          ((id e87a635d-8a0d-4bfb-bd8d-9d77d9a536e8) (type_ manga))
          ((id ee8435ff-2a24-4a3d-ab60-3f87722c16eb) (type_ manga))
          ((id f0c8818c-bf3b-4f44-a781-c664c69d69c8) (type_ manga))
          ((id f12db541-06f3-46bd-bb05-170fd8810535) (type_ manga))
          ((id f1c0267f-1812-4dd7-988b-da46a43ffce6) (type_ manga))
          ((id f294ae95-221b-4372-bff1-ebf5ad9d0029) (type_ manga))
          ((id f575087f-7c2f-4886-b64a-7065d838564a) (type_ manga))
          ((id f6b3e586-aa08-43c8-9294-4cd4d53af522) (type_ manga))
          ((id feaa2c8b-0232-4ec1-8c7d-90f4d2b68b88) (type_ manga)))))
       ((id 8a6bc1ad-c02d-4643-b7d8-d316ae5d4561)
        (attributes
         ((title (((language en) (string Seventh))))
          (alt_titles
           ((((language ja)
              (string "\227\130\187\227\131\150\227\131\179\227\130\185")))
            (((language en) (string 7th)))))
          (description
           (((language en)
             (string
               "Lyle Walt is a young noble boy and heir looking forward to the day he can inherit his family\226\128\153s territory. Except around when he was 10 year old, his parents started neglecting him more and more in favour of his little sister, Ceres.\
              \n\
              \nOn his fifteenth birthday, he is challenged to a duel by his sister to see who will inherit the household and horribly loses, being cast out of his family. Afterwards, he gets treated by the family groundskeepers and receives the family heirloom Gem from him that Lyle\226\128\153s grandfather had entrusted to him. From there, he begins an aimless journey with his childhood friend and former fianc\195\169e, Novem, and the Gem-turned-Jewel that houses the memories, personalities, and Skills of seven of his ancestors."))))
          (is_locked false)
          (links
           (((provider mu) (link z3u5qzu)) ((provider nu) (link sevens-ln))
            ((provider mal) (link 170671))
            ((provider raw)
             (link
              https://comic-walker.com/detail/KC_005568_S/episodes/KC_0055680000200011_E?episodeType=first))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-05-29T16:52:21+00:00)
          (updated_at 2024-06-19T15:12:31+00:00) (version 5)
          (available_translated_languages (en))
          (latest_uploaded_chapter 52caba64-1537-41c6-9172-4bdce4166b01)))
        (relationships
         (((id 5a37f84f-9cb9-46bc-bd16-eddb4bec5264) (type_ author))
          ((id c2aaa0d6-cc6a-4b82-88cf-2eb87e1bfc05) (type_ artist))
          ((id 4124231b-5149-457f-89c0-bb8fdda10cad) (type_ cover_art))
          ((id 6d0ca397-136d-4448-ae5d-895c2c504472) (type_ creator)))))
       ((id bcf2a791-c789-483a-91b1-12b09d2b38d7)
        (attributes
         ((title (((language en) (string "Inochi no Tabekata"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\132\227\129\174\227\129\161\227\129\174\233\163\159\227\129\185\230\150\185")))
            (((language ja-ro) (string "Inochi no Tabekata")))
            (((language en) (string "How to Eat Life")))
            (((language pt-br) (string "Como Comer a Vida")))))
          (description
           (((language en)
             (string
               "Otogiri Tobi, a 2nd grade middle school student, spends his depressing days searching for his missing older brother alongside his inhuman companion, Baku.\
              \nTobi used to rarely speak to anyone besides Baku, however one day after his classmate Shiratama Ryuuko suddenly approaches him, his life begins to change\226\128\166?\
              \n\
              \nThis is an adventure surrounding the \226\128\156human\226\128\157 and the \226\128\156inhuman\226\128\157 that a lone boy faces.\
              \n___\
              \n**Character Design:** [Mariyasu](https://mangadex.org/author/c4b0336b-a879-4634-9053-9efb11c3f71b), [Waboku](https://mangadex.org/author/03dcd51c-8a6b-4302-8c84-d943a039db25), [lack](https://mangadex.org/author/b68dc199-aaab-4deb-825a-5f3df6482b28)\
              \n___\
              \nNote: Adapted from the song and novel of the same name."))))
          (is_locked false)
          (links
           (((provider al) (link 171127))
            ((provider ap) (link inochi-no-tabekata))
            ((provider bw) (link series/462100))
            ((provider kt) (link inochi-no-tabekata-manga))
            ((provider mu) (link a9gn3yx))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0CW1B8QSM))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/819804/))
            ((provider mal) (link 163625))
            ((provider raw)
             (link https://comic-walker.com/detail/KC_001766_S?episodeType=first))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (josei)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-09-14T10:45:56+00:00)
          (updated_at 2024-07-17T05:59:21+00:00) (version 21)
          (available_translated_languages (pt-br fr en it))
          (latest_uploaded_chapter 751582b6-10df-4ada-bbde-831372947082)))
        (relationships
         (((id 16f7720b-72ff-447f-9d1e-a47dfcd691bd) (type_ author))
          ((id 173eca5d-f302-425e-8e3b-2b156cb3fc31) (type_ author))
          ((id 9836743b-8810-4f2b-bf46-f1f23a55960c) (type_ artist))
          ((id 82755db7-978e-4739-b42c-89dad90c51a6) (type_ cover_art))
          ((id 714405b4-2963-4930-b4cc-a8bea590d30e) (type_ manga))
          ((id dbd208cd-31fd-4c68-a377-d2bfec53ea8b) (type_ manga))
          ((id b96a3adf-8d98-4991-89ad-aca4dead9cee) (type_ creator)))))
       ((id 35afa4a9-0128-4e15-9801-c34d9e1b9f9a)
        (attributes
         ((title (((language en) (string "Kimi no Tame no Curtain Call"))))
          (alt_titles
           ((((language en) (string "A Curtain Call for You")))
            (((language ja)
              (string
               "\229\144\155\227\129\174\227\129\159\227\130\129\227\129\174\227\130\171\227\131\188\227\131\134\227\131\179\227\130\179\227\131\188\227\131\171")))))
          (description
           (((language en)
             (string
               "Akutsu Sakura, a wallflower with no self-esteem to speak of, and Hiiragi Tsubame, a girl brimming with confidence and dignity. The meeting between these two polar opposites marks the start of their adolescence. \
              \n\
              \nA high school drama exploring fa\195\167ades and what lie beneath them, and the difference between imitations and the real thing."))))
          (is_locked false)
          (links
           (((provider al) (link 161653))
            ((provider ap) (link kimi-no-tame-no-curtain-call))
            ((provider bw) (link series/458611/list))
            ((provider kt) (link kimi-no-tame-no-curtain-call))
            ((provider mu) (link ymm8wf7))
            ((provider amz)
             (link
              "https://www.amazon.co.jp/\229\144\155\227\129\174\227\129\159\227\130\129\227\129\174\227\130\171\227\131\188\227\131\134\227\131\179\227\130\179\227\131\188\227\131\171-1-HOWL\227\130\179\227\131\159\227\131\131\227\130\175\227\130\185-\227\129\149\227\129\168\227\129\134-\227\129\151\227\129\187-ebook/dp/B0CVN549F8/ref=sr_1_1?__mk_ja_JP=\227\130\171\227\130\191\227\130\171\227\131\138&dib=eyJ2IjoiMSJ9.fRb60WErs8gjOFExI6vXENgh47UdgppLgI5IIb6pHPW-bGakYikH8UxX3SX1XOfUL1EgnWldZEcXdej0iY0NuxVz-QmRg4tQ3B1WaZMm44SixFkjwFX3UHTKrVQRGvn6Kb7tRZZj_0fJP8t4NAPwLYXM-xVK8YCfsmVjayCu_mqypCIOUFC8npAN4zfPJ-UpfO4sCSO96INrZvB39L4nDw.8j12aCMOVJT7nICXGe29ZEYmMTi-PJW4cVXxM_qwhYI&dib_tag=se&keywords=\229\144\155\227\129\174\227\129\159\227\130\129\227\129\174\227\130\171\227\131\188\227\131\134\227\131\179\227\130\179\227\131\188\227\131\171&qid=1717961336&s=books&sr=1-1"))
            ((provider cdj)
             (link
              "https://www.cdjapan.co.jp/searchuni?q=\229\144\155\227\129\174\227\129\159\227\130\129\227\129\174\227\130\171\227\131\188\227\131\134\227\131\179\227\130\179\227\131\188\227\131\171"))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/812876/))
            ((provider mal) (link 171148))
            ((provider raw)
             (link https://ichijin-plus.com/comics/83559050019089))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-08-08T01:49:05+00:00)
          (updated_at 2024-06-19T22:59:35+00:00) (version 7)
          (available_translated_languages (en))
          (latest_uploaded_chapter 015c0542-2b33-4b36-ab58-bea450c684a7)))
        (relationships
         (((id 8779c21e-df67-4c30-b495-cd36441d3695) (type_ author))
          ((id 8566319d-b856-4774-8d26-c53a7a49cab6) (type_ artist))
          ((id 0529ad65-4c1b-4ff0-9f36-03dddfed5a48) (type_ cover_art))
          ((id 5ff2c8b3-b215-4c87-be32-d396f67d34ba) (type_ creator)))))
       ((id 2051ec2f-1b26-465e-acb5-5870ca535ba9)
        (attributes
         ((title (((language en) (string "Cigarette and Cherry"))))
          (alt_titles
           ((((language es) (string "Cigarrillo y Cereza")))
            (((language ja-ro) (string "Shigaretto & Cher\196\171")))
            (((language ja)
              (string
               "\227\130\183\227\130\172\227\131\172\227\131\131\227\131\136\239\188\134\227\131\129\227\130\167\227\131\170\227\131\188")))
            (((language ne)
              (string
               "\224\164\154\224\165\129\224\164\176\224\165\139\224\164\159 \224\164\176 \224\164\154\224\165\135\224\164\176\224\165\128")))
            (((language ru)
              (string
               "\208\161\208\184\208\179\208\176\209\128\208\181\209\130\209\139 \208\184 \208\178\208\184\209\136\208\189\209\143")))
            (((language zh-hk)
              (string
               "\233\166\153\231\133\153\232\136\135\230\171\187\230\161\131")))))
          (description
           (((language en)
             (string
              "An attractive smoking woman and a virgin boy crossing their paths during his campus days"))
            ((language es)
             (string
              "Una mujer hermosa y un joven virgen entrelaz\195\161ndose juntos en sus d\195\173as de universidad\226\128\166"))
            ((language id)
             (string
              "Menceritakan kisah senpai cantik serta cool dengan kouhainya yang masih perjaka. Kisah romance komedi yang sangat bagus."))
            ((language ru)
             (string
              "\208\159\208\190\209\129\208\187\208\181 \209\129\209\130\208\176\209\128\209\136\208\181\208\185 \209\136\208\186\208\190\208\187\209\139 \208\154\208\190\209\133\208\176\208\185 \208\191\208\190\209\129\209\130\209\131\208\191\208\176\208\181\209\130 \208\178 \209\131\208\189\208\184\208\178\208\181\209\128\209\129\208\184\209\130\208\181\209\130, \208\179\208\180\208\181 \208\191\208\187\208\176\208\189\208\184\209\128\209\131\208\181\209\130 \208\189\208\176\209\135\208\176\209\130\209\140 \208\178\209\129\209\130\209\128\208\181\209\135\208\176\209\130\209\140\209\129\209\143 \209\129 \208\180\208\181\208\178\209\131\209\136\208\186\208\190\208\185. \208\151\208\176\208\185\208\180\209\143 \208\178 \208\186\208\176\208\188\208\191\209\131\209\129 \208\190\208\189 \208\183\208\176\208\188\208\181\209\135\208\176\208\181\209\130 \209\130\208\181\208\188\208\189\208\190\208\178\208\190\208\187\208\190\209\129\209\131\209\142 \208\180\208\181\208\178\209\131\209\136\208\186\209\131 \208\184 \208\191\208\190\208\180\209\133\208\190\208\180\208\184\209\130 \208\186 \208\189\208\181\208\185 \209\129 \208\191\208\176\209\135\208\186\208\190\208\185 \209\129\208\184\208\179\208\176\209\128\208\181\209\130, \208\182\208\181\208\187\208\176\209\143 \208\191\209\128\208\184\208\178\208\187\208\181\209\135\209\140 \208\181\209\145 \208\178\208\189\208\184\208\188\208\176\208\189\208\184\208\181. \208\157\208\181\209\129\208\188\208\190\209\130\209\128\209\143 \208\189\208\176 \209\130\208\190, \209\135\209\130\208\190 \208\154\208\190\209\133\208\176\208\185 \209\130\208\181\209\128\208\191\208\184\209\130 \208\189\208\181\209\131\208\180\208\176\209\135\209\131, \208\190\208\189 \209\129\208\190\208\177\208\184\209\128\208\176\208\181\209\130\209\129\209\143 \208\184\208\180\209\130\208\184 \208\180\208\190 \208\186\208\190\208\189\209\134\208\176 \208\184 \208\180\208\190\208\177\208\184\209\130\209\140\209\129\209\143 \208\181\209\145 \209\129\208\181\209\128\208\180\209\134\208\176."))
            ((language pt-br)
             (string
              "Uma mulher atraente fumante, e um rapaz virgem cruzam seus caminhos durante seus dias no campus."))))
          (is_locked false)
          (links
           (((provider al) (link 102215)) ((provider ap) (link cigarette-cherry))
            ((provider bw) (link series/154178/list))
            ((provider kt) (link 40777)) ((provider mu) (link 147391))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B07DYGYBGV))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2386423))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/448611))
            ((provider mal) (link 112347))
            ((provider raw) (link http://chancro.jp/comics/cigacherry))))
          (original_language ja) (last_volume (11)) (last_chapter (124))
          (publication_demographic (shounen)) (status completed) (year (2017))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-03-12T10:51:36+00:00)
          (updated_at 2024-07-25T00:22:36+00:00) (version 30)
          (available_translated_languages (ru en pt-br es-la))
          (latest_uploaded_chapter 5f513a54-46af-4017-aac1-1a777b0bb1da)))
        (relationships
         (((id a65240dd-d451-4e2f-94c5-0eb10fe34cb7) (type_ author))
          ((id a65240dd-d451-4e2f-94c5-0eb10fe34cb7) (type_ artist))
          ((id f94925f6-5e8c-4f79-93d1-aadbc2dca679) (type_ cover_art))
          ((id 9cf93bee-c337-44e7-8a45-f3558d8aa341) (type_ manga)))))
       ((id 7e8b5c00-df2b-4f5f-9211-89f723617ad5)
        (attributes
         ((title (((language en) (string "Android Kikaider"))))
          (alt_titles
           ((((language en) (string "Humanoid Kikaider")))
            (((language ja-ro) (string "Jinzou Ningen Kikaider")))
            (((language en) (string "Kikaider: Android of Justice")))
            (((language ru)
              (string
               "\208\152\209\129\208\186\209\131\209\129\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\185 \208\179\209\131\208\188\208\176\208\189\208\190\208\184\208\180 \208\154\208\184\208\186\208\176\208\185\208\180\208\181\209\128")))
            (((language th)
              (string
               "\224\184\161\224\184\153\224\184\184\224\184\169\224\184\162\224\185\140\224\184\136\224\184\177\224\184\129\224\184\163\224\184\129\224\184\165\224\184\132\224\184\180\224\185\132\224\184\132\224\185\128\224\184\148\224\184\173\224\184\163\224\185\140")))
            (((language ja)
              (string
               "\228\186\186\233\128\160\228\186\186\233\150\147\227\130\173\227\130\171\227\130\164\227\131\128\227\131\188")))
            (((language zh)
              (string "\231\148\181\232\132\145\229\165\135\228\190\160")))
            (((language zh-hk)
              (string "\233\155\187\232\133\166\229\165\135\228\191\160")))
            (((language ko)
              (string
               "\236\157\184\236\161\176\236\157\184\234\176\132 \237\130\164\236\185\180\236\157\180\235\139\164 \236\157\188\235\179\184")))))
          (description
           (((language en)
             (string
               "(from ebookjapan):\
              \n\
              \nThe man with the bright red guitar on his back is a machine...? \
              \n\
              \nDr. Komyoji, an authority on robotics, developed the artificial human \"Jiro\" in memory of his late son. He was equipped with a special \"conscience circuit (Geminy)\"! However, due to a plot by a wealthy professor Gil, who was also a supporter of his research, the laboratory explodes and Dr. Hikaruji goes missing. \
              \n\
              \nWhen the father sends a message to his daughter, Mitsuko, asking her to find \"Jiro,\" who has disappeared with the circuits incomplete, what will happen to her? \
              \n\
              \nHere comes the Ishinomori hero, struggling with the meaning of his own existence!\
              \n\
              \n---\
              \n\
              \nLinks to ANN:  \
              \n**Live Action - Tokusatsu**  \
              \n[Live Action](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=2963)  \
              \n[Live Action (sequel)](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=2965)  \
              \n[Live Action (spinoff)](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=3957)  \
              \n[Live Action Movie](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=9751)  \
              \n\
              \n**Anime**  \
              \n[Anime](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=964)  \
              \n[OAV (sequel)](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=494)  \
              \n[Kikaider vs. Inazuman (OAV)](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=2659)  \
              \n\
              \n**Manga**  \
              \n[Manga](https://www.animenewsnetwork.com/encyclopedia/manga.php?id=19212)  \
              \n[Manga (remake)](https://www.animenewsnetwork.com/encyclopedia/manga.php?id=5660)  \
              \n[Manga (alternate ending)](https://www.animenewsnetwork.com/encyclopedia/manga.php?id=19211)"))))
          (is_locked false)
          (links
           (((provider al) (link 34750)) ((provider ap) (link kikaider))
            ((provider bw) (link series/15555/list)) ((provider kt) (link 10165))
            ((provider mu) (link 49131))
            ((provider amz)
             (link
              https://www.amazon.co.jp/dp/B075GTCR8M?searchxofy=true&binding=kindle_edition&ref_=dbs_s_aps_series_rwt_tkin&qid=1661124049&sr=8-2))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-1639993))
            ((provider ebj)
             (link https://ebookjapan.yahoo.co.jp/books/232544/A000251714/))
            ((provider mal) (link 4750))))
          (original_language ja) (last_volume (5)) (last_chapter (15))
          (publication_demographic (shounen)) (status completed) (year (1972))
          (content_rating safe)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 50880a9d-5440-4732-9afb-8f457127e836)
             (attributes
              ((name (((language en) (string Mecha)))) (group genre) (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f42fbf9e-188a-447b-9fdc-f19dc1e4d685)
             (attributes
              ((name (((language en) (string Music)))) (group theme) (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-03-26T08:49:13+00:00)
          (updated_at 2023-02-13T02:15:29+00:00) (version 10)
          (available_translated_languages (en pt-br))
          (latest_uploaded_chapter c73ea51b-3d18-42d7-8a56-686f41bd6c99)))
        (relationships
         (((id 36f5f595-0196-4d0a-aae1-0f730679d10a) (type_ author))
          ((id 36f5f595-0196-4d0a-aae1-0f730679d10a) (type_ artist))
          ((id c45db6cc-3060-4da7-85ff-b7b859ca3668) (type_ cover_art))
          ((id 06d82983-3f93-4877-bacd-272e76d1aa10) (type_ manga))
          ((id 0c73f551-87d8-4d7b-8b67-b687cb235a32) (type_ manga))
          ((id 1dcd5911-80a5-4a65-9c72-0600ba5f0212) (type_ manga))
          ((id 27bccf94-11b0-4cd6-8c77-735020972c23) (type_ manga))
          ((id 3087be27-f733-4053-8d59-e35264be1e49) (type_ manga))
          ((id 4d2903d6-a661-42cf-9c3a-4efd6bf97193) (type_ manga))
          ((id 5cdd0b17-b220-4834-bb53-1b37132b324f) (type_ manga))
          ((id 8a5bcfd3-c8bc-466d-b7da-b76cc8c70d59) (type_ manga))
          ((id de62d75d-73e2-4db9-ab32-69006396e5ba) (type_ manga))
          ((id f53f9dd3-9425-45d3-b5f9-2e2c99f94440) (type_ manga)))))
       ((id 32f887f1-824f-4dbc-8e15-70a5b0b8112a)
        (attributes
         ((title (((language en) (string "My Dearest Nemesis"))))
          (alt_titles
           ((((language zh)
              (string
               "\228\186\178\231\136\177\231\154\132\230\173\187\229\175\185\229\164\180")))
            (((language en) (string "My Dear Enemy")))
            (((language zh-ro)
              (string "Q\196\171n'\195\160i De S\199\144du\195\172t\195\179u")))
            (((language ru)
              (string
               "\208\156\208\190\208\185 \208\180\208\190\209\128\208\190\208\179\208\190\208\185 \208\178\209\128\208\176\208\179")))))
          (description
           (((language en)
             (string
              "The whole company knew that they they were polar opposites who fought like cats and dogs. Yet during the year-end party, the wall between them shattered after they got drunk! And so the two of them went from always being close to going off on each other to feeling very strange things following the accidental mishap..."))))
          (is_locked false)
          (links
           (((provider al) (link 162236)) ((provider ap) (link my-dear-enemy))
            ((provider mu) (link 36cbcp3))
            ((provider raw) (link https://www.kuaikanmanhua.com/web/topic/17650))))
          (original_language zh) (last_volume ("")) (last_chapter (42))
          (publication_demographic ()) (status completed) (year (2023))
          (content_rating suggestive)
          (tags
           (((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 92d6d951-ca5e-429c-ac78-451071cbf064)
             (attributes
              ((name (((language en) (string "Office Workers")))) (group theme)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-02-25T05:03:17+00:00)
          (updated_at 2024-07-28T21:37:51+00:00) (version 19)
          (available_translated_languages (en))
          (latest_uploaded_chapter 27095c4e-f2c4-49c8-bbd4-1c83b4c706ea)))
        (relationships
         (((id ac65c24e-3ec1-412f-9d43-0266e7e8f29b) (type_ author))
          ((id ac65c24e-3ec1-412f-9d43-0266e7e8f29b) (type_ artist))
          ((id 275f9cf7-3fce-4fb8-8815-06dc9ad8d3ba) (type_ cover_art))
          ((id cba75930-22b0-4279-9424-3ed9f0aaa96f) (type_ creator)))))
       ((id 557615b9-6fec-4ab7-a512-03cbde39815f)
        (attributes
         ((title (((language en) (string "Chika Idol wo Kage de Sasaeru Ore"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\156\176\228\184\139\227\130\162\227\130\164\227\131\137\227\131\171\227\130\146\229\189\177\227\129\167\230\148\175\227\129\136\227\130\139\228\191\186")))
            (((language en) (string "Underground Idol & I")))
            (((language en)
              (string "Supporting an Underground Idol from the Shadows")))
            (((language pl) (string "Podziemna Idolka i Ja")))))
          (description
           (((language en)
             (string
               "Kageyama, an unremarkable boy, secretly receives a message from gal classmate Natsukawa , saying, \226\128\156Meet me at the usual karaoke place after school.\226\128\157 \
              \n\
              \nHe goes to karaoke with her alone. There, Kageyama reveals something he had been asked by Natsukawa to show her."))
            ((language pl)
             (string
              "Kageyama, niewyr\195\179\197\188niaj\196\133cy si\196\153 ch\197\130opak, otrzymuje potajemnie wiadomo\197\155\196\135 od kole\197\188anki z klasy, Natsukawy, o tre\197\155ci \"Spotkajmy si\196\153 po szkole w miejscu z Karaoke\". Idzie tam z ni\196\133 sam na sam. Tam, Kageyama pokazuje co\197\155 o co zosta\197\130 poproszony przez Natsukawe."))
            ((language pt-br)
             (string
               "Kageyama, um garoto normal, recebe secretamente uma mensagem da colega de classe Natsukawa, dizendo: \226\128\156Encontre-me no karaok\195\170 de sempre depois da escola\226\128\157.\
              \n\
              \nEle vai ao karaok\195\170 sozinho com ela. L\195\161, Kageyama revela algo que Natsukawa pediu para mostrar a ela."))))
          (is_locked false)
          (links
           (((provider al) (link 178851))
            ((provider ap) (link chika-idol-wo-kage-de-sasaeru-ore))
            ((provider mu) (link 57kjo77)) ((provider mal) (link 171667))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2024))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-06-30T06:44:43+00:00)
          (updated_at 2024-07-27T20:21:02+00:00) (version 10)
          (available_translated_languages (vi en pt-br pl tr))
          (latest_uploaded_chapter ea77063b-4c99-4300-a11f-b5cd93e19688)))
        (relationships
         (((id f8914b4d-2da3-415c-8caa-5a3c3ab8571e) (type_ author))
          ((id f8914b4d-2da3-415c-8caa-5a3c3ab8571e) (type_ artist))
          ((id b24b4984-0243-4f24-ad79-e6ee63d2226c) (type_ cover_art))
          ((id 68d62155-85fa-4851-94af-37402bf16252) (type_ creator)))))
       ((id 39aa3af8-490b-4642-be07-669251a0a06b)
        (attributes
         ((title (((language en) (string "Tsugihagi Darake no Saikyou Yuusha"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\132\227\130\174\227\131\143\227\130\174\227\129\160\227\130\137\227\129\145\227\129\174\230\156\128\229\188\183\229\139\135\232\128\133")))
            (((language ja-ro) (string "Tsugi hagi Darake no Saikyou Yuusha")))
            (((language en) (string "The Patchwork Hero")))))
          (description
           (((language en)
             (string
              "Arikawa Ougi, 16 years old, suddenly found himself reincarnated as a zombie?! Embarking on a journey to subjugate the Demon Lord as a zombie hero, but the use of \"power\" requires a \"price\"...? A dark fantasy in another world."))
            ((language ja)
             (string
              "\227\128\144\231\149\176\228\184\150\231\149\140\195\151\227\130\176\227\131\173\195\151\227\131\144\227\131\136\227\131\171\227\128\145\227\128\128\232\187\162\231\148\159\229\133\136\227\129\175\227\128\129\227\129\190\227\129\149\227\129\139\227\129\174\227\130\190\227\131\179\227\131\147\239\188\129\239\188\159\227\128\128\229\139\135\232\128\133\227\130\190\227\131\179\227\131\147\227\129\168\227\129\151\227\129\166\233\173\148\231\142\139\232\168\142\228\188\144\227\129\174\230\151\133\227\129\171\229\135\186\227\130\139\227\130\130\227\128\129\227\128\138\229\138\155\227\128\139\227\129\174\228\189\191\231\148\168\227\129\171\227\129\175\227\128\138\228\187\163\229\132\159\227\128\139\227\129\140\229\191\133\232\166\129\227\129\167\226\128\166\239\188\159\227\128\128\231\149\176\228\184\150\231\149\140\231\179\187\227\131\128\227\131\188\227\130\175\227\131\149\227\130\161\227\131\179\227\130\191\227\130\184\227\131\188"))))
          (is_locked false)
          (links
           (((provider al) (link 151920))
            ((provider bw) (link series/364008/list))
            ((provider mu) (link a8ctsb9))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0B4ZHP696))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/707920))
            ((provider mal) (link 170382))
            ((provider raw) (link https://ganma.jp/tsugihagi))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2022))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-27T12:05:32+00:00)
          (updated_at 2024-08-02T15:53:51+00:00) (version 10)
          (available_translated_languages (en))
          (latest_uploaded_chapter 6ea48035-39ba-481e-8496-14520cefdeea)))
        (relationships
         (((id 7476bd93-03ac-4629-aca8-c3cc55053189) (type_ author))
          ((id 7476bd93-03ac-4629-aca8-c3cc55053189) (type_ artist))
          ((id bbcb55e4-d21e-44d9-be15-f5694bef813d) (type_ cover_art))
          ((id 46c6aaf5-a84a-4d80-b602-6cc9d4c7a861) (type_ creator)))))
       ((id ad2f66cc-3b77-4122-bda1-7c3894066305)
        (attributes
         ((title (((language en) (string "Marriage Gray"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\158\227\131\170\227\131\131\227\130\184\227\130\176\227\131\172\227\131\188")))
            (((language ru)
              (string
               "\208\161\208\181\209\128\209\139\208\185 \208\177\209\128\208\176\208\186")))
            (((language zh)
              (string
               "\230\131\179\228\184\141\233\128\154\229\143\175\231\136\177\232\128\129\229\169\134\228\184\186\228\187\128\228\185\136\232\166\129\228\184\142\230\136\145\231\187\147\229\169\154")))
            (((language zh-ro)
              (string
               "Xi\199\142ng b\195\185t\197\141ng k\196\155'\195\160i l\199\142op\195\179 w\195\168ish\195\169me y\195\160o y\199\148 w\199\146 ji\195\169h\197\171n")))
            (((language ko)
              (string
               "\235\167\164\235\166\172\236\167\128 \234\183\184\235\160\136\236\157\180")))
            (((language ko-ro) (string "Maeliji geulei")))))
          (description
           (((language en)
             (string
              "My wife is suspicious!! Why did she marry a guy like me\226\128\166? Ordinary average guy Tsuchioka Naotsugu ended up with Yoshino, who's perfect in all angles of beauty, know-how, and sociability. It's not \"marriage blue\" it's everyday life questioning over things, so it's \"marriage gray\" newlywed life, go!"))
            ((language ja)
             (string
              "\227\130\166\227\131\129\227\129\174\227\129\139\227\130\143\227\129\132\227\129\153\227\129\142\227\130\139\229\166\187\227\129\175\227\128\129\227\129\170\227\129\156\232\182\133\229\185\179\229\135\161\227\129\170\232\135\170\229\136\134\227\129\168\231\181\144\229\169\154\227\129\151\227\129\159\227\129\174\227\129\139\226\128\149\226\128\149!?\227\128\128\232\135\170\229\183\177\232\169\149\228\190\161\230\191\128\228\189\142\227\129\170\229\164\171\227\131\187\230\167\140\229\178\161\231\155\180\231\182\153\227\129\175\227\128\129\229\166\187\227\131\187\230\134\153\228\185\131\227\129\184\227\129\174\231\150\145\229\191\181\227\129\139\227\130\137\226\128\156\227\131\158\227\131\170\227\131\131\227\130\184\227\130\176\227\131\172\227\131\188\226\128\157\227\129\171\233\153\165\227\129\163\227\129\166\227\129\132\227\129\159\239\188\129\227\128\128\228\184\128\230\150\185\227\129\174\230\134\153\228\185\131\227\129\175\227\128\129\230\151\165\227\128\133\230\186\162\227\130\140\227\129\190\227\129\143\227\130\139\231\155\180\231\182\153\227\129\184\227\129\174LOVE\227\130\146\230\138\145\227\129\136\227\130\139\227\129\174\227\129\171\228\184\128\231\148\159\230\135\184\229\145\189\227\129\167\226\128\166!?\227\128\128\231\155\184\230\128\157\231\155\184\230\132\155\227\129\170\230\150\176\229\169\154\229\164\171\229\169\166\227\129\174\227\128\129\230\191\128\231\148\152\227\129\139\227\129\145\233\129\149\227\129\132\227\131\169\227\131\150\227\130\179\227\131\161\227\131\135\227\130\163\239\188\129"))
            ((language pt-br)
             (string
              "Minha esposa \195\169 muito suspeita! Eu n\195\163o entendo por que ela se casou com algu\195\169m como eu? Por que uma mulher bonita, inteligente, e considerada como a Yoshino se casaria com algu\195\169m comum como Naotsugu!! N\195\163o h\195\161 casamento azul aqui, apenas um suspeito caso de casamento cinza!!"))))
          (is_locked false)
          (links
           (((provider al) (link 128779)) ((provider ap) (link marriage-gray))
            ((provider bw) (link series/328288/list))
            ((provider kt) (link marriage-gray)) ((provider mu) (link 177431))
            ((provider amz) (link https://www.amazon.co.jp/dp/B09XLVN4JZ))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/667225/))
            ((provider mal) (link 140717))
            ((provider raw) (link https://ynjn.jp/title/1355))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2021))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-03-14T20:14:56+00:00)
          (updated_at 2024-05-02T22:10:06+00:00) (version 26)
          (available_translated_languages (pt-br ru en ko))
          (latest_uploaded_chapter 3e52c4a4-cb98-4ae1-92db-a0c3547bbc10)))
        (relationships
         (((id c2ca88ef-48b9-4550-b491-7cad348e690f) (type_ author))
          ((id c2ca88ef-48b9-4550-b491-7cad348e690f) (type_ artist))
          ((id 5a22e906-8a11-4b00-a54e-7e7782078935) (type_ cover_art)))))
       ((id 12d81610-51d9-407b-b94d-6f50b4cee8d2)
        (attributes
         ((title (((language en) (string "Tensai Majo no Maryoku Kare"))))
          (alt_titles
           ((((language en) (string "The Genius Witch Lost MP.")))
            (((language ja)
              (string
               "\229\164\169\230\137\141\233\173\148\229\165\179\227\129\174\233\173\148\229\138\155\230\158\175\227\130\140")))
            (((language pt-br) (string "A Bruxa g\195\170nia perdeu seu MP")))
            (((language vi)
              (string
               "N\195\160ng Ph\195\185 Th\225\187\167y Thi\195\170n T\195\160i H\225\186\191t Mana R\225\187\147i!")))))
          (description
           (((language en)
             (string
              "Nayu, the one in a million genius witch who has been the talk of the town, has run out of magic! The price for all the things she has been allowed to do because of her brilliance is coming back to the former genius witch like a boomerang... Then, she meets her past student \"Komugi\" who loves her very much. This is a boomerang love comedy of karmic retribution by a former genius witch who can't be left alone even though it stings a little, abandoned by her magical powers!"))
            ((language ja)
             (string
              "1mm\227\129\167\227\130\130\229\155\179\227\129\171\228\185\151\227\129\163\227\129\159\228\186\139\227\129\140\227\129\130\227\130\139\229\133\131\229\164\169\230\137\141\227\129\174\229\144\155\227\129\1841\228\184\135\229\185\180\227\129\1711\228\186\186\227\129\174\229\164\169\230\137\141\233\173\148\229\165\179\226\128\156\227\131\138\227\131\166\226\128\157\227\129\174\233\173\148\229\138\155\227\129\140\230\158\175\227\130\140\227\129\159\239\188\129\239\188\159\229\164\169\230\137\141\227\130\134\227\129\136\227\129\171\232\168\177\227\129\149\227\130\140\227\129\166\227\129\141\227\129\159\227\129\130\227\130\140\227\130\132\227\129\147\227\130\140\227\129\174\227\131\132\227\130\177\227\129\140\227\128\129\228\187\138\227\131\150\227\131\188\227\131\161\227\131\169\227\131\179\227\129\174\227\130\136\227\129\134\227\129\171\231\170\129\227\129\141\229\136\186\227\129\149\227\129\163\227\129\166\227\129\132\227\129\143\226\128\166\227\129\157\227\130\147\227\129\170\227\131\138\227\131\166\227\129\140\229\138\169\227\129\145\227\130\146\230\177\130\227\130\129\227\129\159\227\129\174\227\129\175\227\128\129\232\135\170\229\136\134\227\129\174\227\129\147\227\129\168\227\129\140\229\164\167\229\165\189\227\129\141\227\129\170\230\149\153\227\129\136\229\173\144\227\129\174\229\176\143\233\186\166\227\129\143\227\130\147\227\128\130\227\129\160\227\129\132\227\129\182\231\151\155\227\129\132\227\129\145\227\129\169\227\129\170\227\130\147\227\129\160\227\129\139\230\148\190\227\129\163\227\129\166\231\189\174\227\129\145\227\129\170\227\129\132\229\165\135\229\166\153\227\129\1702\228\186\186\227\129\174\229\133\177\229\144\140\231\148\159\230\180\187\227\129\140\229\167\139\227\129\190\227\129\163\227\129\159\239\188\129"))
            ((language pt-br)
             (string
              "Nayu, aquela em um milh\195\163o de bruxas geniais que tem sido o assunto da cidade, ficou sem magia! O pre\195\167o por todas as coisas que ela foi autorizada a fazer por causa de seu brilhantismo est\195\161 voltando para a ex-bruxa genial como um bumerangue... Ent\195\163o, ela lembrou de seu ex-aluno \"Komugi\", que a ama muito. Esta \195\169 uma com\195\169dia de amor de retribui\195\167\195\163o c\195\161rmica por uma ex-bruxa genial que n\195\163o pode ser deixada sozinha, mesmo que doa um pouco, abandonada por seus poderes m\195\161gicos!"))))
          (is_locked false)
          (links
           (((provider al) (link 159488))
            ((provider ap) (link tensai-majo-no-maryoku-kare))
            ((provider bw) (link series/409010))
            ((provider kt) (link tensai-majo-no-maryoku-kare))
            ((provider mu) (link v9yzoi2))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0C45XT3TL))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2839483))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/758775))
            ((provider mal) (link 155984))
            ((provider raw)
             (link https://www.sunday-webry.com/episode/316190246911320488))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2022))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-11-22T01:55:04+00:00)
          (updated_at 2024-07-30T21:09:21+00:00) (version 24)
          (available_translated_languages (vi en mn pt-br he))
          (latest_uploaded_chapter 466621a3-c888-400e-b5fc-7503e50cd436)))
        (relationships
         (((id 0e9b0c2e-07c0-4e54-8b80-099c616afb22) (type_ author))
          ((id 0e9b0c2e-07c0-4e54-8b80-099c616afb22) (type_ artist))
          ((id e3ca5031-15d8-4acb-a548-941b22969149) (type_ cover_art))
          ((id 641932fb-751e-4fac-9793-3f711173fd6b) (type_ creator)))))
       ((id a7d35b5e-3927-40c5-87ef-496d740349b7)
        (attributes
         ((title (((language en) (string "Like Mother, Like Daughter"))))
          (alt_titles
           ((((language zh)
              (string
               "\229\166\130\229\135\186\228\184\128\232\190\153\231\154\132\229\165\179\229\132\191")))
            (((language ko)
              (string "\235\152\145 \235\139\174\236\157\128 \235\148\184")))
            (((language fr) (string "Telle m\195\168re, telle fille")))
            (((language th)
              (string
               "\224\184\165\224\184\185\224\184\129\224\185\132\224\184\161\224\185\137\224\184\171\224\184\165\224\185\136\224\184\153\224\185\132\224\184\161\224\185\136\224\185\132\224\184\129\224\184\165\224\184\149\224\185\137\224\184\153")))
            (((language en) (string "Look Alike Daughter")))))
          (description
           (((language en)
             (string
              "Beautiful and intelligent, Somyung Gil has tirelessly strived to fulfill her mother's vision of the perfect daughter. However, when her less-than-perfect younger brother is tragically found drowned in a river, doubts plague Somyung's heart. She begins to suspect that their mother might be responsible for the unspeakable act. From then on, her paramount goal becomes escaping her mother's grasp, while all her mother wants is for Somyung to experience the perfect life she herself was denied. Will Somyung ever truly find her freedom?"))))
          (is_locked false)
          (links
           (((provider al) (link 139640))
            ((provider ap) (link like-mother-like-daughter))
            ((provider mu) (link cu26he3)) ((provider mal) (link 154405))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=774866))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/drama/like-mother-like-daughter/list?title_no=5734))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating suggestive)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id cdad7e68-1419-41dd-bdce-27753074a640)
             (attributes
              ((name (((language en) (string Horror)))) (group genre)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-09-07T10:54:40+00:00)
          (updated_at 2024-07-18T03:31:11+00:00) (version 8)
          (available_translated_languages (en))
          (latest_uploaded_chapter 3f34268f-8806-44a6-854c-98e1fc4efcb1)))
        (relationships
         (((id 77250122-e63b-4de5-b85e-009a48fed98e) (type_ author))
          ((id 77250122-e63b-4de5-b85e-009a48fed98e) (type_ artist))
          ((id 205caf89-ef34-48fb-baec-58e0e0ee0d66) (type_ cover_art))
          ((id 9d1875a3-b58c-43f1-9b42-e2093c04d092) (type_ creator)))))
       ((id 0c99ed90-369e-46a0-aab5-84960da25b09)
        (attributes
         ((title
           (((language en)
             (string
              "Sekai de Yuuitsu no Tenshokushi: Job Hopper na Ore wa, Isekai de Subete no Job o Kiwameru Koto ni Shita"))))
          (alt_titles
           ((((language ja)
              (string
               "\228\184\150\231\149\140\227\129\167\229\148\175\228\184\128\227\129\174\232\187\162\232\129\183\229\184\171\239\189\158\227\130\184\227\131\167\227\131\150\227\131\155\227\131\131\227\131\145\227\131\188\227\129\170\228\191\186\227\129\175\227\128\129\231\149\176\228\184\150\231\149\140\227\129\167\227\129\153\227\129\185\227\129\166\227\129\174\227\130\184\227\131\167\227\131\150\227\130\146\230\165\181\227\130\129\227\130\139\227\129\147\227\129\168\227\129\171\227\129\151\227\129\159\239\189\158")))
            (((language ja-ro) (string "Sekai de Yuiitsu no Tenshokushi")))
            (((language en)
              (string
               "The Only Job Changer in the World: I, a Job Hopper, Decided to Master All the Jobs in Another World")))
            (((language en) (string "The World's Only Job Changer")))))
          (description
           (((language en)
             (string
               "Tsukasa, a company employee who repeatedly changes jobs in search of better conditions, challenges the final interview of a major corporation.  But as soon as he went past the door, he found himself in another world. His past career seems completely irrelevant, leading to a sense of discouragement. But, the \"Job Changer\" bestowed upon him grants him a unique ability!\
              \n\
              \nWith the power to freely switch between jobs like swordsman, mage, spear user, alchemist, appraiser, pharmacist, and more, he begins a leisurely life in this different world. Whether dealing with monsters or making use of abundant knowledge from herbs to items, he adapts effortlessly, engaging in everything from helping people to earning money. \
              \n\
              \nUnstoppable with his versatile skills, the powerful corporate slave leaps into a fantasy of career advancement!"))
            ((language ja)
             (string
               "\227\130\136\227\130\138\227\130\136\227\129\132\230\157\161\228\187\182\227\130\146\230\177\130\227\130\129\227\129\166\232\187\162\232\129\183\227\130\146\231\185\176\227\130\138\232\191\148\227\129\153\228\188\154\231\164\190\229\147\161\227\131\187\227\131\132\227\130\171\227\130\181\227\128\130\
              \n\229\164\167\228\188\129\230\165\173\227\129\174\230\156\128\231\181\130\233\157\162\230\142\165\227\129\171\230\140\145\227\130\147\227\129\160\229\189\188\227\129\175\227\128\129\230\176\151\227\129\140\228\187\152\227\129\145\227\129\176\231\149\176\228\184\150\231\149\140\227\129\184\227\129\168\232\187\162\231\167\187\227\129\151\227\129\166\227\129\132\227\129\159\227\128\130\
              \n\227\129\147\227\130\140\227\129\190\227\129\167\227\129\174\231\181\140\230\173\180\227\129\140\227\129\190\227\129\163\227\129\159\227\129\143\233\128\154\231\148\168\227\129\151\227\129\170\227\129\132\226\128\166\226\128\166\227\129\168\230\132\143\230\176\151\230\182\136\230\178\136\227\131\162\227\131\188\227\131\137\227\128\130\
              \n\227\129\160\227\129\140\227\128\129\229\189\188\227\129\140\230\142\136\227\129\139\227\129\163\227\129\159\227\128\140\232\187\162\232\129\183\229\184\171\227\128\141\227\129\175\229\148\175\228\184\128\231\132\161\228\186\140\227\129\174\232\131\189\229\138\155\227\129\167\227\129\130\227\129\163\227\129\159\239\188\129\
              \n\229\137\163\229\163\171\227\128\129\233\173\148\232\161\147\229\184\171\227\128\129\230\167\141\228\189\191\227\129\132\227\128\129\233\140\172\233\135\145\232\161\147\229\163\171\227\128\129\233\145\145\229\174\154\229\163\171\227\128\129\232\150\172\229\184\171etc.\227\129\168\227\128\129\227\129\169\227\130\147\227\129\170\227\130\184\227\131\167\227\131\150\227\129\171\227\130\130\232\135\170\231\148\177\232\135\170\229\156\168\227\129\171\229\136\135\227\130\138\230\155\191\227\129\136\227\130\139\229\138\155\227\129\167\227\128\129\229\189\188\227\129\175\230\130\160\227\128\133\232\135\170\233\129\169\227\129\170\231\149\176\228\184\150\231\149\140\231\148\159\230\180\187\227\130\146\227\130\185\227\130\191\227\131\188\227\131\136\227\129\149\227\129\155\227\130\139\227\128\130\
              \n\233\173\148\231\137\169\231\155\184\230\137\139\227\129\160\227\130\141\227\129\134\227\129\140\227\128\129\231\133\174\227\130\139\227\129\170\227\130\138\231\132\188\227\129\143\227\129\170\227\130\138\230\150\172\227\130\139\227\129\170\227\130\138\227\129\175\227\129\138\230\137\139\227\129\174\227\130\130\227\129\174\239\188\129\
              \n\232\150\172\232\141\137\227\129\139\227\130\137\227\130\162\227\130\164\227\131\134\227\131\160\227\129\190\227\129\167\227\128\129\230\186\162\227\130\140\227\130\139\231\159\165\232\173\152\227\129\167\230\156\137\229\138\185\230\180\187\231\148\168\239\188\129\
              \n\227\129\149\227\130\137\227\129\171\227\129\175\227\128\129\230\140\129\227\129\161\229\137\141\227\129\174\233\160\134\229\191\156\229\138\155\227\130\130\231\153\186\230\143\174\227\129\151\227\128\129\228\186\186\229\138\169\227\129\145\227\129\171\227\129\138\233\135\145\231\168\188\227\129\142\227\129\171\227\129\168\227\128\129\231\132\161\229\143\140\227\129\140\230\173\162\227\129\190\227\130\137\227\129\170\227\129\132!?\
              \n\227\131\145\227\131\175\227\131\149\227\131\171\231\164\190\231\149\156\227\129\140\228\184\131\232\137\178\227\129\174\232\129\183\227\130\146\233\167\134\228\189\191\227\129\151\227\129\166\232\183\179\227\129\173\228\184\138\227\129\140\227\130\139\227\128\129\227\130\173\227\131\163\227\131\170\227\130\162\227\130\162\227\131\131\227\131\151\227\131\187\227\131\149\227\130\161\227\131\179\227\130\191\227\130\184\227\131\188\233\150\139\229\185\149\239\188\129"))))
          (is_locked false)
          (links
           (((provider al) (link 173229))
            ((provider ap)
             (link
              sekai-de-yuuitsu-no-tenshokushi-job-hopper-na-ore-wa-isekai-de-subete-no-job-wo-kiwameru-koto-ni-shita))
            ((provider bw) (link series/453034))
            ((provider kt)
             (link
              sekai-de-yuiitsu-no-tenshokushi-job-hopper-na-ore-wa-isekai-de-subete-no-job-wo-kiwameru-koto-ni-shita-comic))
            ((provider mu) (link e7prx5z))
            ((provider nu) (link the-only-job-changer-in-the-world))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0CST93DNC))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2953437))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/814626))
            ((provider mal) (link 166422))
            ((provider raw)
             (link https://to-corona-ex.com/comics/127695906504790))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-01-05T19:34:47+00:00)
          (updated_at 2024-05-11T11:58:33+00:00) (version 15)
          (available_translated_languages (fr es-la en pt-br))
          (latest_uploaded_chapter cbd69660-eb72-40a2-90e3-6d23cdf343f8)))
        (relationships
         (((id ff392266-c7e9-42f0-b316-9c295ebe6c90) (type_ author))
          ((id 7b0e219f-b42e-4ff0-9cea-03be18a5de77) (type_ artist))
          ((id 76d0d569-5b04-4573-97ee-f5ba7a611108) (type_ cover_art))
          ((id 95bc1ac0-b06e-445f-ad6e-dda595996a5b) (type_ creator)))))
       ((id 22d6d048-9f9f-4c3a-95c2-3b145f110e20)
        (attributes
         ((title (((language en) (string "I'm in Love with the Villainess"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\167\129\227\129\174\230\142\168\227\129\151\227\129\175\230\130\170\229\189\185\228\187\164\229\172\162\227\128\130")))
            (((language pt) (string "Me apaixonei pela vil\195\163")))
            (((language es) (string "Me enamor\195\169 de la villana")))
            (((language vi)
              (string
               "T\195\180i y\195\170u n\225\187\175 ph\225\186\163n di\225\187\135n")))
            (((language zh)
              (string
               "\230\136\145\231\154\132\230\142\168\230\152\175\229\157\143\228\186\186\229\164\167\229\176\143\229\167\144")))
            (((language zh)
              (string
               "\230\136\145\231\154\132\233\166\150\230\142\168\230\152\175\230\129\182\229\189\185\229\164\167\229\176\143\229\167\144")))
            (((language zh-hk)
              (string
               "\230\136\145\231\154\132\233\166\150\230\142\168\230\152\175\230\131\161\229\189\185\229\164\167\229\176\143\229\167\144")))
            (((language zh-ro)
              (string
               "W\199\146 de sh\199\146utu\196\171 sh\195\172 \195\168 y\195\172 d\195\160 xi\199\142oji\196\155")))
            (((language ko)
              (string
               "\235\130\180 \236\181\156\236\149\160\235\138\148 \236\149\133\236\151\173\236\152\129\236\149\160")))
            (((language ru)
              (string
               "\208\175 \208\191\209\128\208\181\208\180\208\191\208\190\209\135\208\184\209\130\208\176\209\142 \208\183\208\187\208\190\208\180\208\181\208\185\208\186\209\131")))
            (((language th)
              (string
               "\224\184\151\224\184\179\224\185\132\224\184\135\224\184\148\224\184\181\224\185\128\224\184\129\224\184\161\224\184\153\224\184\181\224\185\137\224\184\153\224\184\178\224\184\135\224\184\163\224\185\137\224\184\178\224\184\162\224\184\153\224\185\136\224\184\178\224\184\163\224\184\177\224\184\129")))
            (((language ko-ro) (string "Nae Choeaeneun Ag-yeog-yeong-ae")))
            (((language zh)
              (string
               "\230\136\145\230\142\168\230\152\175\229\143\141\230\180\190\229\164\167\229\176\143\229\167\144")))
            (((language ka)
              (string
               "\225\131\155\225\131\148 \225\131\155\225\131\152\225\131\167\225\131\149\225\131\144\225\131\160\225\131\161 \225\131\145\225\131\157\225\131\160\225\131\157\225\131\162\225\131\155\225\131\157\225\131\165\225\131\155\225\131\148\225\131\147\225\131\152")))
            (((language ja-ro) (string "Watashi no Oshi wa Akuyaku Reijou.")))
            (((language zh-hk)
              (string
               "\230\136\145\231\154\132\230\142\168\230\152\175\229\163\158\228\186\186\229\164\167\229\176\143\229\167\144\227\128\130")))
            (((language en) (string "I Favor the Villainess")))
            (((language ja-ro) (string WataOshi)))
            (((language pl)
              (string "Zakocha\197\130am si\196\153 w Antagonistce.")))
            (((language es-la) (string "Mi Oshi Es Una Villa Noble")))))
          (description
           (((language de)
             (string
               "Oohashi Rei - eigentlich eine ganz normale B\195\188roangestellte - wacht eines Tages im K\195\182rper der Protagonistin ihres absoluten Lieblingsspiels \"Revolution\" auf. Eigentlich geht es in dem Spiel darum, mit einem von drei absolut wundervollen Prinzen zusammenzukommen. Ein klassisches Otome-Game, und wenn es nach Rei geht, auch das mit Abstand beste.  \
              \nIhr Hauptinteresse lag dabei jedoch nicht etwa an einem der m\195\164nnlichen Charaktere, sondern an Claire Fran\195\167ois, der Antagonistin des Spiels.\
              \n\
              \nWird Rei es schaffen, eine romantische Beziehung zu ihr aufzubauen? Wie werden die eigentlichen Stars des Spiels, die drei Prinzen, auf diese Situation reagieren?  \
              \nUnd was h\195\164lt Claire \195\188berhaupt davon?"))
            ((language en)
             (string
               "Ordinary office worker Oohashi Rei wakes up in the body of the protagonist of her favourite otome game, *Revolution*. To her delight, the first person to greet her is also her favourite character, Claire Fran\195\167ois \226\128\147 the main antagonist of the story!\
              \n\
              \nNow, Rei is determined to romance Claire instead of the game\226\128\153s male leads. But how will her villainous lady love react to this new courtship?!"))
            ((language fr)
             (string
               "Rei \195\148hashi, une simple employ\195\169e de bureau d\226\128\153une petite entreprise, se retrouve soudainement dans le corps de l\226\128\153h\195\169ro\195\175ne de son jeu vid\195\169o de drague pr\195\169f\195\169r\195\169, Revolution.\
              \nMaintenant sous le nom de Rae Taylor, elle est pr\195\170te \195\160 accomplir son objectif.\
              \nPasser du bon temps avec les princes du jeu ? Non.\
              \nSon c\197\147ur appartient \195\160 la m\195\169chante de l\226\128\153histoire, Claire Fran\195\167ois.\
              \nBien d\195\169cid\195\169e \195\160 la ch\195\169rir et \195\160 rester \195\160 ses c\195\180t\195\169s, sa nouvelle vie commence dans un monde empreint de magie !"))
            ((language id)
             (string
              "Seorang pegawai kantor biasa, Oohashi Rei, bereinkarnasi sebagai seorang Heroine bernama Rei Taylor di Game Otome favoritnya, \"Revolution\". Kebetulan lagi, orang pertama yang menyambutnya adalah karakter favoritnya, Claire Francois- antagonis dari cerita ini! Kini Rei bertekad untuk membangun hubungan romantis dengan Claire, bukan dengan pemeran utama pria. Lantas, bagaimanakah gadis jahat yang dia cintai akan bereaksi terhadap kemesraan baru ini?!"))
            ((language it)
             (string
               "La normale impiegata Oohashi Rei si sveglia nel corpo della protagonista del suo gioco otome preferito, Revolution. Per la sua gioia, la prima persona che incontra \195\168 anche il suo personaggio preferito, Claire Fran\195\167ois, l'antagonista principale della storia! Ora Rei \195\168 determinata a perseguire una storia d'amore con Claire piuttosto che con gli interessi amorosi maschili. Ma come reagir\195\160 la sua amata antagonista a questo nuovo corteggiamento?!\
              \nL'anime debutter\195\160 ad ottobre 2023!\
              \nAnnunciato il manga ufficiale italiano!"))
            ((language ja)
             (string
              "\228\185\153\229\165\179\227\130\178\227\131\188\227\131\160\227\128\142Revolution\227\128\143\227\129\174\228\184\150\231\149\140\227\129\171\227\128\129\227\131\146\227\131\173\227\130\164\227\131\179\227\129\174\227\131\172\227\130\164\239\188\157\227\131\134\227\130\164\227\131\169\227\131\188\227\129\168\227\129\151\227\129\166\232\187\162\231\148\159\227\129\151\227\129\159\231\164\190\231\149\156OL\227\131\187\229\164\167\230\169\139\233\155\182\227\128\130\227\129\157\227\130\147\227\129\170\229\189\188\229\165\179\227\129\174\230\142\168\227\129\151\227\129\175\230\148\187\231\149\165\229\175\190\232\177\161\227\129\174\231\142\139\229\173\144\227\129\159\227\129\161\226\128\166\227\129\167\227\129\175\227\129\170\227\129\143\227\128\129\230\130\170\229\189\185\228\187\164\229\172\162\227\131\187\227\130\175\227\131\172\227\130\162\239\188\157\227\131\149\227\131\169\227\131\179\227\130\189\227\131\175\227\129\160\227\129\163\227\129\159!\227\128\128\229\137\141\228\184\150\227\129\167\227\130\178\227\131\188\227\131\160\227\130\146\227\130\132\227\130\138\227\129\147\227\130\147\227\129\167\227\129\132\227\129\159\227\131\172\227\130\164\227\129\175\227\128\129\227\129\157\227\129\174\231\159\165\232\173\152\227\129\168\230\132\155\227\129\167\227\128\129\227\130\175\227\131\172\227\130\162\227\129\168\227\129\138\232\191\145\227\129\165\227\129\141\227\129\171\227\129\170\227\130\139\227\129\147\227\129\168\227\129\140\227\129\167\227\129\141\227\130\139\227\129\174\227\129\139\239\188\159"))
            ((language es-la)
             (string
              "Oohashi Rei, una trabajadora de oficina ordinaria se despierta en el cuerpo de la protagonista de su juego otome favorito, \"Revolution\". Para su deleite, la primera persona en saludarla es tambi\195\169n su personaje favorito, Claire Francois, \194\161la principal antagonista de la historia! Ahora, Rei est\195\161 decidida a enamorarse de Claire en lugar de los protagonistas masculinos del juego. \194\191Pero c\195\179mo reaccionar\195\161 la villana ante este nuevo cortejo?"))))
          (is_locked true)
          (links
           (((provider al) (link 118695))
            ((provider ap) (link im-in-love-with-the-villainess))
            ((provider bw) (link series/282008)) ((provider kt) (link 57391))
            ((provider mu) (link 168833))
            ((provider nu) (link i-favor-the-villainess))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0976R435Y))
            ((provider cdj)
             (link
              https://www.cdjapan.co.jp/series/6281?term.cat_id=UD-14&page=1))
            ((provider ebj)
             (link https://ebookjapan.yahoo.co.jp/books/617996/A002494569/))
            ((provider mal) (link 129361))
            ((provider raw)
             (link https://pocket.shonenmagazine.com/episode/3269754496819342400))
            ((provider engtl)
             (link
              https://sevenseasentertainment.com/series/im-in-love-with-the-villainess-manga/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2020))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id d14322ac-4d6f-4e9b-afd9-629d5f4d8a41)
             (attributes
              ((name (((language en) (string Villainess)))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-07-15T13:42:42+00:00)
          (updated_at 2024-03-22T02:45:11+00:00) (version 65)
          (available_translated_languages
           (es-la ru pt-br zh it de en fa fr tr pl ar))
          (latest_uploaded_chapter 0bc65ad0-48e4-40cb-becf-54b58f341789)))
        (relationships
         (((id 36f68557-b7f0-44f9-8bda-2596552b372a) (type_ author))
          ((id 4237fb2e-44ee-45df-8da6-7a9ec47e6766) (type_ artist))
          ((id 3ad93be5-26fb-4a81-9be1-7b584152ab4b) (type_ cover_art))
          ((id 29d75c94-cf52-4869-ad65-2127c09cfef1) (type_ manga))
          ((id 521d0474-93d8-4644-b3d6-b7bb409f80e5) (type_ manga))
          ((id 88b69b43-92cb-4236-8d46-a85d968b4ed1) (type_ manga))
          ((id b77e25ea-8d0e-47a3-83e8-45300c1c6910) (type_ manga))
          ((id bb1ad274-276c-441d-956a-6998db995eaf) (type_ manga))
          ((id d114f167-ff25-4833-b346-462d39925fd8) (type_ manga)))))
       ((id 3a1c264a-50b3-491b-ac17-a068a99f3aff)
        (attributes
         ((title (((language en) (string "Dance in the Vampire Bund A.S.O."))))
          (alt_titles
           ((((language en)
              (string "Dance in the Vampire Bund: Age of Scarlet Order")))
            (((language ru)
              (string
               "\208\162\208\176\208\189\208\181\209\134 \208\189\208\176 \208\157\208\176\208\177\208\181\209\128\208\181\208\182\208\189\208\190\208\185 \208\146\208\176\208\188\208\191\208\184\209\128\208\190\208\178: \208\173\208\191\208\190\209\133\208\176 \208\144\208\187\208\190\208\179\208\190 \208\158\209\128\208\180\208\181\208\189\208\176")))
            (((language ja)
              (string
               "\227\131\128\227\131\179\227\130\185 \227\130\164\227\131\179 \227\130\182 \227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\227\131\144\227\131\179\227\131\137 A.S.O")))
            (((language ja)
              (string
               "\227\131\128\227\131\179\227\130\185 \227\130\164\227\131\179 \227\130\182 \227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\227\131\144\227\131\179\227\131\137 \227\130\168\227\130\164\227\130\184 \227\130\170\227\131\150 \227\130\185\227\130\171\227\131\188\227\131\172\227\131\131\227\131\136 \227\130\170\227\131\188\227\131\128\227\131\188")))))
          (description
           (((language en)
             (string
              "Third part of the story of Dance in the Vampire Bund, and direct continuation of Dance in the Vampire Bund - Scarlet Order. We return to the story of Mina Tepes, the princess of the vampires, and Akira Kaburagi Regendorf, her faithful guardian, in her search for the coexistence between vampires and humans."))
            ((language ja)
             (string
               "\227\130\162\227\131\161\227\131\170\227\130\171\229\133\168\229\156\159\227\129\167\227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\231\139\169\227\130\138\227\129\140\230\168\170\232\161\140\227\129\153\227\130\139\227\129\170\227\129\139\227\128\129\231\170\129\229\166\130\227\129\168\227\129\151\227\129\166\229\186\131\227\129\190\227\129\163\227\129\159\232\132\177\229\135\186\232\168\136\231\148\187\227\129\174\229\153\130\227\128\130\
              \n\
              \n\227\128\140\227\131\159\227\131\138\227\131\187\227\131\132\227\130\167\227\131\154\227\131\131\227\130\183\227\131\165\227\129\140\229\133\168\227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\227\130\146\229\143\172\233\155\134\227\129\151\227\129\166\227\129\132\227\130\139\227\128\141\
              \n\227\128\140\232\165\191\230\181\183\229\178\184\227\129\139\227\130\137\232\136\185\227\129\167\227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\227\131\144\227\131\179\227\131\137\227\129\184\229\144\145\227\129\139\227\129\134\227\128\141\
              \n\
              \n\227\129\157\227\129\174\230\131\133\229\160\177\227\130\146\233\160\188\227\130\138\227\129\171\232\165\191\230\181\183\229\178\184\227\130\146\231\155\174\230\140\135\227\129\153\227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\233\129\148\227\128\130\
              \n\227\129\151\227\129\139\227\129\151\227\128\129\229\189\188\227\130\137\227\129\171\227\129\168\227\129\163\227\129\166\230\176\151\227\129\140\227\129\139\227\130\138\227\129\170\227\129\147\227\129\168\227\129\140\227\129\130\227\129\163\227\129\159\227\128\130\
              \n\227\131\144\227\131\179\227\131\137\227\129\175\230\176\180\230\178\161\227\129\151\227\128\129\227\131\159\227\131\138\229\167\171\227\129\175\230\151\162\227\129\171\228\186\161\227\129\143\227\129\170\227\129\163\227\129\166\227\129\132\227\130\139\227\129\168\226\128\149\226\128\149\227\128\130\
              \n\
              \n\232\132\177\229\135\186\232\168\136\231\148\187\227\129\171\230\189\156\227\130\128\233\153\176\232\172\128\227\129\174\229\173\152\229\156\168\227\128\129\227\129\157\227\129\151\227\129\166\227\131\159\227\131\138\229\167\171\227\129\168\227\130\162\227\130\173\227\131\169\227\129\174\230\182\136\230\129\175\227\129\175\226\128\149\226\128\149\239\188\159\
              \n\
              \n\232\161\128\231\133\153\232\150\171\227\130\139\227\131\141\227\130\170\227\131\187\227\131\180\227\130\161\227\131\179\227\131\145\227\130\164\227\130\162\227\131\187\227\130\175\227\131\173\227\131\139\227\130\175\227\131\171\227\128\129\227\129\147\227\129\147\227\129\171\229\190\169\230\180\187\239\188\129\
              \n\227\128\140\233\174\174\232\161\128\227\129\174\231\167\169\229\186\143\227\129\174\230\153\130\228\187\163\239\188\136Age of Scarlet Order\239\188\137\227\128\141\227\129\174\229\185\149\227\129\140\233\150\139\227\129\143\239\188\129\239\188\129"))
            ((language ru)
             (string
              "\208\158\209\133\208\190\209\130\208\176 \208\189\208\176 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178 \209\129\208\178\208\184\209\128\208\181\208\191\209\129\209\130\208\178\209\131\208\181\209\130 \208\191\208\190 \208\178\209\129\208\181\208\185 \209\130\208\181\209\128\209\128\208\184\209\130\208\190\209\128\208\184\208\184 \208\161\208\190\208\181\208\180\208\184\208\189\208\181\208\189\208\189\209\139\209\133 \208\168\209\130\208\176\209\130\208\190\208\178, \208\186\208\176\208\186 \208\190\209\133\208\190\209\130\208\176 \208\189\208\176 \208\178\208\181\208\180\209\140\208\188 \208\178 \208\180\209\128\208\181\208\178\208\189\208\190\209\129\209\130\208\184. \208\157\208\190 \209\133\208\190\208\180\209\143\209\130 \209\129\208\187\209\131\209\133\208\184 \208\190 \208\179\209\128\208\176\208\189\208\180\208\184\208\190\208\183\208\189\208\190\208\188 \208\191\208\187\208\176\208\189\208\181 \208\191\208\190\208\177\208\181\208\179\208\176. \"\208\156\208\184\208\189\208\176 \208\166\208\181\208\191\208\181\209\136 \208\191\209\128\208\184\208\183\209\139\208\178\208\176\208\181\209\130 \208\178\209\129\208\181\209\133 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178 \208\144\208\188\208\181\209\128\208\184\208\186\208\184, - \208\179\208\190\208\178\208\190\209\128\208\184\209\130\209\129\209\143 \208\178 \208\189\208\184\209\133. - \208\148\208\190\208\177\208\181\209\128\208\184\209\130\208\181\209\129\209\140 \208\180\208\190 \208\183\208\176\208\191\208\176\208\180\208\189\208\190\208\179\208\190 \208\191\208\190\208\177\208\181\209\128\208\181\208\182\209\140\209\143, \208\184 \208\186\208\190\209\128\208\176\208\177\208\187\209\140 \208\180\208\190\209\129\209\130\208\176\208\178\208\184\209\130 \208\178\208\176\209\129 \208\178\209\129\208\181\209\133 \208\189\208\176 \208\189\208\176\208\177\208\181\209\128\208\181\208\182\208\189\209\131\209\142 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178.\226\128\157 \208\158\209\130\209\135\208\176\209\143\208\178\209\136\208\184\209\129\209\140 \208\178\209\139\208\182\208\184\209\130\209\140, \208\190\209\128\208\180\209\139 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178, \209\131\208\178\208\181\209\128\208\190\208\178\208\176\208\178 \208\178 \209\129\208\187\209\131\209\133\208\184, \208\189\208\176\208\191\209\128\208\176\208\178\208\187\209\143\209\142\209\130\209\129\209\143 \208\186 \208\183\208\176\208\191\208\176\208\180\208\189\208\190\208\188\209\131 \208\191\208\190\208\177\208\181\209\128\208\181\208\182\209\140\209\142. \208\149\209\129\209\130\209\140 \209\130\208\190\208\187\209\140\208\186\208\190 \208\190\208\180\208\189\208\176 \208\188\208\176\208\187\208\181\208\189\209\140\208\186\208\176\209\143 \208\191\209\128\208\190\208\177\208\187\208\181\208\188\208\176 - \208\189\208\176\208\177\208\181\209\128\208\181\208\182\208\189\208\176\209\143 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178 \208\183\208\176\209\130\208\190\208\189\209\131\208\187\208\176 \208\189\208\181\209\129\208\186\208\190\208\187\209\140\208\186\208\190 \208\188\208\181\209\129\209\143\209\134\208\181\208\178 \208\189\208\176\208\183\208\176\208\180, \208\176 \208\186\208\190\209\128\208\190\208\187\208\181\208\178\208\176 \208\178\208\176\208\188\208\191\208\184\209\128\208\190\208\178 \208\156\208\184\208\189\208\176 \208\166\208\181\208\191\208\181\209\136 \208\188\208\181\209\128\209\130\208\178\208\176."))
            ((language es-la)
             (string
              "Tercera parte de la historia de Dance in the Vampire Bund, y Continuaci\195\179n directa de Dance in the Vampire Bund - Scarlet Order. Retomamos la historia de Mina Tepes, la princesa de los vampiros, y Akira Kaburagi Regendorf, su fiel guardi\195\161n, en su b\195\186squeda de la convivencia entre vampiros y humanos."))))
          (is_locked false)
          (links
           (((provider al) (link 106256))
            ((provider ap) (link dance-in-the-vampire-bund-aso))
            ((provider bw) (link series/224125)) ((provider mu) (link 149179))
            ((provider amz) (link https://www.amazon.co.jp/dp/B07ZG55GBZ))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2303434))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/512110))
            ((provider mal) (link 113287))
            ((provider raw)
             (link https://to-corona-ex.com/comics/20000000034809))
            ((provider engtl)
             (link
              https://sevenseasentertainment.com/series/dance-in-the-vampire-bund/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2018))
          (content_rating suggestive)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id d7d1730f-6eb0-4ba6-9437-602cac38664c)
             (attributes
              ((name (((language en) (string Vampires)))) (group theme)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-06-25T14:14:21+00:00)
          (updated_at 2024-07-16T07:22:50+00:00) (version 13)
          (available_translated_languages (en es-la ru))
          (latest_uploaded_chapter e2253595-9cc1-4355-9a24-d7b4619c4d7c)))
        (relationships
         (((id 258c21b7-cc91-4e2c-a4b0-f4c6a1e6e0ea) (type_ author))
          ((id 258c21b7-cc91-4e2c-a4b0-f4c6a1e6e0ea) (type_ artist))
          ((id 7737ff18-4a21-4e39-a9b2-ce3b2fc73c8f) (type_ cover_art))
          ((id dde2a8bf-e598-4e03-a2d9-060611ffcd94) (type_ manga)))))
       ((id d76a350d-c6b5-42bb-bfba-e521a3964a6a)
        (attributes
         ((title
           (((language en)
             (string
              "The S-Class Hunter Doesn't Want to Be a Villainous Princess"))))
          (alt_titles
           ((((language ko)
              (string
               "S\234\184\137 \237\151\140\237\132\176\235\138\148 \236\149\133\236\151\173 \234\179\181\235\133\128\234\176\128 \235\144\152\234\184\176 \236\139\171\236\138\181\235\139\136\235\139\164")))
            (((language ko-ro)
              (string "S-geup Hunter-neun Agyeok Gongnyeoga Doegi Silseumnida")))
            (((language en) (string "The S-Class Lady")))))
          (description
           (((language en)
             (string
               "\"I'm done with romance, so send me home!\"\
              \n\
              \nKim Yi-Young was just an ordinary civil service exam candidate in South Korea.\
              \nAfter studying for more than four and a half years, she finally passed, a truly ordinary person with nothing but reading novels here and there as a hobby.\
              \n\
              \nHowever, on the day she went out for a celebratory meal after passing the exam, she got into a traffic accident and died, only to find herself reincarnated into the fantasy hunter novel she was reading.\
              \n\
              \nTo her, the \"System\" offered a way back home.\
              \nDetermined solely to return home and cuddle her warm cat and adorable Maltese, Cerberus, she gained strength through dozens of regressions.\
              \n\
              \nSigning contracts with the constellations of the original work and dying multiple times, she eventually succeeded in conquering the \"Tower\" of the original work and defeating the owner of the tower on the final floor.\
              \n\
              \nNow, all that's left is to go home......\
              \n\
              \nOr so she thought!\
              \n\
              \n[Due to an error, instead of returning to the original world, we will reincarnate you into the author's new work!]\
              \n\
              \nI don't need that! All I wanted was my sweet home! Is that so difficult?! I even got rid of the Tower!?\
              \n\
              \nMoreover, romance fantasy?! Even in my previous life, I didn't care about romance, not one bit!\
              \nAnd to top it off, I didn't even reincarnate into my own body this time, but into the \"villainess\" of the book!\
              \n\
              \nI'm not afraid of the threats in this world, but I'm worried about being forced into a romance quest.\
              \n\
              \n\"Can I go home...?\""))
            ((language ko)
             (string
               "**\235\161\156\235\167\168\236\138\164\235\138\148 \235\144\144\236\156\188\235\139\136\234\185\140 \236\167\145\236\151\144\235\130\152 \235\179\180\235\130\180\236\164\152!**\
              \n\234\185\128\236\157\180\236\152\129, \234\183\184\235\133\128\235\138\148 \235\140\128\237\149\156\235\175\188\234\181\173\236\157\152 \237\143\137\235\178\148\237\149\156 \234\179\181\235\172\180\236\155\144 \236\139\156\237\151\152 \236\157\145\236\139\156\236\131\157\236\157\180\236\151\136\235\139\164.\
              \n\234\183\184\234\178\131\235\143\132 4\235\133\132 \235\176\152\236\157\180 \235\132\152\235\138\148 \234\184\180 \236\139\156\234\176\132\235\143\153\236\149\136 \234\179\181\235\182\128 \235\129\157\236\151\144 \237\149\169\234\178\169\237\149\156, \235\130\153\236\157\180\235\157\188\234\179\160\235\138\148 \236\167\172\236\167\172\236\157\180 \236\134\140\236\132\164\236\157\189\235\138\148 \234\178\131\235\176\150\236\151\144 \236\151\134\235\138\148 \236\160\149\235\167\144 \237\143\137\235\178\148\237\149\156 \236\130\172\235\158\140.\
              \n\
              \n\234\183\184\235\159\172\235\130\152 \237\149\169\234\178\169\236\157\132 \236\182\149\237\149\152\237\149\152\234\184\176 \236\156\132\237\149\180 \236\153\184\236\139\157\236\157\132 \235\130\152\234\176\132 \235\130\160 \234\181\144\237\134\181\236\130\172\234\179\160\235\165\188 \235\139\185\237\149\180 \236\163\189\234\179\160, \236\158\144\236\139\160\236\157\180 \236\157\189\235\141\152 \237\152\132\237\131\156\237\140\144\237\131\128\236\167\128 \237\151\140\237\132\176\235\172\188\236\151\144 \235\185\153\236\157\152\237\149\152\234\179\160 \235\167\140\235\139\164.\
              \n\234\183\184\235\159\176 \236\157\180\236\152\129\236\151\144\234\178\140 \236\167\145\236\156\188\235\161\156 \235\143\140\236\149\132\234\176\136 \236\136\152 \236\158\136\235\138\148 \234\184\184\236\157\132 \236\160\156\236\149\136\237\149\152\235\138\148 '\236\139\156\236\138\164\237\133\156'.\
              \n\234\183\184\235\133\128\235\138\148 \236\152\164\235\161\156\236\167\128 \236\167\145\236\151\144 \235\143\140\236\149\132\234\176\128\236\132\156 \235\176\176 \235\148\176\235\149\131\237\149\152\234\178\140 \236\167\128\236\167\128\234\179\160 \234\183\128\236\151\172\236\154\180 \235\167\144\237\139\176\236\166\136 \236\188\136\235\178\160\235\161\156\236\138\164\235\165\188 \235\129\140\236\150\180\236\149\136\234\178\160\235\139\164\235\138\148 \236\157\188\235\133\144 \237\149\152\236\151\144 \236\136\152\236\139\173 \235\178\136\236\148\169 \237\154\140\234\183\128\237\149\152\235\169\176 \237\158\152\236\157\132 \234\184\184\235\160\128\235\139\164.\
              \n\236\155\144\236\158\145 \236\134\141\236\157\152 \236\132\177\236\162\140\235\147\164\234\179\188 \234\179\132\236\149\189\237\149\152\234\179\160 \236\136\152\236\176\168\235\161\128 \236\163\189\236\150\180\234\176\128\235\169\176 \236\155\144\236\158\145 \236\134\141\236\157\152 '\237\131\145'\236\157\132 \234\179\181\235\158\181\237\149\152\236\151\172 \234\178\176\234\181\173 \235\167\136\236\167\128\235\167\137 \236\184\181\236\157\152 \236\167\128\235\176\176\236\158\144, \237\131\145\236\157\152 \236\163\188\236\157\184\236\157\132 \236\178\152\235\166\172\237\149\152\235\138\148 \235\141\176 \236\132\177\234\179\181\237\149\156\235\139\164. \
              \n\
              \n\236\157\180\236\160\156 \235\130\168\236\157\128 \234\177\180 \236\167\145\236\156\188\235\161\156 \234\176\128\235\138\148 \234\178\131 \235\191\144\226\128\166\226\128\166,\
              \n\
              \n\
              \n\236\157\184\236\164\132 \236\149\140\236\149\152\235\138\148\235\141\176!\
              \n\
              \n[\236\152\164\235\165\152\235\161\156 \236\157\184\237\149\180 \236\155\144\235\158\152 \236\132\184\236\131\129\236\156\188\235\161\156\236\157\152 \235\179\181\234\183\128 \235\140\128\236\139\160, \236\158\145\234\176\128\236\157\152 \236\139\160\236\158\145\236\151\144 \235\185\153\236\157\152\236\139\156\236\188\156\235\147\156\235\166\172\234\178\160\236\138\181\235\139\136\235\139\164!]\
              \n\
              \n\237\149\132\236\154\148 \236\151\134\236\150\180! \235\130\180\234\176\128 \235\176\148\235\158\128\234\177\180 \235\130\180 \236\138\164\236\156\151 \237\153\136\235\191\144\236\157\180\236\151\136\235\138\148\235\141\176!\
              \n\234\183\184\234\178\140 \234\183\184\235\160\135\234\178\140 \236\150\180\235\160\164\236\155\140?! \237\131\145\235\143\132 \235\130\180\234\176\128 \236\151\134\236\149\160\236\164\172\235\138\148\235\141\176?!?!\
              \n\
              \n\234\178\140\235\139\164\234\176\128, \235\161\156\235\167\168\236\138\164 \237\140\144\237\131\128\236\167\128\235\157\188\235\139\136! \236\157\180\236\160\132 \235\185\153\236\157\152\236\151\144\236\132\156\235\143\132 \235\161\156\235\167\168\236\138\164\236\157\152 \227\132\185\235\143\132, \236\149\132\235\139\136, \227\132\185\236\157\152 \237\149\156 \237\154\141\235\143\132 \236\139\160\234\178\189 \236\149\136 \236\147\176\234\179\160 \236\130\180\236\149\152\235\138\148\235\141\176!\
              \n\234\177\176\234\184\176\236\151\144 \236\157\180\236\160\132\236\178\152\235\159\188 \235\130\180 \235\170\184\236\156\188\235\161\156 \236\177\133\236\151\144 \235\185\153\236\157\152\237\149\156 \234\178\140 \236\149\132\235\139\136\235\157\188 \236\177\133 \236\134\141\236\157\152 '\236\149\133\235\133\128'\236\151\144 \235\185\153\236\157\152\237\150\136\235\139\164!\
              \n\
              \n\236\157\180 \236\132\184\234\179\132\236\157\152 \236\156\132\237\152\145\236\157\128 \236\160\132\237\152\128 \235\145\144\235\160\181\236\167\128 \236\149\138\236\167\128\235\167\140, \235\161\156\235\167\168\236\138\164\235\165\188 \234\176\149\236\160\156\235\161\156 \235\129\140\236\150\180\235\130\180\235\138\148 \237\128\152\236\138\164\237\138\184\235\138\148 \234\177\177\236\160\149\235\144\156\235\139\164. \
              \n\
              \n\235\130\152, \236\167\145\236\151\144 \234\176\136 \236\136\152 \236\158\136\236\157\132\234\185\140\226\128\166\226\128\166?"))
            ((language pt-br)
             (string
               "**Estou farta de romance, ent\195\163o me mandem para casa!**\
              \n\
              \nKim Yi-Young era apenas uma candidata comum ao exame de servi\195\167o civil na Coreia do Sul. Depois de estudar por mais de quatro anos e meio, finalmente passou, uma pessoa verdadeiramente comum que s\195\179 gostava de ler romances de vez em quando como passatempo.\
              \n\
              \nNo entanto, no dia em que saiu para uma refei\195\167\195\163o comemorativa ap\195\179s passar no exame, sofreu um acidente de tr\195\162nsito e morreu, apenas para se ver reencarnada no romance de ca\195\167adora de fantasia que estava lendo.\
              \n\
              \nPara ela, o \"Sistema\" ofereceu um caminho de volta para casa. Determinada apenas a voltar para casa e abra\195\167ar seu gato e o ador\195\161vel Malt\195\170s, Cerberus, ela ganhou for\195\167a atrav\195\169s de dezenas de regress\195\181es. Assinando contratos com as constela\195\167\195\181es da obra original e morrendo v\195\161rias vezes, eventualmente conseguiu conquistar a \"Torre\" da obra original e derrotar o dono da torre no \195\186ltimo andar.\
              \n\
              \nAgora, tudo o que resta \195\169 voltar para casa......\
              \n\
              \nOu pelo menos era o que ela pensava!\
              \n\
              \n[Devido a um erro, em vez de retornar ao mundo original, vamos reencarn\195\161-la na nova obra do autor!]\
              \n\
              \nEu n\195\163o preciso disso! Tudo o que eu queria era minha doce casa! \195\137 t\195\163o dif\195\173cil assim?! At\195\169 me livrei da Torre!?!?!\
              \n\
              \nAl\195\169m disso, fantasia rom\195\162ntica?! Nem mesmo na minha vida anterior eu me importava com romance, nem um pouco! E para piorar, nem reencarnei em meu pr\195\179prio corpo desta vez, mas na \"vil\195\163\" do livro!\
              \n\
              \nN\195\163o tenho medo das amea\195\167as deste mundo, mas estou preocupada em ser for\195\167ada a uma busca rom\195\162ntica.\
              \n\
              \nSer\195\161 que posso voltar para casa......?"))))
          (is_locked false)
          (links
           (((provider al) (link 175776))
            ((provider ap)
             (link the-s-class-hunter-doesnt-want-to-be-a-villainous-princess))
            ((provider kt)
             (link s-geup-hunter-neun-agyeok-gongnyeoga-doegi-silseumnida))
            ((provider mu) (link 7pvgyx3))
            ((provider nu)
             (link the-s-class-hunter-doesnt-want-to-be-a-villainous-princess))
            ((provider mal) (link 167521))
            ((provider raw) (link https://page.kakao.com/content/63555003))
            ((provider engtl)
             (link https://tapas.io/series/the-s-class-lady/info))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id d14322ac-4d6f-4e9b-afd9-629d5f4d8a41)
             (attributes
              ((name (((language en) (string Villainess)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-02-06T17:22:01+00:00)
          (updated_at 2024-07-28T07:45:56+00:00) (version 16)
          (available_translated_languages (es-la en pl pt-br))
          (latest_uploaded_chapter 2e4beb61-b7aa-4eb1-8967-a87819a269a5)))
        (relationships
         (((id 370581cf-18bd-4666-bd47-55ebfa124753) (type_ author))
          ((id a2515197-d763-4710-bb21-6ebb3ab7a449) (type_ author))
          ((id dfaac7b8-911e-4f8b-b412-ba87d97eac7a) (type_ author))
          ((id 930bfd09-f8b4-4f84-804e-4694f8f787e1) (type_ artist))
          ((id 7c81df78-7149-4a17-ad72-542782823cdd) (type_ cover_art))
          ((id 35feba03-9f4a-4f63-b948-b6ad43a49a0d) (type_ manga))
          ((id f97b649b-b614-4cae-9b17-d460412e2b7a) (type_ creator)))))
       ((id e4581bb1-9c9b-4e58-ba91-8e303fb29fa6)
        (attributes
         ((title
           (((language en) (string "Rabukome to Kaijuu Taiji no Fumonritsu"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\169\227\131\150\227\130\179\227\131\161\227\129\168\230\128\170\231\141\163\233\128\128\230\178\187\227\129\174\228\184\141\230\150\135\229\190\139")))
            (((language en)
              (string
               "The Unwritten Rules of Romantic Comedy and Monster Extermination")))))
          (description ()) (is_locked false)
          (links
           (((provider bw) (link series/480105/list))
            ((provider mu) (link sfo0kc0))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-20T11:54:58+00:00)
          (updated_at 2024-07-31T22:53:42+00:00) (version 3)
          (available_translated_languages (en))
          (latest_uploaded_chapter 6edf2cf9-c79f-4815-9240-9ffe0c7246c6)))
        (relationships
         (((id 508249f6-f257-44ed-b9ee-9742b8d0041c) (type_ author))
          ((id eeee8ce2-5cf2-4dd1-93ab-431074454e6b) (type_ author))
          ((id 022b4591-6bfb-4f57-b6fb-93fec7ea30c2) (type_ artist))
          ((id da29fd04-ed35-40db-b283-f48ce319b540) (type_ cover_art))
          ((id f73d34f6-f678-4f8b-9dff-5c759d5fc767) (type_ creator)))))
       ((id d080f85f-a6ef-4e0a-9569-c0709b60d8c0)
        (attributes
         ((title (((language en) (string "Isshou Senkin"))))
          (alt_titles
           ((((language ja)
              (string "\228\184\128\229\139\157\229\141\131\233\135\145")))
            (((language en) (string "STAR: Strike it Rich")))
            (((language en) (string "ST\226\156\176R: Strike it Rich")))
            (((language ru)
              (string
               "\208\151\208\178\208\181\208\183\208\180\208\176: \208\145\208\181\208\185, \208\177\208\190\208\179\208\176\209\130\208\181\208\185")))
            (((language ru)
              (string
               "\208\145\208\181\209\129\209\134\208\181\208\189\208\189\208\176\209\143 \208\159\208\190\208\177\208\181\208\180\208\176")))))
          (description
           (((language en)
             (string
               "\226\128\156Yup! Just as slow as I thought.\226\128\157\
              \n\
              \nAfter retiring from public fighting and getting fired from underground fighting, 27 year old Tenma Nozomi's zest for life is gradually dwindling away. It's hard to be at the bottom with nowhere to go, and that's exactly where she and her two friends are. However, Nozomi hits upon an idea that may just solve all of their problems: they could make their own underground fighting circuit for women, and tap into an underexplored market. As good as that sounds, her insistence on including the unknown quantity Hongou Hina may prove to be more than she bargained for..."))))
          (is_locked false)
          (links
           (((provider al) (link 163923))
            ((provider ap) (link star-strike-it-rich))
            ((provider bw) (link series/435647))
            ((provider kt) (link issho-senkin)) ((provider mu) (link tgfayds))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0CKC8PZYZ))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2890669))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/785834/))
            ((provider mal) (link 158356))
            ((provider raw) (link https://urasunday.com/title/2275))
            ((provider engtl)
             (link https://comikey.com/comics/strike-it-rich-manga/534/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-04-30T16:43:19+00:00)
          (updated_at 2024-04-11T23:55:17+00:00) (version 12)
          (available_translated_languages (pt-br ru fr en))
          (latest_uploaded_chapter 2c1a17fb-a32d-4112-950b-d5c82ffe7892)))
        (relationships
         (((id 8ea90421-0c39-4bcc-b09f-4a0f927f61df) (type_ author))
          ((id a7ebbfc0-d870-4f01-bb6a-3c346d7e4487) (type_ artist))
          ((id 0dfca460-83d3-4297-971d-2c36f5c0607f) (type_ cover_art))
          ((id 2063ced4-bf94-4471-8772-75f6720be008) (type_ manga))
          ((id 44de2381-a8fd-45fc-a4c8-038d0095e098) (type_ manga))
          ((id 885bed69-7d08-47a8-b25c-a37759c97c5f) (type_ manga))
          ((id 0218ac4d-c69e-4670-8ea0-3bb161a3ef8d) (type_ creator)))))
       ((id b4c93297-b32f-4f90-b619-55456a38b0aa)
        (attributes
         ((title (((language en) (string "Fuufu Ijou, Koibito Miman."))))
          (alt_titles
           ((((language ms)
              (string "Melebihi Suami Isteri, Namun Bukan Kekasih.")))
            (((language en)
              (string "More Than A Married Couple, But Not Lovers.")))
            (((language zh)
              (string
               "\229\164\171\229\166\135\228\187\165\228\184\138\239\188\140\230\129\139\228\186\186\230\156\170\230\187\161\227\128\130")))
            (((language ko)
              (string
               "\235\182\128\235\182\128\236\157\180\236\131\129, \236\151\176\236\157\184\235\175\184\235\167\140")))
            (((language ja)
              (string
               "\229\164\171\229\169\166\228\187\165\228\184\138\227\128\129\230\129\139\228\186\186\230\156\170\230\186\128\227\128\130")))
            (((language pt-br)
              (string "Mais do que um casal, menos do que um amante.")))
            (((language th)
              (string
               "\224\185\129\224\184\156\224\184\153\224\184\170\224\184\161\224\184\163\224\184\177\224\184\129\224\185\132\224\184\161\224\185\136\224\184\170\224\184\161\224\185\128\224\184\165\224\184\180\224\184\159")))
            (((language fr)
              (string "Presque mari\195\169s, loin d'\195\170tre amoureux.")))
            (((language de)
              (string "Mehr wie ein Ehepaar, aber weniger als Liebhaber.")))))
          (description
           (((language en)
             (string
              "Jirou, a third-year in high school, is forced to live with a gyaru named Akari under a course called the \"Couple Practical\". In order to be paired with their own romantic interests, they're going to act as a married couple\226\128\166!?"))
            ((language ja)
             (string
              "\233\171\152\230\160\161\228\184\137\229\185\180\231\148\159\227\129\171\227\129\170\227\129\163\227\129\159\230\172\161\233\131\142\227\129\175\227\128\129\227\128\140\229\164\171\229\169\166\229\174\159\231\191\146\227\128\141\227\129\168\227\129\132\227\129\134\230\142\136\230\165\173\227\129\174\228\184\128\231\146\176\227\129\167\233\157\158\227\131\170\227\130\162\229\133\133\227\129\170\232\135\170\229\136\134\227\129\168\227\129\175\230\173\163\229\143\141\229\175\190\227\129\174\229\173\152\229\156\168\227\129\174\227\130\175\227\131\169\227\130\185\227\129\174\227\130\174\227\131\163\227\131\171\227\131\187\230\184\161\232\190\186\230\152\159\227\129\168\228\184\128\231\183\146\227\129\171\230\154\174\227\130\137\227\129\153\227\129\147\227\129\168\227\129\171\227\129\170\227\129\163\227\129\166\227\129\151\227\129\190\227\129\134\227\128\130\227\129\160\227\129\140\227\128\129\227\131\154\227\130\162\227\130\146\229\133\165\227\130\140\230\155\191\227\129\136\227\130\137\227\130\140\227\130\139\229\136\182\229\186\166\227\130\146\231\159\165\227\129\163\227\129\159\228\186\140\228\186\186\227\129\175\227\128\129\227\129\157\227\130\140\227\129\158\227\130\140\227\129\174\229\165\189\227\129\141\227\129\170\228\186\186\227\129\168\228\184\128\231\183\146\227\129\171\227\129\170\227\130\139\227\129\159\227\130\129\227\129\171\231\132\161\231\144\134\231\159\162\231\144\134\227\128\144\229\164\171\229\169\166\227\128\145\227\130\137\227\129\151\227\129\132\228\186\139\227\130\146\230\188\148\227\129\152\227\130\139\227\129\174\227\129\160\227\129\140\226\128\166!?"))
            ((language vi)
             (string
              "Yakuin Jirou, nam sinh n\196\131m ba cao trung. C\225\186\173u ta bu\225\187\153c ph\225\186\163i s\225\187\145ng chung nh\195\160 v\225\187\155i m\225\187\153t g\195\161i Gyaru t\195\170n l\195\160 Watanabe Akari. L\195\189 do l\195\160 v\195\172 \196\145\225\187\163t hu\225\186\165n luy\225\187\135n \226\128\156C\225\186\183p \196\145\195\180i\226\128\156 c\225\187\167a tr\198\176\225\187\157ng m\195\160 hai ng\198\176\225\187\157i h\225\187\141 theo h\225\187\141c. \196\144\225\187\131 \196\145\198\176\225\187\163c s\225\187\145ng v\225\187\155i ng\198\176\225\187\157i t\195\172nh trong m\225\187\153ng c\225\187\167a m\195\172nh, hai ng\198\176\225\187\157i h\225\187\141 ph\225\186\163i \196\145\195\163 l\195\170n k\225\186\191 ho\225\186\161ch s\225\187\145ng c\195\185ng nhau nh\198\176 m\225\187\153t c\225\186\183p v\225\187\163 ch\225\187\147ng."))))
          (is_locked false)
          (links
           (((provider al) (link 105011))
            ((provider ap) (link fuufu-ijou-koibito-miman))
            ((provider bw) (link series/178013)) ((provider kt) (link 54329))
            ((provider mu) (link clae4et))
            ((provider amz) (link https://www.amazon.co.jp/dp/B07Q6MBVZL))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/491867))
            ((provider mal) (link 115848))
            ((provider raw)
             (link
              https://comic-walker.com/contents/detail/KDCW_KS02200254010000_68/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2018))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-08-20T23:13:05+00:00)
          (updated_at 2024-05-04T01:28:11+00:00) (version 39)
          (available_translated_languages (es-la vi fr pt-br en ru ar))
          (latest_uploaded_chapter 843a5511-2452-4220-aa75-d5663b4c24fd)))
        (relationships
         (((id 8dc6fd08-d237-47ac-babf-aba740aacbf0) (type_ author))
          ((id 8dc6fd08-d237-47ac-babf-aba740aacbf0) (type_ artist))
          ((id 2043bc95-4622-40e2-b77b-87e9c795b33c) (type_ cover_art)))))
       ((id 02b80fce-8fd0-46dc-a6e4-a65f701fde4a)
        (attributes
         ((title (((language en) (string "We Are Not Dating!!"))))
          (alt_titles
           ((((language ko)
              (string
               "\236\154\176\235\166\172 \236\149\136 \236\130\172\234\183\128\236\150\180!!")))
            (((language id) (string "Kami Tidak Berpacaran!!")))))
          (description
           (((language en)
             (string
               "\226\128\156Why do you keep asking if we\226\128\153re dating? We\226\128\153re just holding hands, we\226\128\153re not dating!!\226\128\157\
              \nIt\226\128\153s a slice-of-life romantic comedy about couples who aren\226\128\153t really couples!"))
            ((language id)
             (string
               "Sebuah karya baru dari author Webtoon Character Na Kang Lim\
              \n\
              \n\226\128\156Kenapa kamu terus tanya kalau kita pacaran? Kita cuma bergandengan tangan, kita nggak pacaran!!\226\128\157"))))
          (is_locked false)
          (links
           (((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=828670))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-27T12:23:57+00:00)
          (updated_at 2024-07-28T11:58:54+00:00) (version 6)
          (available_translated_languages (id en pt-br))
          (latest_uploaded_chapter 53afd9dc-2f01-4943-a8bf-04c964c29017)))
        (relationships
         (((id af6e66cd-296e-4e3a-9d50-331d2cb9b186) (type_ author))
          ((id f58432c8-f8f2-4914-a108-18373611342c) (type_ artist))
          ((id 6ec92284-2edb-415b-ad76-82177f58caed) (type_ cover_art))
          ((id 38f386ce-f2dc-4f2b-99f9-522eab56078d) (type_ manga))
          ((id 97171bdf-dc27-44ca-a6f3-6bb455fe84c7) (type_ manga))
          ((id a2831e92-858d-40bc-9190-5e7ef87870df) (type_ creator)))))
       ((id 90542072-664e-4e56-b5eb-d7dc5ebfda53)
        (attributes
         ((title (((language en) (string "Celeb Lady"))))
          (alt_titles
           ((((language en) (string "Celebrity Lady")))
            (((language ko)
              (string
               "\236\133\128\235\159\189 \235\160\136\236\157\180\235\148\148")))))
          (description ()) (is_locked false)
          (links (((provider mu) (link 0rqetor)) ((provider mal) (link 172102))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id d14322ac-4d6f-4e9b-afd9-629d5f4d8a41)
             (attributes
              ((name (((language en) (string Villainess)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-14T19:36:51+00:00)
          (updated_at 2024-07-28T16:29:49+00:00) (version 5)
          (available_translated_languages (pl))
          (latest_uploaded_chapter 77356dd8-9a50-41ea-a6c8-253a2569946e)))
        (relationships
         (((id 3e4e312a-e8eb-422e-bd4e-93fa1864fbd9) (type_ author))
          ((id d5b9bb37-1c4b-41bd-82b0-d07fd3e6250e) (type_ author))
          ((id 3e4e312a-e8eb-422e-bd4e-93fa1864fbd9) (type_ artist))
          ((id d5b9bb37-1c4b-41bd-82b0-d07fd3e6250e) (type_ artist))
          ((id 85e556ec-a4f3-47e4-87bd-d2f2d9665573) (type_ cover_art))
          ((id 4344dbf8-a6f3-4840-a961-d53fe7616d92) (type_ creator)))))
       ((id 8516915a-51a2-44e0-a915-aff325216a26)
        (attributes
         ((title
           (((language en)
             (string
              "Otonari no Tenshi-sama ni Itsu no Ma ni ka Dame Ningen ni Sareteita Ken: After the Rain"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\138\233\154\163\227\129\174\229\164\169\228\189\191\230\167\152\227\129\171\227\129\132\227\129\164\227\129\174\233\150\147\227\129\171\227\129\139\233\167\132\231\155\174\228\186\186\233\150\147\227\129\171\227\129\149\227\130\140\227\129\166\227\129\132\227\129\159\228\187\182 after the rain")))
            (((language ja-ro)
              (string
               "Otonari no Tenshi-sama ni Itsu no Ma ni ka Dame Ningen ni Sareteita Ken: After the Rain")))
            (((language pt-br)
              (string "Meu Anjo de Vizinha Me Mima Demais: After the Rain")))
            (((language ru)
              (string
               "\208\144\208\189\208\179\208\181\208\187 \208\191\208\190 \209\129\208\190\209\129\208\181\208\180\209\129\209\130\208\178\209\131: \208\159\208\190\209\129\208\187\208\181 \208\180\208\190\208\182\208\180\209\143")))
            (((language en)
              (string "The Angel Next Door Spoils Me Rotten: After the Rain")))))
          (description
           (((language en)
             (string
              "A spin-off of the series *[The Angel Next Door Spoils Me Rotten](https://mangadex.org/title/2fec6641-beb1-4ae9-a32f-204dd06688ac/the-angel-next-door-spoils-me-rotten)* which comicalizes the stories from Volume 5.5 of the Light Novel and its special edition booklet, which contains additional short stories."))))
          (is_locked false)
          (links
           (((provider al) (link 176688))
            ((provider ap)
             (link the-angel-next-door-spoils-me-rotten-after-the-rain))
            ((provider nu)
             (link
              otonari-no-tenshi-sama-ni-itsu-no-ma-ni-ka-dame-ningen-ni-sareteita-ken-wn))
            ((provider mal) (link 165540))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-12-01T11:15:27+00:00)
          (updated_at 2024-06-06T14:31:25+00:00) (version 12)
          (available_translated_languages (en pt-br vi ru es-la id))
          (latest_uploaded_chapter ccc7ed16-6389-4bc9-bd90-4f5976658673)))
        (relationships
         (((id 0edd2663-49bc-48d6-a05c-c92a655b9c13) (type_ author))
          ((id c3748421-5c52-4dfe-87a1-0d2f82a8c90b) (type_ artist))
          ((id 5420c94f-adc2-448b-869f-058c0b75f804) (type_ cover_art))
          ((id 2fec6641-beb1-4ae9-a32f-204dd06688ac) (type_ manga))
          ((id 3b104396-c617-4ea2-95ac-b40e17df8b9d) (type_ creator)))))
       ((id 4c2b7c0d-f97b-4044-b94a-638d99e92d24)
        (attributes
         ((title (((language en) (string "Hana Yori Dango: Boys Over Flowers"))))
          (alt_titles
           ((((language en) (string "Boys Over Flowers: Jewelry Box")))
            (((language vi) (string "Con Nh\195\160 Gi\195\160u")))
            (((language en) (string "Dumplings Over Flowers")))
            (((language ja-ro) (string HanaDan)))
            (((language en) (string "Meteor Garden")))
            (((language es) (string "No me lo digas con flores")))
            (((language ja)
              (string "\230\181\129\230\152\159\232\138\177\229\155\173")))
            (((language ja)
              (string
               "\232\138\177\227\130\136\227\130\138\231\148\183\229\173\144")))
            (((language zh-hk)
              (string "\232\138\177\230\160\183\231\148\183\229\173\144")))
            (((language ko)
              (string
               "\234\189\131\235\179\180\235\139\164 \235\130\168\236\158\144")))))
          (description
           (((language en)
             (string
               "Eitoku Academy is a school that caters to children and from rich, high-society families. Hence, Makino, who comes from a poor family, is considered by others as the \"weed\" of the school. The school is ruled by the \"Flower Four\" group, more commonly known as the F4. The F4 leader, and son of the wealthiest, most powerful family in Japan, Domyouji Tsukasa, takes an interest in Tsukushi because she is the only girl at Eitoku who does not fawn over him. However, his hot-headed nature and bullying ways are originally a major turn-off for Tsukushi, who has her sights set on Rui Hanazawa.  \
              \n  \
              \nVolume 37 is comprised of three short stories that happen after the ending"))))
          (is_locked false)
          (links
           (((provider al) (link 30877)) ((provider ap) (link boys-over-flowers))
            ((provider kt) (link 1908)) ((provider mu) (link 328))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B075713DR2))
            ((provider mal) (link 877))
            ((provider raw) (link https://www.viz.com/boys-over-flowers))))
          (original_language ja) (last_volume (37)) (last_chapter (241.5))
          (publication_demographic (shoujo)) (status completed) (year (1992))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 65761a2a-415e-47f3-bef2-a9dababba7a6)
             (attributes
              ((name (((language en) (string "Reverse Harem")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-04-04T10:13:32+00:00)
          (updated_at 2023-08-06T10:18:06+00:00) (version 6)
          (available_translated_languages (en pl pt-br))
          (latest_uploaded_chapter ce70bf0c-e00b-4428-b46f-8c6c832e2fd2)))
        (relationships
         (((id 048c3679-7fd9-4cfa-ac0a-a5f21f84bd55) (type_ author))
          ((id 048c3679-7fd9-4cfa-ac0a-a5f21f84bd55) (type_ artist))
          ((id e7658df1-ca95-4f35-adbf-30f8fa55747b) (type_ cover_art))
          ((id 64f52610-002a-42a1-bfad-7e12eb1db6d4) (type_ manga))
          ((id 9fe53dd0-ce6d-4cb3-9cd8-acfcba8aea7f) (type_ manga))
          ((id bf895b69-de0e-4f32-bdbd-dccd98c4c461) (type_ manga))
          ((id cbfe42c7-6303-4b25-9bad-adeb460df88e) (type_ manga)))))
       ((id 9ecd208c-c592-4462-9f57-4d7d4a9f956f)
        (attributes
         ((title (((language en) (string "Mercenary Enrollment"))))
          (alt_titles
           ((((language ko)
              (string "\236\158\133\237\149\153\236\154\169\235\179\145")))
            (((language ko-ro) (string Ipagyongbyeong)))
            (((language en) (string "Teenage Mercenary")))
            (((language de) (string "S\195\182ldnereinschreibung")))
            (((language fr) (string "High School Mercenary")))
            (((language es) (string "Mercenario adolescente")))
            (((language ja)
              (string "\229\133\165\229\173\166\229\130\173\229\133\181")))
            (((language zh)
              (string "\229\176\145\229\185\180\228\189\163\229\133\181")))
            (((language zh-hk)
              (string "\229\133\165\229\173\184\229\130\173\229\133\181")))
            (((language th)
              (string
               "\224\184\158\224\184\181\224\185\136\224\184\138\224\184\178\224\184\162\224\184\170\224\184\178\224\184\162\224\184\154\224\184\173\224\184\148\224\184\181\224\185\137\224\184\129\224\184\178\224\184\163\224\185\140\224\184\148")))
            (((language id) (string "High School Soldier")))
            (((language id) (string "Tentara Menyamar Jadi Anak SMA")))
            (((language pt-br) (string "Mercen\195\161rio Adolescente")))))
          (description
           (((language de)
             (string
               "Im Alter von acht Jahren verlor Ijin Yoo seine Eltern bei einem Flugzeugabsturz und strandete in einem fremden Land, wo er gezwungen war, ein Kinders\195\182ldner zu werden, um zu \195\188berleben. Zehn Jahre sp\195\164ter kehrt er nach Hause zur\195\188ck, um mit seiner Familie in Korea wieder vereint zu sein. Dort scheint alles friedlich zu sein, doch schon bald muss Ijin feststellen, dass das Leben als Teenager eine ganz andere Art des \195\156berlebens ist. Da ihm nur noch ein Jahr in der Oberschule bleibt, muss Ijin neue Taktiken erlernen, um sich auf dem Schlachtfeld der Schule zurechtzufinden. Kann er ein Jahr Oberschule \195\188berleben? Oder wird die Schule vielmehr in der Lage sein, IHN zu \195\188berleben?\
              \n\
              \n---\
              \nDie Geschichte handelt von einem jungen Koreaner, der bei einem Flugzeugabsturz seine Eltern verloren hat. Das Kind landet irgendwie in einem vom Krieg zerrissenen Teil der Welt und wird zu einem Top-S\195\182ldner im Teenageralter. Irgendwie findet er seine Familie wieder und beschlie\195\159en, ein ruhiges Leben mit seiner Familie zu f\195\188hren.\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language en)
             (string
               "At the age of eight, Ijin Yu lost his parents in a plane crash and became stranded in a foreign land, forced to become a child mercenary in order to stay alive. He returns home ten years later to be reunited with his family in Korea, where food and shelter are plenty and everything seems peaceful. But Ijin will soon learn that life as a teenager is a whole other feat of survival. With only one year of high school left, Ijin must master new tactics to maneuver his way around the schoolhouse battleground.\
              \n\
              \nCan he survive a year of high school? Or rather, will the school be able to survive him?"))
            ((language es)
             (string
               "A los ocho a\195\177os, Ijin Yu perdi\195\179 a sus padres en un accidente a\195\169reo y qued\195\179 varado en un pa\195\173s extranjero, forzado a convertirse en mercenario para sobrevivir. Diez a\195\177os despu\195\169s, regresa a su hogar para reunirse con su familia en Corea, en donde sobra la comida y todo parece estar en paz. Sin embargo, Ijin pronto descubrir\195\161 que la vida de adolescente es otro tipo de supervivencia. En su \195\186ltimo a\195\177o de secundaria, Ijin debe dominar nuevas t\195\161cticas para resistir en el campo de batalla escolar. \194\191Podr\195\161 sobrevivir a su \195\186ltimo a\195\177o? \194\191O podr\195\161 su escuela sobrevivir a \195\169l?\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language fr)
             (string
               "Ijin est un jeune mercenaire qui est le seul survivant d\226\128\153un accident d\226\128\153avion survenu dans son enfance. Il vient tout juste de retourner aupr\195\168s de sa famille qui le croyait mort durant ses 10 ans d\226\128\153absence. Ijin pourra-t-il mettre de c\195\180t\195\169 son pass\195\169 sombre et mener une vie normale de lyc\195\169en?\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language hu)
             (string
               "Yu Ijin volt az egyetlen t\195\186l\195\169l\197\145je egy rep\195\188l\197\145g\195\169p-szerencs\195\169tlens\195\169gnek, amikor m\195\169g kicsi volt. Miut\195\161n zsoldosnak \195\161llt, hogy 10 \195\169vig t\195\186l\195\169ljen, visszat\195\169r a csal\195\161dj\195\161hoz a sz\195\188l\197\145v\195\161ros\195\161ba.\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language id)
             (string
               "Yoo Leejin, satu-satunya orang yang hidup dari kecelakaan pesawat terbang, harus bekerja sebagai tentara bayaran selama 10 tahun. Tapi akhirnya dia kembali ke tempat asalnya dan memulai kehidupan baru sabagai anak SMA biasa. Apakah dia bisa bersekolah dengan normal?\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language ko)
             (string
               "\236\150\180\235\166\176 \236\139\156\236\160\136 \235\185\132\237\150\137\234\184\176 \236\182\148\235\157\189 \236\130\172\234\179\160\236\157\152 \236\156\160\236\157\188\237\149\156 \236\131\157\236\161\180\236\158\144 \236\156\160\236\157\180\236\167\132.  \
              \n\236\130\180\236\149\132\235\130\168\234\184\176 \236\156\132\237\149\180 \236\154\169\235\179\145\236\156\188\235\161\156 \236\130\180\236\149\132\234\176\128\235\141\152 \236\156\160\236\157\180\236\167\132\236\157\128 10\235\133\132 \237\155\132, \234\176\128\236\161\177\236\157\180 \236\158\136\235\138\148 \234\179\160\237\150\165\236\156\188\235\161\156 \235\143\140\236\149\132\236\153\148\235\139\164.\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language th)
             (string
               "\224\184\162\224\184\185\224\184\173\224\184\181\224\184\136\224\184\180\224\184\153 \224\185\128\224\184\148\224\185\135\224\184\129\224\184\171\224\184\153\224\184\184\224\185\136\224\184\161\224\184\156\224\184\185\224\185\137\224\184\163\224\184\173\224\184\148\224\184\149\224\184\178\224\184\162\224\184\136\224\184\178\224\184\129\224\184\173\224\184\184\224\184\154\224\184\177\224\184\149\224\184\180\224\185\128\224\184\171\224\184\149\224\184\184\224\185\128\224\184\132\224\184\163\224\184\183\224\185\136\224\184\173\224\184\135\224\184\154\224\184\180\224\184\153\224\184\149\224\184\129\224\185\129\224\184\165\224\184\176\224\185\131\224\184\138\224\185\137\224\184\138\224\184\181\224\184\167\224\184\180\224\184\149\224\185\128\224\184\155\224\185\135\224\184\153\224\184\151\224\184\171\224\184\178\224\184\163\224\184\161\224\184\178\224\184\153\224\184\177\224\184\154\224\185\129\224\184\149\224\185\136\224\184\153\224\184\177\224\185\137\224\184\153\224\185\132\224\184\148\224\185\137\224\184\129\224\184\165\224\184\177\224\184\154\224\184\161\224\184\178\224\184\171\224\184\178\224\184\132\224\184\163\224\184\173\224\184\154\224\184\132\224\184\163\224\184\177\224\184\167\224\184\130\224\184\173\224\184\135\224\185\128\224\184\130\224\184\178\224\185\131\224\184\153\224\184\151\224\184\181\224\185\136\224\184\170\224\184\184\224\184\148\224\184\171\224\184\165\224\184\177\224\184\135\224\184\136\224\184\178\224\184\129\224\184\156\224\185\136\224\184\178\224\184\153\224\185\128\224\184\167\224\184\165\224\184\178\224\185\132\224\184\155\224\185\128\224\184\155\224\185\135\224\184\153\224\184\170\224\184\180\224\184\154\224\184\155\224\184\181\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language zh)
             (string
               "\232\182\133\229\188\186\229\176\145\229\185\180\228\189\163\229\133\181\229\189\146\230\157\165\239\188\129\
              \n\230\172\186\232\180\159\230\136\145\229\166\185\231\154\132\228\184\128\228\184\170\233\131\189\228\184\141\229\135\134\232\183\145\239\188\129\
              \n\
              \n\229\185\188\229\185\180\233\129\173\233\129\135\233\163\158\230\156\186\229\164\177\228\186\139\239\188\140\230\136\144\228\184\186\229\148\175\228\184\128\229\185\184\229\173\152\232\128\133\231\154\132\230\159\179\228\186\166\231\156\159\239\188\140\228\184\186\228\186\134\231\148\159\229\173\152\230\136\144\228\184\186\228\186\134\228\189\163\229\133\181\227\128\130\229\141\129\229\185\180\229\144\142\239\188\140\229\155\160\229\129\182\231\132\182\231\154\132\229\165\145\230\156\186\229\190\151\228\187\165\229\155\158\229\136\176\230\149\133\228\185\161\228\184\138\229\173\166\229\185\182\230\137\190\229\155\158\228\186\134\232\135\170\229\183\177\231\154\132\229\174\182\228\186\186\227\128\130\230\173\163\229\189\147\228\187\150\228\184\186\229\164\177\232\128\140\229\164\141\229\190\151\231\154\132\229\174\182\228\186\186\230\132\159\229\136\176\229\185\184\231\166\143\239\188\140\228\184\186\229\174\137\233\128\184\231\154\132\231\148\159\230\180\187\230\132\159\229\136\176\230\172\163\229\150\156\230\151\182\239\188\140\229\141\180\229\143\145\231\142\176\228\186\139\230\131\133\229\185\182\228\184\141\229\166\130\228\187\150\230\137\128\230\132\191\227\128\130\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language pt-br)
             (string
               "Yu Ijin foi o \195\186nico sobrevivente de uma queda de avi\195\163o quando ainda era crian\195\167a. Depois de se tornar um mercen\195\161rio por 10 anos para sobreviver, ele retornou para sua fam\195\173lia em sua cidade natal.\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))
            ((language zh-hk)
             (string
               "\227\128\138\229\164\167\232\178\180\230\151\143\227\128\139\229\173\171\233\189\138\230\153\167\228\189\156\229\174\182\231\154\132\230\150\176\228\189\156\239\188\129 \229\185\188\229\185\180\230\153\130\239\188\140\233\163\155\230\169\159\229\162\156\230\175\128\228\186\139\230\149\133\231\154\132\229\148\175\228\184\128\229\128\150\229\173\152\232\128\133\229\138\137\231\144\134\231\156\159\239\188\140\231\136\178\228\186\134\231\148\159\229\173\152\228\187\165\229\130\173\229\133\181\231\148\159\230\180\187\231\154\132\229\138\137\231\144\134\231\156\159\239\188\14010\229\185\180\229\190\140\229\155\158\229\136\176\228\186\134\230\156\137\229\174\182\228\186\186\231\154\132\230\149\133\233\132\137\227\128\130\
              \n\
              \n---\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=5611024), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=758150)\
              \n\
              \n**Official Translations:**\
              \n* [English](https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677)\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://dongmanmanhua.cn/BOY/shaonianyongbing/list?title_no=1575)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/mercenary-soldier/list?title_no=2416)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/high-school-mercenary/list?title_no=2678)\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/teenage-mercenary/list?title_no=3732)\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/action/high-school-soldier/list?title_no=2367)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0001139)\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/teenage-mercenary/list?title_no=3252)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/high-school-soldier/list?title_no=2438)"))))
          (is_locked false)
          (links
           (((provider al) (link 126297))
            ((provider ap) (link mercenary-enrollment))
            ((provider kt) (link 58010)) ((provider mu) (link 173705))
            ((provider mal) (link 146966))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=758150))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/action/teenage-mercenary/list?title_no=2677))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 5ca48985-9a9d-4bd8-be29-80dc0303db72)
             (attributes
              ((name (((language en) (string Crime)))) (group genre) (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-12-08T05:36:37+00:00)
          (updated_at 2024-01-30T23:47:15+00:00) (version 35)
          (available_translated_languages (en es-la pl it pt-br fr id hu ar))
          (latest_uploaded_chapter 92388ba8-6082-4bdc-87df-d1972808c2ba)))
        (relationships
         (((id d09ea72d-1230-41b5-bc84-0160b330ee40) (type_ author))
          ((id fc488488-ceb0-4d36-addd-29b482e043b2) (type_ artist))
          ((id 5f9918e7-1f60-4fa2-ada8-67d10f16bc4c) (type_ cover_art)))))
       ((id 1f0dc922-32a8-4ac6-8a14-c94f7fbb4aab)
        (attributes
         ((title (((language en) (string "A Flame Reborn"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\169\184\235\167\157\237\149\156 \234\176\128\235\172\184\236\157\152 \237\154\140\234\183\128\236\158\144")))
            (((language en) (string "Returner of a Ruined Family")))
            (((language en) (string "Regressor of the Fallen Family")))
            (((language fr)
              (string "Le r\195\169gresseur de la famille d\195\169chue")))
            (((language es-la) (string "Regresor de la familia ca\195\173da")))))
          (description
           (((language en)
             (string
               "Logan McLain, a middle-aged knight fighting for the independence army, is intent on getting revenge against the empire which took over the kingdom and executed his brother when he ends up dying in battle. But when he wakes, he is a young man again, and has yet to be disowned for his terrible behavior. \
              \n\
              \nUsing his experience and knowledge from his past life, Logan recruits a few talented individuals to develop new weapons, build an army, and make enough money to fund it all. \
              \n\
              \nBut will he be able to make amends with his family and stop the empire's march?"))
            ((language ko)
             (string
               "\237\155\132\237\154\140\235\161\156\235\167\140 \234\176\128\235\147\157\237\149\156 \236\131\157.\
              \n\
              \n\236\138\164\236\138\164\235\161\156\236\157\152 \236\158\152\235\170\187\236\157\132 \234\185\168\235\139\171\234\179\160 \235\139\164\236\139\156 \236\130\172\235\158\140\236\157\180 \235\144\152\234\179\160\236\158\144 \237\150\136\236\157\132 \235\149\140,\
              \n\236\157\180\235\175\184 \234\176\128\235\172\184\236\157\128 \235\182\136\237\131\128 \236\130\172\235\157\188\236\167\132 \235\146\164\236\152\128\235\139\164.\
              \n\
              \n\235\176\156\236\149\133 \234\176\153\236\157\128 \235\182\132\235\133\184\235\161\156 \237\149\152\235\163\168\237\149\152\235\163\168 \236\151\176\235\170\133\237\149\152\235\141\152 \236\130\182.\
              \n\234\183\184 \236\160\136\235\167\157\236\157\152 \235\129\157\236\151\144\236\132\156, \234\176\132\236\160\136\237\149\156 \236\151\188\236\155\144\236\157\180 \237\149\152\235\138\152\236\151\144 \235\139\191\236\149\152\235\139\164.\
              \n\
              \n\236\154\169\236\132\156\235\176\155\236\167\128 \235\170\187\237\149\156 \236\158\144.\
              \n\236\154\180\235\170\133\236\157\132 \234\177\176\236\138\172\235\159\172 \234\178\128\236\157\132 \235\147\164\235\139\164."))))
          (is_locked false)
          (links
           (((provider mu) (link e401aci)) ((provider mal) (link 169830))
            ((provider raw)
             (link
              https://series.naver.com/comic/detail.series?productNo=10580540))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/action/a-flame-reborn/list?title_no=6412))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 292e862b-2d17-4062-90a2-0356caa4ae27)
             (attributes
              ((name (((language en) (string "Time Travel")))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-02-07T14:11:55+00:00)
          (updated_at 2024-06-29T00:59:16+00:00) (version 6)
          (available_translated_languages (en es-la))
          (latest_uploaded_chapter 8df14c21-3155-4ffa-89d0-faf372b7b744)))
        (relationships
         (((id 6a88e9e6-cccb-4567-9e4b-1c251d0636b6) (type_ author))
          ((id e02ad90a-d357-46a0-8121-b0d2bd61411f) (type_ author))
          ((id 1442d81a-cd22-4c09-a5a0-764c7d0e63b4) (type_ artist))
          ((id c2685249-7131-4968-bc36-ae6ba5b42775) (type_ cover_art))
          ((id dc114c41-d113-4f6e-88bf-5cefb6cf7263) (type_ creator)))))
       ((id feff4eaf-01df-4a05-83f4-68bb5cdf4fad)
        (attributes
         ((title (((language en) (string "Mahou Shoujo ni Akogarete"))))
          (alt_titles
           ((((language en) (string "Looking up to Magical Girls")))
            (((language id) (string "Aku menyukai Magical Girls, tapi....")))
            (((language ru)
              (string
               "\208\161\209\130\209\128\208\181\208\188\209\143\209\129\209\140 \209\129\209\130\208\176\209\130\209\140 \208\180\208\181\208\178\208\190\209\135\208\186\208\190\208\185-\208\178\208\190\208\187\209\136\208\181\208\177\208\189\208\184\209\134\208\181\208\185")))
            (((language ja)
              (string
               "\233\173\148\230\179\149\229\176\145\229\165\179\227\129\171\227\129\130\227\129\147\227\129\140\227\130\140\227\129\166")))
            (((language zh-ro)
              (string
               "Ch\197\141ngj\199\144ng ch\195\169ngw\195\169i m\195\179f\199\142 sh\195\160on\199\154")))
            (((language zh)
              (string
               "\230\134\167\230\134\172\230\136\144\228\184\186\233\173\148\230\179\149\229\176\145\229\165\179")))
            (((language zh-hk)
              (string
               "\230\134\167\230\134\172\230\136\144\231\130\186\233\173\148\230\179\149\229\176\145\229\165\179")))
            (((language it) (string "Le mie adorate maghette")))
            (((language en) (string "I Admire Magical Girls, and...")))
            (((language en) (string "Gushing over Magical Girls")))
            (((language fr) (string "Looking up to Magical Girls")))
            (((language uk)
              (string
               "\208\175 \208\183\208\176\209\133\208\190\208\191\208\187\209\142\209\142\209\129\209\143 \209\135\208\176\209\128\209\150\208\178\208\189\208\184\208\188\208\184 \208\180\208\178\209\150\209\135\208\176\209\130\208\176\208\188\208\184 \209\150...")))))
          (description
           (((language en)
             (string
               "Hiiragi Utena, a girl who loves Magical Girls, lives her ordinary everyday life wishing to be like them. One day a curious character appears in front of her and offers her the power to make her wishes come true, but\226\128\166  \
              \nMagical Girls vs. The Forces of Evil, the fierce battle begins!  \
              \n\
              \n---\
              \n**Links:**\
              \n\
              \n- [Alternative Official Release by Coolmic](https://coolmic.me/titles/1110)"))
            ((language fr)
             (string
               "**Je fais des choses tellement horribles \195\160 mes Magical Girls pr\195\169f\195\169r\195\169es !**\
              \n\
              \nMoi, c\226\128\153est Utena Hiiragi, et comme toutes les filles de mon \195\162ge, j\226\128\153adore les magical girls !\
              \nUn jour, une \195\169trange cr\195\169ature aux allures de mascotte m\226\128\153a lanc\195\169 un sort, et je suis devenue capable de me transformer, moi aussi !\
              \nJe vais pouvoir me battre aux c\195\180t\195\169s de mes h\195\169ro\195\175nes pr\195\169f\195\169r\195\169es !\
              \nEnfin, c\226\128\153est ce que je croyais\226\128\166\
              \n\
              \nC\226\128\153est quoi, cette tenue scandaleuse ?\
              \nEt comment \195\167a, je suis au service du Mal ?!\
              \n\
              \nMais qu\226\128\153est-ce que c\226\128\153est que cette histoire ?!\
              \n\
              \n**La com\195\169die BDSM dans laquelle s\226\128\153affrontent des Magical Girls !!**\
              \n\
              \n**Avec ses personnages tous plus fous les uns que les autres, Looking Up to Magical Girls balaye les genres et nous place du c\195\180t\195\169 du mal ! Akihiro Ononaka d\195\169ploie tout l\226\128\153arsenal BDSM \195\160 sa disposition pour nous proposer un concentr\195\169 d\226\128\153humour l\195\169g\195\168rement sexy et compl\195\168tement d\195\169jant\195\169 !**\
              \n\
              \n---\
              \n**Links:**\
              \n- [Official French](https://www.amazon.fr/Looking-up-Magical-Girls-1/dp/2382750731/)"))
            ((language uk)
             (string
              "\208\165\209\150\209\150\209\128\208\176\210\145\209\150 \208\163\209\130\208\181\208\189\208\176 \208\183\208\176\208\178\208\182\208\180\208\184 \208\183\208\176\209\133\208\190\208\191\208\187\209\142\208\178\208\176\208\187\208\176\209\129\209\143 \209\135\208\176\209\128\209\150\208\178\208\189\208\184\208\188\208\184 \208\180\209\150\208\178\209\135\208\176\209\130\208\176\208\188\208\184 \209\150 \208\188\209\128\209\150\209\143\208\187\208\176 \208\191\208\181\209\128\208\181\209\130\208\178\208\190\209\128\208\184\209\130\208\184\209\129\209\143 \208\189\208\176 \208\186\209\128\209\131\209\130\209\131 \208\179\208\181\209\128\208\190\209\151\208\189\209\142, \209\143\208\186\208\176 \208\177\208\190\209\128\208\181\209\130\209\140\209\129\209\143 \208\183\209\150 \208\183\208\187\208\190\208\188. \208\162\208\190\208\182, \208\186\208\190\208\187\208\184 \208\190\208\180\208\189\208\190\208\179\208\190 \208\178\208\181\209\135\208\190\209\128\208\176 \208\180\208\190 \208\189\208\181\209\151 \208\191\209\150\208\180\209\133\208\190\208\180\208\184\209\130\209\140 \209\130\208\176\208\187\209\150\209\129\208\188\208\176\208\189, \209\143\208\186\208\176 \209\129\209\130\208\178\208\181\209\128\208\180\208\182\209\131\209\148, \209\137\208\190 \208\178 \208\189\209\150\208\185 \208\180\209\128\209\150\208\188\208\176\209\148 \208\188\208\176\208\179\209\150\209\135\208\189\208\176 \209\129\208\184\208\187\208\176, \208\178\208\190\208\189\208\176 \209\130\209\128\208\181\208\188\209\130\208\184\209\130\209\140 \208\178\209\150\208\180 \209\133\208\178\208\184\208\187\209\142\208\178\208\176\208\189\208\189\209\143. \208\144\208\187\208\181 \209\151\209\151 \208\177\208\176\209\128\208\178\208\184\209\129\209\130\208\176 \208\188\209\128\209\150\209\143 \209\136\208\178\208\184\208\180\208\186\208\190 \209\128\208\190\208\183\208\177\208\184\208\178\208\176\209\148\209\130\209\140\209\129\209\143 \208\190\208\177 \209\150\209\128\208\190\208\189\209\150\209\135\208\189\208\184\208\185 \208\191\208\190\208\178\208\190\209\128\208\190\209\130 \208\191\208\190\208\180\209\150\208\185, \208\186\208\190\208\187\208\184 \208\178\208\190\208\189\208\176 \208\191\208\181\209\128\208\181\209\130\208\178\208\190\209\128\209\142\209\148\209\130\209\140\209\129\209\143 \208\189\208\176 \208\187\208\184\209\133\208\190\208\180\209\150\208\185\208\186\209\131!"))
            ((language es-la)
             (string
               "Hiiragi Utena, una chica que ama a las Chicas M\195\161gicas, vive su vida cotidiana y desea ser como ellas.\
              \nUn d\195\173a aparece un personaje curioso frente a ella y le ofrece el poder de hacer realidad sus deseos, pero...\
              \nMagical Girls vs. The Forces of Evil, \194\161comienza la feroz batalla!"))
            ((language pt-br)
             (string
              "Hiiragi Utena \195\169 uma garota apaixonada por Mahou Shoujo que sonhava em se tornar uma delas e poder lutar ao lado de sua hero\195\173na favorita. Certo dia, um mascote inesperadamente apareceu ao seu lado e lan\195\167ou uma feiti\195\167o em Hiiragi, oferecendo a ela a oportunidade de estar de frente para sua \195\173dolo. Entretanto, diferente do que ela esperava, a transforma\195\167\195\163o a fez virar uma vil\195\163 ao inv\195\169s de uma mahou shoujo. Para piorar, a mudan\195\167a faz com que ela deixe de ser uma t\195\173mida garota e passe a ser uma dominatrix s\195\161dica. Agora Hiiragi precisar\195\161 lidar com sua nova \226\128\156profiss\195\163o\226\128\157, ao mesmo tempo que tenta aproveitar os momentos ao lado de sua hero\195\173na, por mais que seja para tentar tortur\195\161-la."))))
          (is_locked false)
          (links
           (((provider al) (link 109017))
            ((provider ap) (link mahou-shoujo-ni-akogarete))
            ((provider bw) (link series/229607/list))
            ((provider kt) (link 54948)) ((provider mu) (link 153690))
            ((provider amz) (link https://www.amazon.co.jp/dp/B08C6DLXWV))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2418063))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/568858))
            ((provider mal) (link 120680))
            ((provider raw) (link http://storia.takeshobo.co.jp/manga/mahoako))
            ((provider engtl)
             (link https://j-novel.club/series/gushing-over-magical-girls))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status hiatus) (year (2019))
          (content_rating erotica)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 7064a261-a137-4d3a-8848-2d385de3a99c)
             (attributes
              ((name (((language en) (string Superhero)))) (group genre)
               (version 1))))
            ((id 81c836c9-914a-4eca-981a-560dad663e73)
             (attributes
              ((name (((language en) (string "Magical Girls")))) (group genre)
               (version 1))))
            ((id 97893a4c-12af-4dac-b6be-0dffb353568e)
             (attributes
              ((name (((language en) (string "Sexual Violence"))))
               (group content) (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-11-26T03:02:55+00:00)
          (updated_at 2024-06-01T21:43:44+00:00) (version 104)
          (available_translated_languages (es-la en ar pt-br uk fr id tr ru hu))
          (latest_uploaded_chapter dd7d5c17-5e1f-4a44-8c92-303e2049f0d0)))
        (relationships
         (((id 576570d9-01cc-4a29-a6e1-d9f0c0c5b647) (type_ author))
          ((id 576570d9-01cc-4a29-a6e1-d9f0c0c5b647) (type_ artist))
          ((id 03c8e249-f446-4f6c-b859-9d60eada9603) (type_ cover_art))
          ((id 265d8091-f6b1-48b4-ab13-88a8f320574a) (type_ manga))
          ((id 69989488-0b8e-4ef7-8a83-9ea2ba3801f5) (type_ manga))
          ((id f1dec333-f6cb-4243-9968-2270e9dfb479) (type_ manga)))))
       ((id d8323b7b-9a7a-462b-90f0-2759fed52511)
        (attributes
         ((title (((language en) (string "Dosanko Gal wa Namaramenkoi"))))
          (alt_titles
           ((((language ja)
              (string
               "\233\129\147\231\148\163\229\173\144\227\130\174\227\131\163\227\131\171\227\129\175\227\129\170\227\129\190\227\130\137\227\130\129\227\130\147\227\129\147\227\129\132")))
            (((language ru)
              (string
               "\208\148\208\190\209\129\208\176\208\189\208\186\208\190-\208\179\209\143\209\128\209\131 \209\135\209\131\208\180\208\190 \208\186\208\176\208\186 \208\188\208\184\208\187\209\139")))
            (((language ko)
              (string
               "\235\143\132\236\130\176\236\189\148 \234\176\184\235\163\168\235\138\148 \236\176\184\235\167\144\235\161\156 \234\183\128\236\151\172\236\155\140")))
            (((language uk)
              (string
               "\208\148\208\190\209\129\208\176\208\189\208\186\208\190-\208\179\209\143\209\128\209\131 \209\129\209\130\209\128\208\176\209\133 \209\143\208\186\209\150 \208\179\208\176\209\128\208\189\208\181\208\189\209\140\208\186\209\150")))
            (((language es) (string "Esa gal de Hokkaido es demasiado linda")))
            (((language en) (string "Hokkaido Gals are Super Adorable!")))
            (((language pt-br)
              (string "Gyarus de Hokkaido s\195\163o ador\195\161veis!")))
            (((language tr)
              (string
               "Hokkaido'nun Gyaru K\196\177zlar\196\177 Acayip G\195\188zel!")))))
          (description
           (((language en)
             (string
              "Shiki Tsubasa has just moved from Tokyo to Hokkaido in the middle of winter. Not quite appreciating how far apart towns are in the country, he gets off the taxi at the next town over from his destination so he can see the sights around his home, but he is shocked when he learns the \"next town\" is a 3-hour walk away. However, he also meets a cute Dosanko (born and raised in Hokkaido) gyaru named Fuyuki Minami who is braving 8 degrees celcius below 0 weather in the standard gyaru outfit of short skirts and bare legs!"))
            ((language es)
             (string
               "Tsubasa es un chico que se va vivir desde Tokyo a Hokkaido en pleno invierno porque han trasladado a su padre. En su antiguo instituto no era nada popular y se met\195\173an con \195\169l siempre que pod\195\173an. Dispuesto a empezar una nueva vida, llega en taxi entre un paisaje nevado y se baja a las primeras de cambio pensando que ya ha llegado.\
              \n\
              \nPero pronto se da cuenta de que en Hokkaido las cosas son diferentes que en la gran ciudad y aqu\195\173 las distancias son mucho mayores, as\195\173 que el sitio al que iba est\195\161 a tres horas andando: eso significa que se ha quedado tirado en medio de la nieve. El impacto es mayor cuando se encuentra con Minami Fuyuki, una chica vestida como la t\195\173pica gal pese al fr\195\173o que hace.\
              \n\
              \nMinami no s\195\179lo es guapa, sino que es una chica supermaja y con las maneras de una gal, un crush instant\195\161neo para Tsubasa, aunque el combo de gal m\195\161s chica de pueblo lo deja bastante perplejo y m\195\161s cuando se entera de que van al mismo instituto. Gracias a Minami podr\195\161 integrarse bastante r\195\161pido y conocer a otras gals, aunque el choque cultural a varios niveles est\195\161 servido. \194\161Sus d\195\173as de gals, fr\195\173o y diversi\195\179n acaban de empezar!"))
            ((language fr)
             (string
               "Natsukawa Tsubasa vient de d\195\169m\195\169nager de Tokyo \195\160 Hokkaido, en plein hiver. Ne se rendant pas compte de la r\195\169alit\195\169 des distances \195\160 la campagne, il se retrouve perdu \195\160 3 heures de marche de sa destination. Mais il fait \195\169galement la rencontre d\226\128\153une Dosanko (\194\171 n\195\169e et \195\169lev\195\169e \195\160 Hokkaido \194\187) gyaru, en minijupe par \226\128\147 8\194\176C !  \
              \n\
              \n\
              \n---\
              \n\
              \n**Links:**  \
              \n- [Author's Twitter](https://twitter.com/ikada_kai) | [Author's YouTube channel](https://www.youtube.com/channel/UC-U4OJu-cEF2VlnM61B77bQ) | [Author's Pixiv](https://www.pixiv.net/en/users/21326958)"))
            ((language ru)
             (string
               "\208\157\208\176\209\134\209\131\208\186\208\176\208\178\208\176 \208\166\209\131\208\177\208\176\209\129\208\176 \209\130\208\190\208\187\209\140\208\186\208\190 \209\135\209\130\208\190 \208\191\208\181\209\128\208\181\208\181\209\133\208\176\208\187 \208\184\208\183 \208\162\208\190\208\186\208\184\208\190 \208\189\208\176 \208\165\208\190\208\186\208\186\208\176\208\185\208\180\208\190. \194\160\208\157\208\181 \208\184\208\188\208\181\209\143 \208\191\209\128\208\181\208\180\209\129\209\130\208\176\208\178\208\187\208\181\208\189\208\184\209\143, \208\190 \209\130\208\190\208\188 \208\186\208\176\208\186\208\190\208\181 \208\177\208\190\208\187\209\140\209\136\208\190\208\181 \209\128\208\176\209\129\209\129\209\130\208\190\209\143\208\189\208\184\208\181 \208\188\208\181\208\182\208\180\209\131 \208\189\208\176\209\129\208\181\208\187\209\145\208\189\208\189\209\139\208\188\208\184 \208\191\209\131\208\189\208\186\209\130\208\176\208\188\208\184 \208\178 \208\183\208\176\209\133\208\190\208\187\209\131\209\129\209\130\209\140\208\181 \208\190\208\189 \209\128\208\181\209\136\208\184\208\187 \208\178\209\139\208\185\209\130\208\184 \208\184\208\183 \209\130\208\176\208\186\209\129\208\184 \208\178 \209\129\208\190\209\129\208\181\208\180\208\189\208\181\208\188 \208\179\208\190\209\128\208\190\208\180\208\181, \208\191\208\190\209\129\209\128\208\181\208\180\208\184 \208\183\208\184\208\188\209\139. \208\158\208\180\208\189\208\176\208\186\208\190 \208\190\208\189 \208\177\209\139\208\187 \209\136\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189 \209\131\208\183\208\189\208\176\208\178, \209\135\209\130\208\190 \208\180\208\190 \209\129\208\190\209\129\208\181\208\180\208\189\208\181\208\179\208\190 \208\179\208\190\209\128\208\190\208\180\208\176 \208\184\208\180\209\130\208\184 \209\134\208\181\208\187\209\139\209\133 3 \209\135\208\176\209\129\208\176. \208\162\209\131\209\130 \208\182\208\181 \208\190\208\189 \208\178\209\129\209\130\209\128\208\181\209\135\208\176\208\181\209\130 \208\148\208\190\209\129\208\176\208\189\208\186\208\190-\208\179\209\143\209\128\209\131 (\209\128\208\190\208\180\208\190\208\188 \208\184\208\183 \208\165\208\190\208\186\208\186\208\176\208\185\208\180\208\190) \208\191\208\190 \208\184\208\188\208\181\208\189\208\184 \208\164\209\131\209\142\208\186\208\184 \208\156\208\184\208\189\208\176\208\188\208\184, \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \208\191\209\128\208\184 \208\188\208\184\208\189\209\131\209\129 8 \208\179\209\128\208\176\208\180\209\131\209\129\208\176\209\133 \209\134\208\181\208\187\209\140\209\129\208\184\209\143 \209\133\208\190\208\180\208\184\209\130 \208\178 \209\129\209\130\208\176\208\189\208\180\208\176\209\128\209\130\208\189\208\190\208\185 \208\190\208\180\208\181\208\182\208\180\208\181 \208\179\209\143\209\128\209\131: \208\186\208\190\209\128\208\190\209\130\208\186\208\190\208\185 \209\142\208\177\208\186\208\181 \208\184 \209\129 \208\179\208\190\208\187\209\139\208\188\208\184 \208\189\208\190\208\179\208\176\208\188\208\184.  \
              \n\
              \n\
              \n---"))
            ((language tr)
             (string
              "Liseli Tsubasa, Hokkaido\226\128\153daki Kitami \197\159ehrine ta\197\159\196\177n\196\177r ve oradaki bir otob\195\188s dura\196\159\196\177nda bir \"gyaru\" ile tan\196\177\197\159\196\177r. Dondurucu so\196\159u\196\159a ra\196\159men \195\167\196\177plak bacaklar\196\177yla beyaz kar manzaras\196\177n\196\177n kar\197\159\196\177s\196\177nda tek ba\197\159\196\177na durdu\196\159unu g\195\182rmek kalbini cezbeder."))
            ((language pt-br)
             (string
              "Shiki Tsubasa acaba de se mudar de T\195\179quio para Hokkaido no meio do inverno. Sem perceber a dist\195\162ncia entre as cidades do pa\195\173s, ele desce do t\195\161xi na cidade mais pr\195\179xima de seu destino para poder ver os pontos tur\195\173sticos ao redor de sua casa, mas fica chocado quando descobre que a \"pr\195\179xima cidade\" \195\169 uma a tr\195\170s horas a p\195\169. No entanto, ele tamb\195\169m conhece uma linda Dosanko (nascido e criado em Hokkaido) gyaru chamado Fuyuki Minami, que est\195\161 enfrentando um clima de 8 graus Celsius abaixo de 0 com a roupa gyaru padr\195\163o de saias curtas e pernas nuas!"))))
          (is_locked false)
          (links
           (((provider al) (link 111403))
            ((provider ap) (link dosanko-gyaru-wa-namaramenkoi))
            ((provider bw) (link series/225993/list))
            ((provider kt) (link 55322)) ((provider mu) (link 152497))
            ((provider amz) (link https://www.amazon.co.jp/dp/B084NT3Q8X))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2635186))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/568854))
            ((provider mal) (link 121597))
            ((provider raw)
             (link https://shonenjumpplus.com/episode/10834108156684177150))
            ((provider engtl)
             (link https://mangaplus.shueisha.co.jp/titles/100116))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2019))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-10-12T20:49:23+00:00)
          (updated_at 2024-05-01T19:47:22+00:00) (version 41)
          (available_translated_languages (it en fr pt-br es ru id tr))
          (latest_uploaded_chapter 27277102-deb6-46f9-adc7-9d638016d7fe)))
        (relationships
         (((id b77fe548-6f64-4380-8cca-faee8891a7d3) (type_ author))
          ((id b77fe548-6f64-4380-8cca-faee8891a7d3) (type_ artist))
          ((id fb28ea6d-f978-4b22-b7bd-5fe5b4f64db3) (type_ cover_art)))))
       ((id 3dd50cdb-7a87-431b-bc6e-2f304e045aa0)
        (attributes
         ((title
           (((language en) (string "Gyaru to Nekura no Kyuuketsu Kankei"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\130\174\227\131\163\227\131\171\227\129\168\227\131\141\227\130\175\227\131\169\227\129\174\229\144\184\232\161\128\233\150\162\228\191\130")))
            (((language en)
              (string "The Bloody Relationship Between Nekura and Gal")))
            (((language zh)
              (string
               "\232\190\163\229\166\185\228\184\142\233\152\180\232\167\146\231\154\132\229\144\184\232\161\128\229\133\179\231\179\187")))
            (((language ja-ro) (string "Gyaru to Nekura no Kyuuketsuki Kankei")))))
          (description
           (((language en)
             (string
              "Fake gyaru Hadekawa Iyone failed her gyaru debut  in high school, but trying to break away from her situation as an outcast, tried talking to her seat neighbor, Chisui Makuru, who turned out to be the vampire rumored about in town! Although, Makuru isn't the typical vampire everyone imagines... And thus begins the slightly strange high school life of a gyaru in search of friends, and a vampire in search of an underling."))))
          (is_locked false)
          (links
           (((provider al) (link 171034))
            ((provider bw) (link series/419022/list))
            ((provider kt) (link gyaru-to-nekura-no-kyuuketsu-kankei))
            ((provider mu) (link sy8vknq))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0C9MSK2SH))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/770676/))
            ((provider mal) (link 163495))
            ((provider raw) (link https://seiga.nicovideo.jp/comic/60565))))
          (original_language ja) (last_volume (2)) (last_chapter (25))
          (publication_demographic ()) (status completed) (year (2022))
          (content_rating safe)
          (tags
           (((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b11fda93-8f1d-4bef-b2ed-8803d3733170)
             (attributes
              ((name (((language en) (string 4-Koma)))) (group format)
               (version 1))))
            ((id d7d1730f-6eb0-4ba6-9437-602cac38664c)
             (attributes
              ((name (((language en) (string Vampires)))) (group theme)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-07-03T20:23:35+00:00)
          (updated_at 2024-07-25T18:11:39+00:00) (version 14)
          (available_translated_languages (en zh-hk es))
          (latest_uploaded_chapter 2da228d9-7bfa-44fb-9c76-1e1af0e9790a)))
        (relationships
         (((id 57626153-e846-4e6a-b27e-97208a050e8d) (type_ author))
          ((id 57626153-e846-4e6a-b27e-97208a050e8d) (type_ artist))
          ((id 9543a468-d526-499a-a02b-1a9be889763a) (type_ cover_art))
          ((id aae57587-14ed-4b96-85b0-79c9fa3aea7c) (type_ creator)))))
       ((id 9d9b04ad-9a83-49f4-8ae4-a9a3780fe9c0)
        (attributes
         ((title (((language en) (string "Sakamoto Days"))))
          (alt_titles
           ((((language ru)
              (string
               "\208\148\208\189\208\184 \208\161\208\176\208\186\208\176\208\188\208\190\209\130\208\190")))
            (((language ja)
              (string
               "\227\130\181\227\130\171\227\131\162\227\131\136 \227\131\135\227\130\164\227\130\186")))
            (((language ne)
              (string
               "\224\164\184\224\164\190\224\164\149\224\164\190\224\164\174\224\165\139\224\164\164\224\165\139 \224\164\161\224\165\135\224\164\156")))
            (((language pt-br) (string "Sakamoto Days")))
            (((language fr) (string "Sakamoto Days")))))
          (description
           (((language en)
             (string
              "Taro Sakamoto was the ultimate assassin, feared by villains and admired by hitmen. But one day\226\128\166he fell in love! Retirement, marriage, fatherhood and then\226\128\166 Sakamoto gained weight! The chubby guy who runs the neighborhood store is actually a former legendary hitman! Can he protect his family from danger? Get ready to experience a new kind of action comedy series!"))
            ((language fr)
             (string
               "Taro Sakamoto est un assassin l\195\169gendaire, le meilleur d'entre tous, craint par tous les gangsters, adul\195\169 par ses pairs. Mais un beau jour... il tombe amoureux ! S'ensuivent retraite, mariage, paternit\195\169... et prise de poids.\
              \nSakamoto est aujourd'hui patron d'une petite \195\169picerie de quartier et coule des jours heureux avec sa famille. Mais lorsque son pass\195\169 le rattrape sous les traits de Shin, un jeune assassin t\195\169l\195\169pathe, Sakamoto reprend du service...\
              \nEt malgr\195\169 son apparence, il est toujours aussi charismatique lorsqu'il passe \195\160 l'action !"))
            ((language ja)
             (string
              "\231\148\186\227\129\174\229\149\134\229\186\151\227\130\146\229\150\182\227\130\128\227\129\181\227\129\143\227\130\136\227\129\139\227\129\170\231\148\183\227\131\187\229\157\130\230\156\172\229\164\170\233\131\142\227\128\130\227\129\157\227\129\174\230\173\163\228\189\147\227\129\175\229\133\168\227\129\166\227\129\174\230\130\170\229\133\154\227\129\140\230\129\144\227\130\140\227\128\129\230\134\167\227\130\140\227\129\159\229\133\131\227\131\187\228\188\157\232\170\172\227\129\174\230\174\186\227\129\151\229\177\139!!\227\128\128\232\165\178\227\129\132\230\157\165\227\130\139\229\141\177\233\153\186\227\129\139\227\130\137\229\174\182\230\151\143\227\129\168\230\151\165\229\184\184\227\130\146\229\174\136\227\130\139\227\128\129\229\157\130\230\156\172\227\129\174\230\151\165\227\128\133\227\129\168\227\129\175\226\128\166!?"))
            ((language ru)
             (string
              "\208\162\208\176\209\128\208\190 \208\161\208\176\208\186\208\176\208\188\208\190\209\130\208\190 \208\177\209\139\208\187 \208\191\209\128\208\190\209\132\208\181\209\129\209\129\208\184\208\190\208\189\208\176\208\187\209\140\208\189\209\139\208\188 \208\186\208\184\208\187\208\187\208\181\209\128\208\190\208\188. \208\148\209\128\209\131\208\179\208\184\208\181 \208\189\208\176\209\145\208\188\208\189\208\184\208\186\208\184 \208\184\208\188 \208\178\208\190\209\129\209\133\208\184\209\137\208\176\208\187\208\184\209\129\209\140, \208\176 \208\183\208\187\208\190\208\180\208\181\208\184 \208\177\208\190\209\143\208\187\208\184\209\129\209\140. \208\157\208\190 \208\190\208\180\208\189\208\176\208\182\208\180\209\139\226\128\166 \208\161\208\176\208\186\208\176\208\188\208\190\209\130\208\190 \208\178\208\187\209\142\208\177\208\184\208\187\209\129\209\143! \208\151\208\176\208\178\209\143\208\183\208\176\208\187 \209\129 \208\186\209\128\208\184\208\188\208\184\208\189\208\176\208\187\208\190\208\188, \208\182\208\181\208\189\208\184\208\187\209\129\209\143, \209\129\209\130\208\176\208\187 \208\190\209\130\209\134\208\190\208\188 \208\184 \208\178 \208\184\209\130\208\190\208\179\208\181\226\128\166 \208\160\208\176\208\183\208\182\208\184\209\128\208\181\208\187! \208\162\208\190\208\187\209\129\209\130\209\139\208\185 \208\180\209\143\208\180\209\140\208\186\208\176 \208\184\208\183 \209\129\208\190\209\129\208\181\208\180\208\189\208\181\208\179\208\190 \208\188\208\176\208\179\208\176\208\183\208\184\208\189\208\176 \226\128\148 \208\178 \208\191\209\128\208\190\209\136\208\187\208\190\208\188 \208\189\208\181\208\191\209\128\208\181\208\178\208\183\208\190\208\185\208\180\209\145\208\189\208\189\209\139\208\185 \209\131\208\177\208\184\208\185\209\134\208\176! \208\161\208\188\208\190\208\182\208\181\209\130 \208\187\208\184 \208\190\208\189 \209\131\208\177\208\181\209\128\208\181\209\135\209\140 \209\129\208\178\208\190\209\142 \209\129\208\181\208\188\209\140\209\142 \208\190\209\130 \208\190\208\191\208\176\209\129\208\189\208\190\209\129\209\130\208\184? \208\159\209\128\208\184\208\179\208\190\209\130\208\190\208\178\209\140\209\130\208\181\209\129\209\140 \208\186 \208\189\208\190\208\178\208\190\208\185 \208\190\209\129\209\130\209\128\208\190\209\129\209\142\208\182\208\181\209\130\208\189\208\190\208\185 \208\186\208\190\208\188\208\181\208\180\208\184\208\184!"))
            ((language pt-br)
             (string
              "Taro Sakamoto era o assassino supremo, temido pelos vil\195\181es e admirado pelos assassinos.\194\160Mas um dia... ele se apaixonou!\194\160Aposentadoria, casamento, paternidade e depois\226\128\166 Sakamoto engordou!\194\160O cara gordinho que administra a loja do bairro \195\169 na verdade um ex-assassino lend\195\161rio!\194\160Ele pode proteger sua fam\195\173lia do perigo?\194\160Prepare-se para experimentar um novo tipo de s\195\169rie de com\195\169dia de a\195\167\195\163o!"))))
          (is_locked false)
          (links
           (((provider al) (link 125828)) ((provider ap) (link sakamoto-days))
            ((provider bw) (link series/292319/list))
            ((provider kt) (link 58159)) ((provider mu) (link 174038))
            ((provider amz) (link https://www.amazon.co.jp/dp/B093L398V9))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2665803))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/631855/))
            ((provider mal) (link 131334))
            ((provider raw)
             (link https://shonenjumpplus.com/episode/3269754496468136056))
            ((provider engtl)
             (link https://mangaplus.shueisha.co.jp/titles/100127))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 85daba54-a71c-4554-8a28-9901a8b0afad)
             (attributes
              ((name (((language en) (string Mafia)))) (group theme) (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-12-16T09:54:30+00:00)
          (updated_at 2024-07-21T07:26:52+00:00) (version 38)
          (available_translated_languages
           (pt-br it ru en tr ar es-la sr th fr id pl es bn fa))
          (latest_uploaded_chapter 01b50b5c-0fa9-438b-88af-69289f7ec686)))
        (relationships
         (((id 1db239cc-9392-43f7-9806-f6fcb9ca4e9d) (type_ author))
          ((id 1db239cc-9392-43f7-9806-f6fcb9ca4e9d) (type_ artist))
          ((id 59464d5a-ac19-4826-84e9-8397e3bc4475) (type_ cover_art))
          ((id cad9ed63-bded-4f09-b59a-a24c315cfad2) (type_ manga))
          ((id e9c2f0e9-40ad-4f86-a63f-d6d5f36f4831) (type_ manga))
          ((id f819bdb3-5230-401e-9156-f6f55c9fb1f7) (type_ manga)))))
       ((id 0550851a-961b-4b34-9684-4b2901e62079)
        (attributes
         ((title
           (((language en) (string "Moto Azadarake no Kanojo ga Shinpai de"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\133\131 \231\151\163\227\129\160\227\130\137\227\129\145\227\129\174\229\189\188\229\165\179\227\129\140\229\191\131\233\133\141\227\129\167")))
            (((language en)
              (string
               "I'm Worried About My Girlfriend, Who Used to be Covered in Bruises")))
            (((language pl)
              (string
               "Martwi\196\153 Si\196\153 o Moj\196\133 Dziewczyn\196\153, Kt\195\179ra By\197\130a Kiedy\197\155 Pokryta w Bliznach")))
            (((language ru)
              (string
               "\208\175 \208\177\208\181\209\129\208\191\208\190\208\186\208\190\209\142\209\129\209\140 \208\190 \209\129\208\178\208\190\208\181\208\185 \208\180\208\181\208\178\209\131\209\136\208\186\208\181, \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \209\128\208\176\208\189\209\140\209\136\208\181 \208\177\209\139\208\187\208\176 \208\178\209\129\209\143 \208\178 \209\129\208\184\208\189\209\143\208\186\208\176\209\133")))
            (((language tr)
              (string
               "Eskiden Bandajlarla Kaplanm\196\177\197\159 Olan K\196\177z Arkada\197\159\196\177m Hakk\196\177nda Endile\197\159eniyorum")))
            (((language ro)
              (string
               "Sunt \195\142ngrijorat Pentru Iubita Mea, Care Obi\200\153nuia s\196\131 Fie Acoperit\196\131 de V\195\162n\196\131t\196\131i")))
            (((language es-la)
              (string
               "Estoy preocupado por mi novia que sol\195\173a estar cubierta de moretones")))))
          (description
           (((language en)
             (string
              "Continuation of [Azadarake no Classmate ga Shinpai de](https://mangadex.org/title/17447693-cb65-493d-8e21-dafb22d8340f/azadarake-no-classmate-ga-shinpai-de)."))
            ((language es-la)
             (string
              "Continuaci\195\179n de [Azadarake no Classmate ga Shinpai de](https://mangadex.org/title/17447693-cb65-493d-8e21-dafb22d8340f/azadarake-no-classmate-ga-shinpai-de)."))))
          (is_locked false)
          (links
           (((provider al) (link 176604)) ((provider mu) (link q999iax))
            ((provider raw)
             (link https://twitter.com/kugatu28/status/1767825783291076656))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-03-13T09:01:41+00:00)
          (updated_at 2024-06-27T14:47:24+00:00) (version 18)
          (available_translated_languages (pt-br ru id es-la en pl ro tr vi))
          (latest_uploaded_chapter 304c7887-f012-4d7b-a90c-bdb2099af8c5)))
        (relationships
         (((id 8b910458-1344-4b6a-ae5c-935240cd3027) (type_ author))
          ((id 8b910458-1344-4b6a-ae5c-935240cd3027) (type_ artist))
          ((id ab0eded8-788c-4957-ae47-e84a2b011918) (type_ cover_art))
          ((id 17447693-cb65-493d-8e21-dafb22d8340f) (type_ manga))
          ((id 1d977237-2064-472f-b706-1306197229f7) (type_ manga))
          ((id 3424f156-149b-4942-a1d9-c1ad76e59174) (type_ manga))
          ((id 3d73af7d-20f4-4a63-99f7-c32ffb3c2666) (type_ manga))
          ((id ddd02306-939d-4431-bb8f-de39ec7d59aa) (type_ manga))
          ((id 0bffa7b8-ca9f-4c4c-9dcb-a545a34d93b7) (type_ creator)))))
       ((id e49d2cba-4528-4cab-96c5-48a73ba63fbb)
        (attributes
         ((title (((language en) (string Mary-san))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\161\227\131\170\227\131\188\227\129\149\227\130\147")))
            (((language en) (string Merry-san)))))
          (description
           (((language en)
             (string
               "Mary-san who calls you on the phone, telling you she's nearby...nothing but a prank call, right? Witness the cute and charming life she lives!\
              \n\
              \nThis is based on the Japanese urban legend Mary-san.  If it makes no sense at all to you, see https://www.kowabana.net/2018/06/09/mary-san/ and it will be a lot more comprehensible, while still being cute."))))
          (is_locked false)
          (links (((provider raw) (link https://twitter.com/cacomistle_tail))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b11fda93-8f1d-4bef-b2ed-8803d3733170)
             (attributes
              ((name (((language en) (string 4-Koma)))) (group format)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-06-20T15:22:35+00:00)
          (updated_at 2024-04-30T00:09:16+00:00) (version 9)
          (available_translated_languages (en))
          (latest_uploaded_chapter 8b582556-d615-4084-93e0-b43ae03382d5)))
        (relationships
         (((id 145a4f10-ffe8-4e2e-a564-fd30305b186e) (type_ author))
          ((id 145a4f10-ffe8-4e2e-a564-fd30305b186e) (type_ artist))
          ((id 96278e99-11a4-4fc9-9b0b-f1fe31d9a652) (type_ cover_art))
          ((id e5c43dab-9866-49c8-a296-fb3b68d62119) (type_ manga))
          ((id 08208cf3-8ff4-4045-ad87-7055001803cd) (type_ creator)))))
       ((id efb4278c-a761-406b-9d69-19603c5e4c8b)
        (attributes
         ((title
           (((language en)
             (string
              "The 100 Girlfriends Who Really, Really, Really, Really, Really Love You"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\144\155\227\129\174\227\129\147\227\129\168\227\129\140\229\164\167\229\164\167\229\164\167\229\164\167\229\164\167\229\165\189\227\129\141\227\129\170100\228\186\186\227\129\174\229\189\188\229\165\179")))
            (((language es-la)
              (string
               "Las 100 Novias Que Te Quieren Mucho Mucho Mucho Mucho Mucho")))
            (((language bg)
              (string "\208\161\209\130\208\190\208\186\208\176\208\189\208\190")))
            (((language ru)
              (string
               "100 \208\180\208\181\208\178\209\131\209\136\208\181\208\186, \208\186\208\190\209\130\208\190\209\128\209\139\208\181 \208\190\209\135\208\181\208\189\209\140-\208\190\209\135\208\181\208\189\209\140-\208\190\209\135\208\181\208\189\209\140-\208\190\209\135\208\181\208\189\209\140-\208\190\209\135\208\181\208\189\209\140 \209\129\208\184\208\187\209\140\208\189\208\190 \209\130\208\181\208\177\209\143 \208\187\209\142\208\177\209\143\209\130")))
            (((language zh-hk)
              (string
               "\232\182\133\232\182\133\232\182\133\232\182\133\232\182\133\229\150\156\230\173\161\228\189\160\231\154\132100\229\128\139\229\165\179\229\143\139")))
            (((language pt-br)
              (string
               "As 100 Namoradas que te Amam Muito, Muito, Muito, Muito, Muito, Mesmo.")))
            (((language ja-ro)
              (string
               "Kimi no koto ga daidaidaidaidai suki na 100-nin no Kanojo")))
            (((language en)
              (string
               "The 100 Girlfriends Who Really, Really, Really, Really, Really Love You")))))
          (description
           (((language en)
             (string
               "Aijo Rentaro has asked a hundred girls out and struck out every time. In desperation, he prays for guidance, only to be told by a god that his rejections were due to a cosmic mishap! Now this god will set things right by making sure Aijo gets one hundred dates. \
              \n\
              \nExcept, as things often go with gods, there\226\128\153s a catch: each of his one hundred dates is Aijo\226\128\153s destined soulmate! Worse, if he doesn\226\128\153t return their feelings, they\226\128\153ll all die in horrible - and hilarious - accidents!"))
            ((language ru)
             (string
              "\208\167\209\130\208\190 \208\188\208\190\208\182\208\181\209\130 \208\177\209\139\209\130\209\140 \209\133\209\131\208\182\208\181 \208\190\209\130\208\186\208\176\208\183\208\176 \208\189\208\176 \208\191\209\128\208\184\208\183\208\189\208\176\208\189\208\184\208\181 \208\178 \208\187\209\142\208\177\208\178\208\184? \208\161\208\190\209\130\208\189\209\143 \208\190\209\130\208\186\208\176\208\183\208\190\208\178 \208\189\208\176 \208\191\209\128\208\184\208\183\208\189\208\176\208\189\208\184\208\181 \208\178 \208\187\209\142\208\177\208\178\208\184! \208\144\208\185\208\180\208\183\209\145 \208\160\209\141\208\189\209\130\208\176\209\128\208\190 \226\128\147 \208\177\208\181\208\183\208\189\208\176\208\180\209\145\208\182\208\189\209\139\208\185 \209\128\208\190\208\188\208\176\208\189\209\130\208\184\208\186, \208\191\209\128\208\184\208\183\208\189\208\176\208\178\209\136\208\184\208\185\209\129\209\143 \208\178 \208\187\209\142\208\177\208\178\208\184 \209\131\208\182\208\181 \209\129\209\130\208\190 \209\128\208\176\208\183, \208\189\208\190 \208\191\208\190 \208\189\208\181\208\190\208\177\209\138\209\143\209\129\208\189\208\184\208\188\209\139\208\188 \208\191\209\128\208\184\209\135\208\184\208\189\208\176\208\188 \208\186\208\176\208\182\208\180\209\139\208\185 \209\128\208\176\208\183 \208\191\208\190\208\187\209\131\209\135\208\176\208\178\209\136\208\184\208\185 \208\190\209\130\208\186\208\176\208\183. \208\146 \208\190\208\180\208\184\208\189 \208\191\209\128\208\181\208\186\209\128\208\176\209\129\208\189\209\139\208\185 \208\180\208\181\208\189\209\140 \208\191\208\181\209\128\208\181\208\180 \208\189\208\184\208\188 \208\191\209\128\208\181\208\180\209\129\209\130\208\176\209\145\209\130 \209\129\208\176\208\188 \208\145\208\190\208\179 \208\155\209\142\208\177\208\178\208\184 \208\184 \208\179\208\190\208\178\208\190\209\128\208\184\209\130, \209\135\209\130\208\190 \208\181\208\179\208\190 \209\131\208\182\208\176\209\129\208\189\208\176\209\143 \209\131\208\180\208\176\209\135\208\176 \208\178 \208\187\209\142\208\177\208\178\208\184 \208\190\208\177\208\181\209\128\208\189\209\131\208\187\208\176\209\129\209\140 \208\178\209\129\208\191\209\143\209\130\209\140! \208\162\208\181\208\191\208\181\209\128\209\140 \208\144\208\185\208\180\208\183\209\145 \208\191\209\128\208\181\208\180\209\129\209\130\208\190\208\184\209\130 \208\178\209\129\209\130\209\128\208\181\209\130\208\184\209\130\209\140 100 \208\180\208\181\208\178\209\131\209\136\208\181\208\186 \"\208\161\208\190\209\131\208\187\208\188\208\181\208\185\209\130\208\190\208\178\" \226\128\147 \208\186\208\176\208\182\208\180\208\176\209\143 \208\184\208\183 \208\189\208\184\209\133 \208\191\209\128\208\181\208\180\208\189\208\176\208\183\208\189\208\176\209\135\208\181\208\189\208\176 \208\181\208\188\209\131 \209\129\208\176\208\188\208\190\208\185 \209\129\209\131\208\180\209\140\208\177\208\190\208\185 \208\184 \208\177\208\181\208\183 \208\191\208\176\208\188\209\143\209\130\208\184 \208\178\208\187\209\142\208\177\208\187\208\181\208\189\208\176 \208\178 \208\189\208\181\208\179\208\190! \208\157\208\190 \208\178\208\190\209\130 \208\177\208\181\208\180\208\176: \208\189\208\184 \209\131 \208\190\208\180\208\189\208\190\208\179\208\190 \209\135\208\181\208\187\208\190\208\178\208\181\208\186\208\176 \208\189\208\181 \208\180\208\190\208\187\208\182\208\189\208\190 \208\177\209\139\209\130\209\140 \209\129\209\130\208\190\208\187\209\140\208\186\208\190 \209\129\208\190\209\131\208\187\208\188\208\181\208\185\209\130\208\190\208\178. \208\149\209\129\208\187\208\184 \208\190\208\189 \208\189\208\181 \208\190\209\130\208\178\208\181\209\130\208\184\209\130 \209\133\208\190\209\130\209\140 \208\190\208\180\208\189\208\190\208\185 \208\184\208\183 \208\189\208\184\209\133 \208\178\208\183\208\176\208\184\208\188\208\189\208\190\209\129\209\130\209\140\209\142, \208\180\208\181\208\178\209\131\209\136\208\186\209\131 \208\182\208\180\209\145\209\130 \209\129\208\188\208\181\209\128\209\130\209\140 \208\190\209\130 \208\189\208\181\209\129\209\135\208\176\209\129\209\130\208\189\208\190\208\179\208\190 \209\129\208\187\209\131\209\135\208\176\209\143! \208\162\208\181\208\191\208\181\209\128\209\140 \209\141\209\130\208\190 \208\180\208\181\208\187\208\190 \208\187\209\142\208\177\208\178\208\184 \208\184 \209\129\208\188\208\181\209\128\209\130\208\184, \208\176 \208\178\209\139\208\177\208\190\209\128 \208\183\208\176 \208\144\208\185\208\180\208\183\209\145."))
            ((language pt-br)
             (string
              "Aijou \195\169 um garoto que tem muito azar no amor e j\195\161 foi rejeitado mais de 100 vezes. Desesperado ele vai num templo pedir ajuda aos deuses. E seu desejo foi atendido, para cada rejei\195\167\195\163o ele ter\195\161 uma alma g\195\170mea. Mas isso se tona uma maldi\195\167\195\163o quando ele fica sabendo que se elas n\195\163o forem felizes ao lado de sua alma g\195\170mea, ele, elas v\195\163o morrer\226\128\166 Mas que merda, voc\195\170 ainda est\195\161 lendo isso? N\195\163o escutou? S\195\163o 100 garotas, 100! N\195\163o h\195\161 tempo a perder!"))))
          (is_locked false)
          (links
           (((provider al) (link 114416))
            ((provider ap)
             (link kimi-no-koto-ga-daidaidaidaidaisuki-na-100-nin-no-kanojo))
            ((provider bw) (link series/244417)) ((provider kt) (link 55856))
            ((provider mu) (link 160313))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B08F5M3FXV))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2644346))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/586169))
            ((provider mal) (link 123681))
            ((provider raw)
             (link https://shonenjumpplus.com/episode/13933686331623812157))
            ((provider engtl)
             (link
              https://sevenseasentertainment.com/series/the-100-girlfriends-who-really-really-really-really-really-love-you/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2019))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-04-25T21:38:36+00:00)
          (updated_at 2024-06-18T16:50:39+00:00) (version 68)
          (available_translated_languages (pt-br tr ru en es-la id fr))
          (latest_uploaded_chapter c9ef6065-7f6d-40a3-b5bf-61a1343c0660)))
        (relationships
         (((id 60d04d03-fc3e-4f14-8c32-588a88be48a3) (type_ author))
          ((id c7e718cf-feaf-406c-85af-a369199b7f2e) (type_ artist))
          ((id 2e20a11e-2d99-4d65-9f83-b2e32becb9ec) (type_ cover_art))
          ((id 082efa11-e401-4360-823c-7e83df10100d) (type_ manga))
          ((id 405aa2ee-c94b-487f-a082-4148aef34b56) (type_ manga))
          ((id 543ee8e7-d5f7-4473-8c3b-259fafc9c08b) (type_ manga))
          ((id c0f300e7-cb7b-4d3f-b1e6-788258d54112) (type_ manga))
          ((id efdc568c-d685-4f53-92c2-f4cd1b841e2b) (type_ manga)))))
       ((id 49650a04-d0d7-4526-b460-8203ae223586)
        (attributes
         ((title (((language en) (string "Fight Class 3"))))
          (alt_titles
           ((((language ko-ro) (string "Gyeoggi 3 Ban")))
            (((language ko-ro) (string "Gyeok Gi 3 Ban")))
            (((language ko) (string "\234\178\169\234\184\1763\235\176\152")))
            (((language pt-br) (string "Turma de Luta 3")))))
          (description
           (((language en)
             (string
               "A world in which Korea is the global capital of combat sports. At Nam-Il High School where the best and most talented students of martial arts reside, Jiu Ji-Tae suddenly finds himself thrust into their midst despite being a total weakling.  \
              \n  \
              \nBy neutralizing his physical shortcomings through jiu-jitsu, can he rise to the top of the fight classes?  \
              \n\
              \n\
              \n---"))
            ((language fr)
             (string
               "Un monde dans lequel la Cor\195\169e est le Pays leader des sports de combats. Au lyc\195\169e Nam-il o\195\185 les meilleurs et plus talentueux \195\169l\195\168ves en arts martiaux \195\169tudient, Jiu Ji-tae se trouve soudainement entra\195\174n\195\169 avec eux alors qu'il n'est qu'un faiblard.  \
              \n  \
              \nEn faisant dispara\195\174tre ses d\195\169fauts physiques \195\160 l'aide du Ju-Jitsu, pourra-t-il devenir le meilleur des classes de combat ?  \
              \n\
              \n\
              \n---\
              \n\
              \n**Links:**  \
              \n- [Author's Twitter](https://twitter.com/mymmx89)"))
            ((language pt-br)
             (string
               "Em um mundo onde a Cor\195\169ia do Sul \195\169 a capital mundial dos esportes de combate, o Col\195\169gio Namil \195\169 onde os melhores e mais talentosos estudantes de artes marciais competem, e nosso protagonista Jiu Jitei se encontra subitamente em meio \195\160 eles mesmo sendo um fracote completo.\
              \n  \
              \nSuperando suas fraquezas com jiu-jitsu, ser\195\161 que Jitei consegue chegar ao topo das turmas de luta?"))))
          (is_locked false)
          (links
           (((provider al) (link 107327)) ((provider ap) (link fight-class-3))
            ((provider kt) (link 55431)) ((provider mu) (link 143437))
            ((provider mal) (link 118805))
            ((provider raw)
             (link https://series.naver.com/comic/detail.nhn?productNo=2430222))
            ((provider engtl)
             (link https://www.lalatoon.com/en/webtoon/episode/toon/7045))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status hiatus) (year (2016))
          (content_rating safe)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-02-16T08:31:10+00:00)
          (updated_at 2024-06-12T16:53:50+00:00) (version 16)
          (available_translated_languages (en tr es-la ru pt-br fr))
          (latest_uploaded_chapter 9c34c6ee-9fa6-4329-b213-2f807549a9de)))
        (relationships
         (((id 37f6d7e4-a13c-4769-9927-408ef544f53b) (type_ author))
          ((id 37f6d7e4-a13c-4769-9927-408ef544f53b) (type_ artist))
          ((id 9747a3c4-f9f8-44ff-a2c5-33b87a6c67cb) (type_ cover_art))
          ((id 50df75f2-22c5-46c3-9212-8f5997940c99) (type_ manga))
          ((id 55af61ae-3a3c-408f-acf9-ab5c285726e8) (type_ manga)))))
       ((id 6bf844c8-2ce4-401a-a761-3151042efe30)
        (attributes
         ((title
           (((language en)
             (string "Tokidoki Bosotto Roshia-go de Dereru Tonari no Alya-san"))))
          (alt_titles
           ((((language ja)
              (string
               "\230\153\130\227\128\133\227\131\156\227\130\189\227\131\131\227\129\168\227\131\173\227\130\183\227\130\162\232\170\158\227\129\167\227\131\135\227\131\172\227\130\139\233\154\163\227\129\174\227\130\162\227\131\188\227\131\170\227\131\163\227\129\149\227\130\147")))
            (((language ru)
              (string
               "\208\144\208\187\209\143, \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \209\129\208\184\208\180\208\184\209\130 \209\128\209\143\208\180\208\190\208\188 \209\129\208\190 \208\188\208\189\208\190\208\185, \208\184\208\189\208\190\208\179\208\180\208\176 \208\186\208\190\208\186\208\181\209\130\208\189\208\184\209\135\208\176\208\181\209\130 \209\129\208\190 \208\188\208\189\208\190\208\185 \208\191\208\190-\209\128\209\131\209\129\209\129\208\186\208\184")))
            (((language ru)
              (string
               "\208\144\208\187\209\143-\209\129\208\176\208\189 \208\184\208\189\208\190\208\179\208\180\208\176 \208\186\208\190\208\186\208\181\209\130\208\189\208\184\209\135\208\176\208\181\209\130 \209\129\208\190 \208\188\208\189\208\190\208\185 \208\191\208\190-\209\128\209\131\209\129\209\129\208\186\208\184")))
            (((language vi)
              (string
               "Arya-san b\195\160n b\195\170n thi tho\225\186\163ng l\225\186\161i tr\195\170u gh\225\186\185o t\195\180i b\225\186\177ng ti\225\186\191ng Nga")))
            (((language zh-hk)
              (string
               "\228\184\141\230\153\130\232\188\149\232\129\178\229\156\176\228\187\165\228\191\132\232\170\158\233\129\174\231\190\158\231\154\132\233\132\176\229\186\167\232\137\190\232\142\137\229\144\140\229\173\184")))
            (((language id)
              (string
               "Alya-san Terkadang Menyembunyikan Perasaannya dalam Bahasa Rusia")))
            (((language pt-br)
              (string "Alya-san geralmente esconde seus sentimentos em russo")))
            (((language ne)
              (string
               "\224\164\134\224\164\178\224\165\141\224\164\175\224\164\190 \224\164\149\224\164\185\224\164\191\224\164\178\224\165\135\224\164\149\224\164\190\224\164\185\224\165\128\224\164\129 \224\164\176\224\165\130\224\164\184\224\165\128 \224\164\173\224\164\190\224\164\183\224\164\190\224\164\174\224\164\190 \224\164\134\224\164\171\224\165\141\224\164\168\224\165\139 \224\164\173\224\164\190\224\164\181\224\164\168\224\164\190 \224\164\178\224\165\129\224\164\149\224\164\190\224\164\137\224\164\129\224\164\155\224\164\191\224\164\168\224\165\141")))
            (((language de)
              (string "Alya verbirgt manchmal ihre Gef\195\188hle auf Russisch")))
            (((language en)
              (string "Alya Sometimes Hides Her Feelings in Russian")))
            (((language en)
              (string "My Deskmate Alya Sometimes Hides Her Feelings in Russian")))
            (((language ja-ro)
              (string "Tokidoki Bosotto Roshia-go de Dereru Tonari no Alya-san")))
            (((language pl)
              (string
               "Alya Czasami Ukrywa Swoje Uczucia U\197\188ywaj\196\133c Rosyjskiego")))
            (((language ja-ro) (string Roshidere)))
            (((language mn)
              (string
               "\208\144\208\187\209\143 \208\151\208\176\209\128\208\184\208\188\208\180\208\176\208\176 \208\158\209\128\208\190\209\129 \208\165\209\141\208\187\209\141\209\141\209\128 \208\161\209\141\209\130\208\179\209\141\208\187\209\141\209\141 \208\157\209\131\209\131\208\180\208\176\208\179")))))
          (description
           (((language en)
             (string
               "\"\208\152 \208\189\208\176 \208\188\208\181\208\189\209\143 \209\130\208\190\208\182\208\181 \208\190\208\177\209\128\208\176\209\130\208\184 \208\178\208\189\208\184\208\188\208\176\208\189\208\184\208\181...\"\
              \n\
              \nAlya, the incomparably beautiful silver-haired girl in the next seat over, occasionally mumbles to herself in Russian. She says she switches to it whenever she\226\128\153s badmouthing me\226\128\166 but I know the truth! I know for a fact that she just said \"Pay attention to me, too.\" to me! \
              \n\
              \nMasachika Kuze has native-level skills when it comes to Russian comprehension, but Alya has no idea about that... and that\226\128\153s why she keeps on hiding those sweet feelings about him in her native language!"))
            ((language it)
             (string
              "Masachika Kuze \195\168 seduto accanto ad Alya, una ragazza di origine russa e antenati giapponesi. Lei \195\168 bella, altezzosa e una studentessa eccezionale, mentre Masachika \195\168 secchione e noto per essere un fannullone. \195\136 un bersaglio facile per i suoi commenti in russo, che lei \195\168 fin troppo felice di tradurre - tranne per il fatto che lui pu\195\178 capire cosa sta dicendo in realt\195\160!"))
            ((language ja)
             (string
              "\227\128\140\208\152 \208\189\208\176 \208\188\208\181\208\189\209\143 \209\130\208\190\208\182\208\181 \208\190\208\177\209\128\208\176\209\130\208\184 \208\178\208\189\208\184\208\188\208\176\208\189\208\184\208\181\227\128\141\233\154\163\227\129\174\229\184\173\227\129\171\229\186\167\227\130\139\231\181\182\228\184\150\227\129\174\233\138\128\233\171\170\231\190\142\229\176\145\229\165\179\227\128\129\227\130\162\227\131\188\227\131\170\227\131\163\227\129\149\227\130\147\227\129\175\230\153\130\227\128\133\227\131\173\227\130\183\227\130\162\232\170\158\227\130\146\232\169\177\227\129\153\227\128\130\230\156\172\228\186\186\227\129\175\228\191\186\227\130\146\231\189\181\229\128\146\227\129\151\227\129\166\227\129\132\227\130\139\227\129\168\232\168\128\227\129\134\227\129\174\227\129\160\227\129\140\226\128\166\228\186\139\229\174\159\227\129\175\233\129\149\227\129\134\239\188\129\227\129\149\227\129\163\227\129\141\227\129\174\227\131\173\227\130\183\227\130\162\232\170\158\227\128\129\229\189\188\229\165\179\227\129\175\227\128\140\231\167\129\227\129\174\227\129\147\227\129\168\227\129\139\227\129\190\227\129\163\227\129\166\227\130\136\227\128\141\227\129\168\232\168\128\227\129\163\227\129\166\227\129\132\227\129\159\227\129\174\227\129\160\239\188\129\229\174\159\227\129\175\228\191\186\227\128\129\228\185\133\228\184\150\230\148\191\232\191\145\227\129\174\227\131\173\227\130\183\227\130\162\232\170\158\227\131\170\227\130\185\227\131\139\227\131\179\227\130\176\227\129\175\227\131\141\227\130\164\227\131\134\227\130\163\227\131\150\227\131\172\227\131\153\227\131\171\227\129\170\227\129\174\227\129\167\227\129\130\227\130\139\227\128\130\227\129\157\227\130\147\227\129\170\228\186\139\227\129\168\227\129\175\233\156\178\231\159\165\227\130\137\227\129\154\227\128\129\228\187\138\230\151\165\227\130\130\231\148\152\227\128\133\227\129\170\227\131\173\227\130\183\227\130\162\232\170\158\227\129\167\227\131\135\227\131\172\227\129\166\227\129\143\227\130\139\227\130\162\227\131\188\227\131\170\227\131\163\227\129\149\227\130\147\239\188\129\229\133\168\231\148\159\229\190\146\230\134\167\227\130\140\227\129\174\231\154\132\227\128\129\232\182\133\227\131\143\227\130\164\227\130\185\227\131\154\227\131\131\227\130\175\227\129\170\227\131\173\227\130\183\227\130\162\227\131\179JK\227\129\168\227\129\174\233\157\146\230\152\165\227\131\169\227\131\150\227\130\179\227\131\161\227\131\135\227\130\163\239\188\129"))
            ((language mn)
             (string
               "\208\144\208\187\209\143 \208\179\209\141\209\133, \209\133\209\141\208\189\209\130\209\141\208\185 \209\135 \208\183\210\175\208\185\209\128\208\187\209\141\209\136\208\179\210\175\208\185 \210\175\208\183\209\141\209\129\208\179\209\141\208\187\209\141\208\189, \208\188\211\169\208\189\208\179\211\169\208\187\211\169\208\179 \210\175\209\129\209\130\209\141\208\185 \208\190\209\133\208\184\208\189, \208\183\208\176\209\128\208\184\208\188\208\180\208\176\208\176 \208\180\208\190\209\130\209\128\208\190\208\190 \208\190\209\128\208\190\209\129\208\190\208\190\209\128 \209\136\208\184\208\178\208\189\209\141\208\180\209\141\208\179. \208\162\209\141\209\128 \209\133\209\141\208\187\209\141\209\133\208\180\209\141\209\141, \208\189\208\176\208\188\208\176\208\185\208\179 \208\188\209\131\209\131\208\187\208\176\209\133 \210\175\208\181\208\180\209\141\209\141 \208\187 \209\130\209\141\208\179\208\180\209\141\208\179 \208\179\209\141\208\182 \209\133\209\141\208\187\209\129\209\141\208\189...\208\179\209\141\209\133\208\180\209\141\209\141 \208\177\208\184 \208\190\209\128\208\190\209\129 \209\133\209\141\208\187 \208\188\209\141\208\180\208\189\209\141! \208\161\208\176\209\143\209\133\208\176\208\189 \"\208\157\208\176\208\180\208\176\208\180 \208\176\208\189\209\133\208\176\208\176\209\128\208\176\208\187 \209\130\208\176\208\178\208\184\208\176\209\135\" \208\179\209\141\208\182 \209\133\209\141\208\187\209\141\209\133\208\184\208\185\208\179 \208\189\209\140 \208\177\208\184 \209\129\208\190\208\189\209\129\209\129\208\190\208\189!\
              \n\
              \n\208\156\208\176\209\129\208\176\209\135\208\184\208\186\208\176 \208\154\210\175\208\183\209\141 \208\190\209\128\208\190\209\129 \209\133\209\141\208\187\208\184\208\185\208\179 \209\131\209\131\208\179\209\131\209\131\208\187 \209\130\210\175\208\178\209\136\208\189\208\184\208\185 \209\135\208\176\208\180\208\176\208\188\208\182\208\176\208\176\209\128 \208\190\208\185\208\187\208\179\208\190\208\180\208\190\208\179, \208\179\209\141\208\178\209\135 \208\144\208\187\209\143 \210\175\210\175\208\189\208\184\208\185\208\179 \208\188\209\141\208\180\209\141\209\133\208\179\210\175\208\185...\209\130\208\184\208\185\208\188 \208\177\208\190\208\187\208\190\209\133\208\190\208\190\209\128 \211\169\211\169\209\128\208\184\208\185\208\189\209\133\211\169\211\169 \209\129\209\141\209\130\208\179\209\141\208\187\208\184\208\185\208\179 \208\190\209\128\208\190\209\129 \209\133\209\141\208\187\209\141\209\141\209\128 \208\189\209\131\209\131\208\180\208\176\208\179!"))
            ((language pl)
             (string
              "Masachika Kuze siedzi obok Alyi, dziewczyny pochodzenia rosyjsko - japo\197\132skiego. Jest pi\196\153kn\196\133, wynios\197\130\196\133 i wyj\196\133tkow\196\133 uczennic\196\133, podczas gdy Masachika jest kujonem znanym z bycia leniem. Jest on wi\196\153c \197\130atwym celem dla jej komentarzy, kt\195\179re ch\196\153tnie t\197\130umaczy na rosyjski - z wyj\196\133tkiem tego, \197\188e on mo\197\188e zrozumie\196\135, co m\195\179wi naprawd\196\153!"))
            ((language ru)
             (string
              "\208\156\208\176\208\189\208\179\208\176 \208\191\208\190 \208\190\208\180\208\189\208\190\208\184\208\188\209\145\208\189\208\189\208\190\208\185 \208\189\208\190\208\178\208\181\208\187\208\187\208\181! \208\147\208\187\208\176\208\178\208\189\209\139\208\185 \208\179\208\181\209\128\208\190\208\185 \226\128\147 \208\154\209\131\208\180\208\183\208\181 \208\156\208\176\209\129\208\176\209\135\208\184\208\186\208\176, \209\131\209\135\208\184\209\130\209\129\209\143 \208\178 \209\135\208\176\209\129\209\130\208\189\208\190\208\188 \208\184\208\189\209\129\209\130\208\184\209\130\209\131\209\130\208\181 \208\161\208\181\208\185\209\128\208\181\208\185, \208\186\209\131\208\180\208\176 \209\135\208\176\209\129\209\130\208\181\208\189\209\140\208\186\208\190 \208\191\208\190\208\191\208\176\208\180\208\176\209\142\209\130 \209\131\209\135\208\181\208\189\208\184\208\186\208\184 \208\184\208\183 \209\128\208\176\208\183\208\189\209\139\209\133 \209\129\209\130\209\128\208\176\208\189. \208\146\208\180\209\128\209\131\208\179 \208\178 \208\186\208\187\208\176\209\129\209\129\208\181 \208\154\209\131\208\180\208\183\208\181 \208\191\208\190\209\143\208\178\208\184\208\187\208\176\209\129\209\140 \208\189\208\190\208\178\208\181\208\189\209\140\208\186\208\176\209\143. \208\148\208\181\208\178\209\131\209\136\208\186\208\176 \209\129 \208\177\208\187\208\181\208\180\208\189\208\190\208\185, \208\191\208\190\209\135\209\130\208\184 \208\191\209\128\208\190\208\183\209\128\208\176\209\135\208\189\208\190\208\185 \208\186\208\190\208\182\208\181\208\185, \208\186\208\190\209\130\208\190\209\128\209\131\209\142 \208\189\208\181\208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190 \208\177\209\139\208\187\208\190 \209\131\208\178\208\184\208\180\208\181\209\130\209\140 \209\131 \208\189\208\176\209\129\209\130\208\190\209\143\209\137\208\184\209\133 \209\143\208\191\208\190\208\189\209\134\208\181\208\178, \208\184 \208\180\208\187\208\184\208\189\208\189\209\139\208\188\208\184 \208\179\208\190\208\187\209\131\208\177\209\139\208\188\208\184 \208\179\208\187\208\176\208\183\208\176\208\188\208\184-\209\137\208\181\208\187\208\190\209\135\208\186\208\176\208\188\208\184, \209\129\208\184\209\143\209\142\209\137\208\184\208\188\208\184, \208\186\208\176\208\186 \209\129\208\176\208\191\209\132\208\184\209\128\209\139. \208\173\209\130\208\190 \208\177\209\139\208\187\208\176 \208\144\208\187\209\143 \226\128\147 \208\160\209\131\209\129\209\129\208\186\208\176\209\143 \208\180\208\181\208\178\209\131\209\136\208\186\208\176, \209\135\209\130\208\190 \208\191\208\181\209\128\208\181\208\181\209\133\208\176\208\187\208\176 \208\178 \208\175\208\191\208\190\208\189\208\184\209\142..."))
            ((language vi)
             (string
               "\226\128\156\208\152 \208\189\208\176\208\188\208\181\208\189\209\143\209\130\208\190\208\182\208\181 \208\190\208\177\209\128\208\176\209\130\208\184 \208\178\208\189\208\184\208\188\208\176\208\189\208\184\208\181\226\128\157\
              \n\
              \n\226\128\156H\225\187\159, g\195\172 th\225\186\191?\226\128\157\
              \n\
              \n\226\128\156C\195\179 g\195\172 \196\145\195\162u? T\195\180i n\195\179i \226\128\152C\195\161i t\195\170n n\195\160y \196\145\195\186ng l\195\160 \196\145\225\187\147 ng\225\187\145c\226\128\153 \195\189 m\195\160.\226\128\157\
              \n\
              \n\226\128\156C\225\186\173u th\195\180i c\195\161i tr\195\178 m\225\186\175ng ng\198\176\225\187\157i ta b\225\186\177ng ti\225\186\191ng Nga \196\145i!?\226\128\157\
              \n\
              \nArya - c\195\180 n\195\160ng xinh \196\145\225\186\185p tuy\225\187\135t tr\225\186\167n c\195\179 m\195\161i t\195\179c b\225\186\161ch kim ng\225\187\147i c\225\186\161nh t\195\180i - \196\145ang n\225\187\159 m\225\187\153t n\225\187\165 c\198\176\225\187\157i \196\145\225\186\175c th\225\186\175ng...\
              \n\
              \nNh\198\176ng s\225\187\177 th\225\186\173t th\195\172, c\195\162u ti\225\186\191ng Nga c\195\180 \225\186\165y v\225\187\171a n\195\179i c\195\179 ngh\196\169a l\195\160 [H\195\163y \196\145\225\187\131 \195\189 \196\145\225\186\191n t\195\180i \196\145i] c\198\161!\
              \n\
              \nT\195\180i - Kuze Masachika - l\195\160 ng\198\176\225\187\157i c\195\179 kh\225\186\163 n\196\131ng nghe hi\225\187\131u ti\225\186\191ng Nga th\195\180ng th\225\186\161o nh\198\176 ng\198\176\225\187\157i b\225\186\163n x\225\187\169. Nh\198\176ng kh\195\180ng h\225\187\129 hay bi\225\186\191t \196\145i\225\187\129u \196\145\195\179, c\195\180 n\195\160ng Arya h\195\180m nay v\225\186\171n ti\225\186\191p t\225\187\165c th\225\187\131 hi\225\187\135n nh\225\187\175ng c\225\186\163m x\195\186c r\225\186\165t ng\225\187\141t ng\195\160o b\225\186\177ng ti\225\186\191ng Nga khi\225\186\191n t\195\180i kh\195\180ng th\225\187\131 ng\225\187\171ng c\198\176\225\187\157i!?\
              \n\
              \nC\195\162u chuy\225\187\135n t\195\172nh thanh xu\195\162n h\195\160i h\198\176\225\187\155c c\225\187\167a t\195\180i v\225\187\155i c\195\180 n\195\160ng n\225\187\175 sinh trung h\225\187\141c g\225\187\145c Nga ho\195\160n h\225\186\163o \196\145\195\163 b\225\186\175t \196\145\225\186\167u nh\198\176 th\225\186\191..."))
            ((language pt-br)
             (string
               "Minha colega de classe que senta ao meu lado \195\169 meio-russa, chamada Alya, ela t\195\161 sempre provocando e sussurrando em russo, s\195\179 que ela n\195\163o sabe que entendo muito bem o idioma russo. \
              \n\
              \nAssim come\195\167a um grande com\195\169dia rom\195\162ntica."))))
          (is_locked false)
          (links
           (((provider al) (link 152404))
            ((provider ap) (link alya-sometimes-hides-her-feelings-in-russian))
            ((provider bw) (link series/402986))
            ((provider kt)
             (link tokidoki-bosotto-russiago-de-dereru-tonari-no-alya-san))
            ((provider mu) (link 6ytaio7))
            ((provider nu)
             (link
              the-neighboring-aarya-san-who-sometimes-acts-affectionate-and-murmuring-in-russian))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0BZCNH3MC))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2829708))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/750394))
            ((provider mal) (link 149334))
            ((provider raw)
             (link https://pocket.shonenmagazine.com/episode/316112896949466008))
            ((provider engtl) (link https://kmanga.kodansha.com/title/10509))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2022))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-10-13T16:17:11+00:00)
          (updated_at 2024-07-18T06:11:09+00:00) (version 61)
          (available_translated_languages
           (it mn vi ru fr en id es-la tr pt-br pl de my))
          (latest_uploaded_chapter a25900f8-46a3-49d9-9969-7d26be8a9b33)))
        (relationships
         (((id f880ad14-e3e2-4006-b247-cbff8d8b33b2) (type_ author))
          ((id 82bfa7dc-5521-4458-8b7f-3ac08c650db0) (type_ artist))
          ((id 4908b0a2-4137-46fe-8afb-75cbd5ae3cce) (type_ cover_art))
          ((id ccd322e2-47cb-4376-b91a-3f68b81b35ae) (type_ manga))
          ((id c3a21d7c-5c46-4367-9895-b8b04d6912e6) (type_ creator)))))
       ((id 3c355cfa-d8a9-495c-a50b-8729102ab2b7)
        (attributes
         ((title (((language en) (string "Shin Lupin III"))))
          (alt_titles
           ((((language en) (string "Lupin III - World's Most Wanted")))
            (((language en) (string "New Lupin III")))
            (((language ja-ro) (string "Shin Lupin Sansei")))
            (((language ja)
              (string
               "\230\150\176\227\131\171\227\131\145\227\131\179\228\184\137\228\184\150")))))
          (description
           (((language en)
             (string
               "Lupin the Third and his motley crew return in Shin Lupin III! This time, several of the stories are either brand new or adapted from or to the Lupin anime, and the beginning story was even animated by itself several years later!  \
              \n  \
              \nLupin the Third is the grandson of the famous literary thief Ars\195\168ne Lupin, and his partners in crime include the sharpshooter Jigen Daisuke, the stoic samurai Goemon Ishikawa the Thirteenth, and the on-again-off-again lover/enemy Fujiko Mine. Their goal is to outwit enemies bigger than themselves while nabbing the world's rarest and most important items, while also outwitting the dogged Inspector Zenigata, who's made it his life's work to capture and secure Lupin. In the manga however, his relationship with the titular thief isn't as \"respecting to the enemy\" as you would expect, as he's attempted multiple times to kill him without shedding a tear!   \
              \n  \
              \nWhat kind of sexy exploits will Lupin and his crew get up to next in\226\128\166Shin Lupin III!"))))
          (is_locked false)
          (links
           (((provider al) (link 35733)) ((provider ap) (link https))
            ((provider kt) (link https)) ((provider mu) (link 37869))
            ((provider amz)
             (link
              https://www.amazon.co.jp/-/en/%E3%83%A2%E3%83%B3%E3%82%AD%E3%83%BC%E3%83%BB%E3%83%91%E3%83%B3%E3%83%81-ebook/dp/B01B7CZDWY/))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/347200/))
            ((provider mal) (link 5733))))
          (original_language ja) (last_volume (16)) (last_chapter (188))
          (publication_demographic (seinen)) (status completed) (year (1977))
          (content_rating suggestive)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5ca48985-9a9d-4bd8-be29-80dc0303db72)
             (attributes
              ((name (((language en) (string Crime)))) (group genre) (version 1))))
            ((id 81183756-1453-4c81-aa9e-f6e1b63be016)
             (attributes
              ((name (((language en) (string Samurai)))) (group theme)
               (version 1))))
            ((id 85daba54-a71c-4554-8a28-9901a8b0afad)
             (attributes
              ((name (((language en) (string Mafia)))) (group theme) (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 97893a4c-12af-4dac-b6be-0dffb353568e)
             (attributes
              ((name (((language en) (string "Sexual Violence"))))
               (group content) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id df33b754-73a3-4c54-80e6-1a74a8058539)
             (attributes
              ((name (((language en) (string Police)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-04-18T18:40:26+00:00)
          (updated_at 2023-05-16T03:42:17+00:00) (version 14)
          (available_translated_languages (en pt-br))
          (latest_uploaded_chapter 9f09f0c5-b052-4f67-bd68-fabe69dc6c95)))
        (relationships
         (((id 61f2a43e-81ed-478e-8070-d035e8950fbc) (type_ author))
          ((id 61f2a43e-81ed-478e-8070-d035e8950fbc) (type_ artist))
          ((id cdc7e919-1b35-4f84-9a6a-8893ab3d161c) (type_ cover_art))
          ((id 50fe4f79-8c94-4052-bf66-2cf87f8efd34) (type_ manga))
          ((id 78f825f6-f695-49e9-ad43-4bf32484b0cc) (type_ manga))
          ((id a396a4d0-1bb3-44c2-89af-5a11ea7990a3) (type_ manga))
          ((id a7ffc606-6881-4053-ae64-78deae1bc5e8) (type_ manga))
          ((id cecca774-93a3-4b49-928b-5f6cb11547bf) (type_ manga))
          ((id f29a620a-f2f1-40dd-9119-2f8579664a5b) (type_ manga))
          ((id f5f240d5-edd6-4c51-ac58-20944d79d4ae) (type_ manga))
          ((id f61c1375-ba28-4ec8-888b-08c7cc2b8470) (type_ manga))
          ((id fe8a74e6-e0a7-4340-97cf-d78beaa21084) (type_ manga)))))
       ((id 19f7ffb3-92de-4ce5-ae0f-b943f0df76f0)
        (attributes
         ((title (((language en) (string "Global Examination"))))
          (alt_titles
           ((((language en) (string "Global University Entrance Examination")))
            (((language zh)
              (string "\229\133\168\231\144\131\233\171\152\232\128\131")))))
          (description
           (((language en)
             (string
              "This is a test that puts your life at stake. Pass the test and survive. When the two-faced examiner Qin Jiu meets the cold examinee You Huo, the two amnesiacs are put head to head in a fight by the inhumane system. However, they form a tactic agreement. The system collapses after a series of warnings and the erased memories gradually become clearer. It turns out that at the end of this smoke-filled world, you are still the first person I met. The world is brilliant and grand. Welcome home."))))
          (is_locked false)
          (links
           (((provider ap) (link global-examination))
            ((provider mu) (link xvytm0b))
            ((provider nu) (link global-university-entrance-examination))
            ((provider raw)
             (link https://manga.bilibili.com/detail/mc28455?from=manga_detail))))
          (original_language zh) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 5920b825-4181-4a17-beeb-9918b0ff7a30)
             (attributes
              ((name (((language en) (string "Boys' Love")))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-11-06T19:33:06+00:00)
          (updated_at 2024-07-25T09:08:05+00:00) (version 8)
          (available_translated_languages (en pl es-la))
          (latest_uploaded_chapter 7caf3f2e-4527-41cf-b7b8-e52bfb02eecf)))
        (relationships
         (((id 43bb8e22-7e23-4805-a47e-e66fdab05eff) (type_ author))
          ((id a7e43f35-57b6-46a3-8bc4-5706be97455e) (type_ author))
          ((id c71d9ce7-19a9-4a3e-b776-4809ebb3f532) (type_ author))
          ((id fe59346c-7260-45b4-ac95-70bccb8a4726) (type_ author))
          ((id 43bb8e22-7e23-4805-a47e-e66fdab05eff) (type_ artist))
          ((id a7e43f35-57b6-46a3-8bc4-5706be97455e) (type_ artist))
          ((id c71d9ce7-19a9-4a3e-b776-4809ebb3f532) (type_ artist))
          ((id fe59346c-7260-45b4-ac95-70bccb8a4726) (type_ artist))
          ((id 51b2f7e1-7690-4f47-9070-b6f27b255f55) (type_ cover_art)))))
       ((id ddd44276-89d1-4b8c-89e6-f5ea24e44079)
        (attributes
         ((title
           (((language en)
             (string
              "Mobile Suit Gundam: The Witch from Mercury - Vanadis Heart"))))
          (alt_titles
           ((((language ja)
              (string
               "\230\169\159\229\139\149\230\136\166\229\163\171\227\130\172\227\131\179\227\131\128\227\131\160 \230\176\180\230\152\159\227\129\174\233\173\148 \227\131\180\227\130\161\227\131\138\227\131\135\227\130\163\227\131\188\227\130\185\227\131\143\227\131\188\227\131\136")))
            (((language ja-ro)
              (string "Kidou Senshi Gundam: Suisei no Majo - Vanadis Heart")))))
          (description
           (((language en)
             (string
              "Five years have passed since the \"Vanadies Incident\" that denied all Gundams. The mobile suit, nicknamed \"The Curse,\" runs across the earth. The first official side story manga of \"The Witch of Mercury'' featuring Chika Tojo from \"Tanjo Senki''!"))
            ((language ja)
             (string
              "\227\129\153\227\129\185\227\129\166\227\129\174\227\130\172\227\131\179\227\131\128\227\131\160\227\130\146\229\144\166\229\174\154\227\129\151\227\129\159\227\128\140\227\131\180\227\130\161\227\131\138\227\131\135\227\130\163\227\131\188\227\130\185\228\186\139\229\164\137\227\128\141\227\129\139\227\130\137\239\188\149\229\185\180\229\190\140\226\128\149\226\128\149\227\128\130\226\128\156\229\145\170\227\129\132\226\128\157\227\129\168\231\167\176\227\129\149\227\130\140\227\129\159\227\129\157\227\129\174\227\131\162\227\131\147\227\131\171\227\130\185\227\131\188\227\131\132\227\129\175\227\128\129\229\156\176\231\144\131\227\129\174\229\164\167\229\156\176\227\130\146\233\167\134\227\129\145\229\183\161\227\130\139\227\128\130\227\128\142\229\185\188\229\165\179\230\136\166\232\168\152\227\128\143\227\129\174\230\157\177\230\162\157\227\131\129\227\130\171\227\130\146\232\191\142\227\129\136\227\129\166\232\180\136\227\130\139\227\128\129\227\128\142\230\176\180\230\152\159\227\129\174\233\173\148\229\165\179\227\128\143\229\136\157\227\129\174\229\133\172\229\188\143\229\164\150\228\188\157\230\188\171\231\148\187\239\188\129"))))
          (is_locked false)
          (links
           (((provider al) (link 163179))
            ((provider ap)
             (link mobile-suit-gundam-the-witch-from-mercury-vanadis-heart))
            ((provider bw) (link series/426644)) ((provider mu) (link sn53nvu))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0CXP8JP5Z))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/775700/))
            ((provider mal) (link 157604))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 50880a9d-5440-4732-9afb-8f457127e836)
             (attributes
              ((name (((language en) (string Mecha)))) (group genre) (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b1e97889-25b4-4258-b28b-cd7f4d28ea9b)
             (attributes
              ((name (((language en) (string Philosophical)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-04-15T02:27:43+00:00)
          (updated_at 2024-04-01T02:02:41+00:00) (version 8)
          (available_translated_languages (vi en fr))
          (latest_uploaded_chapter d5c25caa-d735-43e1-9930-7d26dbb8700b)))
        (relationships
         (((id 35e84afb-7db2-4633-a1c3-db5e9bae4795) (type_ author))
          ((id fc2bcc6e-487a-4686-8e68-39b65b126b2c) (type_ artist))
          ((id b1804bb4-f51f-4ffe-967b-6e2abda482de) (type_ cover_art))
          ((id 28d5c266-b0da-4bf3-9207-eeda3628c2f0) (type_ manga))
          ((id 3567d6dc-9f49-47c5-9190-7e7396423adf) (type_ manga))
          ((id 4611c0b4-e55a-4f20-a9d9-9707bf2b6c8f) (type_ manga))
          ((id 4d3a5843-b981-4f83-a39f-26888d947a7c) (type_ manga))
          ((id 55f5fbbf-aa95-4652-9dfa-ab755d16deeb) (type_ manga))
          ((id 8cbba391-3ca8-40e3-892c-f923629a4767) (type_ manga))
          ((id b1a2a73b-ba0c-4e10-8445-cd2e50ac7813) (type_ manga))
          ((id b6a99217-05a4-4015-8706-4e14041f74f8) (type_ manga))
          ((id f36895e4-5045-4a5c-a8ec-c073d8958433) (type_ manga))
          ((id fbbc7e61-abac-4849-a190-98a62fee7567) (type_ manga))
          ((id 7ac55554-6ba0-4f3e-95db-2f5abc28e910) (type_ creator)))))
       ((id 4a89da3a-ebf9-467b-94a1-beeb7d1bd3e8)
        (attributes
         ((title (((language en) (string "Koi yori Aoku"))))
          (alt_titles
           ((((language ja)
              (string
               "\230\129\139\227\130\136\227\130\138\233\157\146\227\129\143")))
            (((language en) (string "A Love Yet To Bloom")))
            (((language ko)
              (string
               "\236\130\172\235\158\145\235\179\180\235\139\164 \237\145\184\235\165\184")))
            (((language en) (string "Bluer Than Love")))))
          (description
           (((language en)
             (string
               "Takamine, who can't find anything she likes, and Sakikura, who loves books. The two girls meet by chance and spend their after-school hours together. Are they friends? Or is it a nameless relationship spun between the two girls?\
              \n\
              \n------------\
              \nNote: Serialization of the oneshot of same title by Fukaumi Kon in COMIC Ogyaaa!! published by Homesha."))))
          (is_locked false)
          (links
           (((provider al) (link 164581)) ((provider ap) (link koi-yori-aoku))
            ((provider bw) (link de2ff36cab-cfb7-4b8f-baf5-e233358a201d))
            ((provider kt) (link a-love-yet-to-bloom))
            ((provider mu) (link 5gv1zpt))
            ((provider amz)
             (link
              https://www.amazon.co.jp/%E6%B7%B1%E6%B5%B7%E7%B4%BA-ebook/dp/B0CHW9879T))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2890304))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/786016/))
            ((provider mal) (link 162601))
            ((provider raw)
             (link https://comic-ogyaaa.com/episode/4856001361171643976))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (josei)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-05-05T16:50:43+00:00)
          (updated_at 2023-09-25T06:54:46+00:00) (version 14)
          (available_translated_languages (pl en id ko))
          (latest_uploaded_chapter 26c95f59-2838-43e6-a9de-7724cb1fa30b)))
        (relationships
         (((id b2afa258-bb77-49ae-8299-2b700af15bb1) (type_ author))
          ((id b2afa258-bb77-49ae-8299-2b700af15bb1) (type_ artist))
          ((id 1d603185-6838-4d2f-84ee-a0233a2c19ea) (type_ cover_art))
          ((id 06667f19-5a9e-48b4-a1cd-4de12ab699ae) (type_ manga))
          ((id 71102a28-fa60-4ca2-8275-ad77950aa221) (type_ creator)))))
       ((id 67444c14-2773-4b79-b20a-003d9960564d)
        (attributes
         ((title (((language en) (string "Black Killer Whale Baby"))))
          (alt_titles
           ((((language ko)
              (string
               "\237\157\145\235\167\137 \235\178\148\234\179\160\235\158\152 \236\149\132\234\184\176\235\139\152")))
            (((language en) (string "Orca Baby, the Mastermind")))
            (((language en) (string "A Villainous Baby Killer Whale")))
            (((language es-la) (string "La beb\195\169 orca negra")))))
          (description
           (((language en)
             (string
               "Calypso has experienced repeated reincarnation, and is her 4th reincarnation. \
              \n\
              \nIn her previous lives, she always died before she reached the age of 22 and returned to where everything started. During her 3rd life, she discovered that when a dragon goes on a rampage, it distorts dimensions. \
              \n\
              \nDetermined to use this knowledge, she plans to exploit the dragon\226\128\153s power to return to her original world. Currently, Calypso finds herself in a childcare story, where she encounters a man who she believes to be her father but doesn\226\128\153t recognize her. \
              \n\
              \nSeeking his help, Calypso involves her \"father\" and family in her quest, turning them into unwitting allies in her journey."))
            ((language es-la)
             (string
               "Un d\195\173a, un ni\195\177o peque\195\177o apareci\195\179 ante m\195\173. \226\128\156\194\191Sabes d\195\179nde est\195\161 la academia? \194\161Tengo que ir ah\195\173! \226\128\156 \226\128\156Has estado yendo en la direcci\195\179n equivocada todo este tiempo. \226\128\156 \226\128\157 !!! \226\128\156 \226\128\156\194\191Qu\195\169 est\195\161 mirando, se\195\177or?\226\128\157 Supongo que esta es mi hija. \"\194\191Quieres uno?\" Pero no creo que ella sepa que soy su padre... Probablemente est\195\169s pensando eso, \194\191verdad? \194\161Si crees eso, est\195\161s equivocado, pap\195\161! Mi nombre es Calypso, un regresor cuatro veces. Mi vida se arruin\195\179 cuando pose\195\173 un personaje de novela. \194\161Incluso tuve un hijo! \194\161El tercer episodio de mi vida fue un final de masacre! '\194\161Ustedes XX chicos que est\195\161n locos por esta protagonista femenina!' Sin embargo, por alguna raz\195\179n, no importa lo que haga, no puedo pasar de mi cumplea\195\177os n\195\186mero 22 y regresar a mi mundo. \
              \nSin embargo, accidentalmente encontr\195\169 una manera en la tercera partida cuando el drag\195\179n se sali\195\179 de control y muri\195\179. Cuando el drag\195\179n corre desenfrenado, \194\161la dimensi\195\179n se distorsiona! \194\191Puedo volver a la casa en la que viv\195\173 durante eso? La cuarta vez, cuando regres\195\169 nuevamente, decid\195\173 usar este drag\195\179n. \194\191Abby? \194\191Hermanos mayores? \194\161Todo es solo un trampol\195\173n para encontrarte con el drag\195\179n! \"\194\161Espera, drag\195\179n!\" [Quiero morir ahora, pero me estoy volviendo loco con todos estos retornos repetidos.] [Mi familia est\195\161 ligada a la familia real] [\194\191Alguien ha o\195\173do hablar alguna vez de los d\195\169biles?/ S\195\179lo los m\195\161s fuertes son felices]"))))
          (is_locked false)
          (links
           (((provider ap) (link black-killer-whale-baby))
            ((provider mu) (link nrlpqgu))
            ((provider nu) (link black-killer-whale-baby))
            ((provider mal) (link 172015))
            ((provider raw)
             (link https://page.kakao.com/content/64409505?tab_type=overview))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 3de8c75d-8ee3-48ff-98ee-e20a65c86451)
             (attributes
              ((name (((language en) (string Animals)))) (group theme)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-06-30T18:27:34+00:00)
          (updated_at 2024-07-19T19:18:43+00:00) (version 12)
          (available_translated_languages (en es-la pt-br))
          (latest_uploaded_chapter b1e873b5-bdb3-433f-b5a1-730018e34508)))
        (relationships
         (((id 714cd71e-85ad-497b-94f9-3c5c375f2bd4) (type_ author))
          ((id 78c2be12-4045-4be4-a715-ee6122dcd638) (type_ author))
          ((id af987b7a-f304-4f46-9def-19ec9829a49e) (type_ author))
          ((id 4cae0b61-d0b7-4e68-8f9e-e081ac82841f) (type_ artist))
          ((id 78c2be12-4045-4be4-a715-ee6122dcd638) (type_ artist))
          ((id 18584ba5-ea58-4f53-9be1-192e0bf371a9) (type_ cover_art))
          ((id 3db22aa4-98ed-4926-b357-e7b39e63c2e5) (type_ manga))
          ((id f97b649b-b614-4cae-9b17-d460412e2b7a) (type_ creator)))))
       ((id 9a414441-bbad-43f1-a3a7-dc262ca790a3)
        (attributes
         ((title (((language en) (string "Omniscient Reader's Viewpoint"))))
          (alt_titles
           ((((language ko)
              (string
               "\236\160\132\236\167\128\236\160\129 \235\143\133\236\158\144 \236\139\156\236\160\144")))
            (((language fr) (string "Lecteur omniscient")))
            (((language es) (string "Lector omnisciente")))
            (((language en) (string ORV)))
            (((language pl)
              (string "Punkt Widzenia Wszechwiedz\196\133cego Czytelnika")))
            (((language ru)
              (string
               "\208\146\209\129\208\181\208\178\208\181\208\180\209\131\209\137\208\184\208\185 \209\135\208\184\209\130\208\176\209\130\208\181\208\187\209\140")))
            (((language ar)
              (string
               "\216\175\219\140\216\175\218\175\216\167\217\135 \216\174\217\136\216\167\217\134\217\134\216\175\217\135\226\128\140\219\140 \217\135\217\133\217\135\226\128\140\218\134\219\140\226\128\140\216\175\217\136\217\134")))
            (((language ar)
              (string
               "\217\136\216\172\217\135\216\169 \217\134\216\184\216\177 \216\167\217\132\217\130\216\167\216\177\216\166 \216\167\217\132\216\185\216\177\216\167\217\129")))
            (((language th)
              (string
               "\224\184\173\224\185\136\224\184\178\224\184\153\224\184\138\224\184\176\224\184\149\224\184\178\224\184\167\224\184\177\224\184\153\224\184\170\224\184\180\224\185\137\224\184\153\224\185\130\224\184\165\224\184\129")))
            (((language ja)
              (string
               "\229\133\168\231\159\165\231\154\132\227\129\170\232\170\173\232\128\133\227\129\174\232\166\150\231\130\185\227\129\139\227\130\137")))
            (((language zh-hk)
              (string
               "\229\133\168\231\159\165\232\174\128\232\128\133\232\166\150\232\167\146")))
            (((language zh)
              (string "\229\133\168\231\159\165\232\175\187\232\128\133")))
            (((language ko) (string "\236\160\132\235\143\133\236\139\156")))
            (((language ko) (string "Jeonjijeok Dokja Sijeom")))
            (((language en) (string "Omniscient Reader")))
            (((language de) (string "Der allwissende Leser")))
            (((language vi)
              (string
               "To\195\160n Tr\195\173 \196\144\225\187\153c Gi\225\186\163")))
            (((language zh)
              (string
               "\229\133\168\231\159\165\232\175\187\232\128\133\232\167\134\232\167\146")))
            (((language vi)
              (string
               "G\195\179c nh\195\172n c\225\187\167a \196\144\225\187\153c gi\225\186\163 To\195\160n tri")))))
          (description
           (((language de)
             (string
               "Damals hatte Dokja noch \195\188berhaupt keine Ahnung. Er hatte keine Ahnung, dass sein Lieblings-Web-Roman \226\128\152Drei Wege um die Apokalypse zu \195\188berleben\226\128\153 Realit\195\164t wird und dass er der einzige ist, der wei\195\159 wie der Weltuntergang aussehen wird. Er hatte auch keine Ahnung, dass er letztendlich der Protagonist von diesem Roman werden w\195\188rde. Jetzt begibt sich Dokja auf eine Reise, um den Lauf der Geschichte zu \195\164ndern und die Menschheit zu retten!\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language en)
             (string
              "Dokja was an average office worker whose sole interest was reading his favorite web novel 'Three Ways to Survive the Apocalypse.' But when the novel suddenly becomes reality, he is the only person who knows how the world will end. Armed with this realization, Dokja uses his understanding to change the course of the story, and the world, as he knows it."))
            ((language es)
             (string
               "En ese entonces, Dokja no ten\195\173a idea de que su novela web favorita, Tres maneras de sobrevivir al apocalipsis, cobrar\195\173a vida y que solo \195\169l sabr\195\173a c\195\179mo iba a terminar el mundo. Tampoco ten\195\173a idea de que se convertir\195\173a en el protagonista de esta novela transformada en realidad. Ahora Dokja debe embarcarse en un viaje para alterar el curso de la historia y salvar a la humanidad de una vez por todas.\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language fr)
             (string
               "\194\171 Je suis le seul lecteur \195\160 conna\195\174tre la fin du monde. \194\187 [Les trois fa\195\167ons de survivre dans un monde en ruine], ce roman fantastique de 3 149 chapitres, est devenu la r\195\169alit\195\169. Et il n'existe qu'une seule personne qui a lu l'int\195\169gralit\195\169 de l'ouvrage.\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language id)
             (string
               "\"Jalan cerita ini... hanya aku yang tahu!\" Dunia baru akan datang, maka dunia yang lama harus hancur. Apakah dia bisa menyelamatkan diri dari kehancuran dunia yang lama?!\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language ja)
             (string
               "\227\128\140\227\129\130\227\130\138\227\129\136\227\129\170\227\129\132...\227\129\147\227\130\140\227\129\175\228\191\186\227\129\140\231\159\165\227\129\163\227\129\166\227\129\132\227\130\139\229\177\149\233\150\139\227\129\160\227\128\130\227\128\141 10\229\185\180\228\187\165\228\184\138\232\170\173\227\129\191\231\182\154\227\129\145\227\129\159\229\176\143\232\170\172\227\129\174\230\156\128\231\181\130\232\169\177\227\130\146\232\170\173\227\130\147\227\129\160\230\151\165\227\128\129\228\184\150\231\149\140\227\129\175\230\187\133\228\186\161\227\129\151\229\176\143\232\170\172\227\129\174\228\184\150\231\149\140\227\129\140\231\143\190\229\174\159\227\129\168\227\129\170\227\129\163\227\129\159\227\128\130 \229\185\179\229\135\161\227\129\167\229\134\180\227\129\136\227\129\170\227\129\132\227\130\181\227\131\169\227\131\170\227\131\188\227\131\158\227\131\179\227\129\174\228\184\187\228\186\186\229\133\172\227\131\187\227\131\137\227\130\175\227\130\183\227\131\163\227\128\130 \227\129\157\227\130\147\227\129\170\229\189\188\227\129\174\232\182\163\229\145\179\227\129\175WEB\229\176\143\232\170\172\227\128\142\230\187\133\228\186\161\227\129\151\227\129\159\228\184\150\231\149\140\227\129\167\231\148\159\227\129\141\230\174\139\227\130\139\239\188\147\227\129\164\227\129\174\230\150\185\230\179\149\227\128\143\227\130\146\232\170\173\227\130\128\227\129\147\227\129\168\227\128\130 \227\129\164\227\129\132\227\129\171\230\156\128\231\181\130\232\169\177\227\130\146\232\170\173\227\129\191\231\181\130\227\129\136\227\129\159\227\129\139\227\129\168\230\128\157\227\129\132\227\129\141\227\130\132\227\128\129\228\189\156\232\128\133\227\129\139\227\130\137\227\129\174\227\131\161\227\131\131\227\130\187\227\131\188\227\130\184\227\129\140\229\177\138\227\129\141\229\176\143\232\170\172\227\129\174\227\131\162\227\131\179\227\130\185\227\130\191\227\131\188\227\129\168\231\153\187\229\160\180\228\186\186\231\137\169\227\129\140\231\170\129\229\166\130\231\143\190\227\130\140\227\128\129\230\150\176\227\129\159\227\129\170\228\184\150\231\149\140\227\129\140\229\185\149\227\130\146\233\150\139\227\129\145\227\129\159\239\188\129 \227\128\140\228\191\186\227\129\175\227\128\129\227\129\147\227\129\174\228\184\150\231\149\140\227\129\174\231\181\144\230\156\171\227\130\146\231\159\165\227\130\139\229\148\175\228\184\128\227\129\174\232\170\173\232\128\133\227\129\168\227\129\170\227\129\163\227\129\159\227\128\130\227\128\141 \227\129\159\227\129\163\227\129\159\228\184\128\228\186\186\227\129\160\227\129\145\227\129\140\232\170\173\227\129\191\231\181\130\227\129\136\227\129\159\227\131\149\227\130\161\227\131\179\227\130\191\227\130\184\227\131\188\229\176\143\232\170\172\227\129\140\231\143\190\229\174\159\227\129\171\227\128\130 \230\158\156\227\129\159\227\129\151\227\129\166\227\131\137\227\130\175\227\130\183\227\131\163\227\129\175\230\187\133\228\186\161\227\129\151\227\129\159\228\184\150\231\149\140\227\130\146\230\149\145\227\129\134\227\129\147\227\129\168\227\129\140\227\129\167\227\129\141\227\130\139\227\129\174\227\129\139\239\188\159\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language ko)
             (string
               "'\236\157\180\234\177\180 \235\130\180\234\176\128 \236\149\132\235\138\148 \234\183\184 \236\160\132\234\176\156\235\139\164'\r\
              \n\237\149\156\236\136\156\234\176\132\236\151\144 \236\132\184\234\179\132\234\176\128 \235\169\184\235\167\157\237\149\152\234\179\160, \236\131\136\235\161\156\236\154\180 \236\132\184\236\131\129\236\157\180 \237\142\188\236\179\144\236\161\140\235\139\164.\r\
              \n\236\152\164\236\167\129 \235\130\152\235\167\140\236\157\180 \236\153\132\236\163\188\237\150\136\235\141\152 \236\134\140\236\132\164 \236\132\184\234\179\132\236\151\144\236\132\156 \237\143\137\235\178\148\237\150\136\235\141\152 \235\143\133\236\158\144\236\157\152 \236\131\136\235\161\156\236\154\180 \236\130\182\236\157\180 \236\139\156\236\158\145\235\144\156\235\139\164.\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language ru)
             (string
               "\194\171\208\175 \208\183\208\189\208\176\209\142 \209\130\208\190, \209\135\209\130\208\190 \209\129\208\181\208\185\209\135\208\176\209\129 \208\177\209\131\208\180\208\181\209\130\194\187.\r\
              \n\208\146 \209\130\208\190\209\130 \208\188\208\190\208\188\208\181\208\189\209\130, \208\186\208\190\208\179\208\180\208\176 \208\190\208\189 \208\191\208\190\208\180\209\131\208\188\208\176\208\187 \208\190\208\177 \209\141\209\130\208\190\208\188, \208\188\208\184\209\128 \208\177\209\139\208\187 \209\131\208\182\208\181 \209\128\208\176\208\183\209\128\209\131\209\136\208\181\208\189, \208\184 \208\178\208\180\209\128\209\131\208\179 \208\190\209\130\208\186\209\128\209\139\208\187\208\176\209\129\209\140 \208\189\208\190\208\178\208\176\209\143 \208\178\209\129\208\181\208\187\208\181\208\189\208\189\208\176\209\143. \208\157\208\190\208\178\208\176\209\143 \208\182\208\184\208\183\208\189\209\140 \208\190\208\177\209\139\209\135\208\189\208\190\208\179\208\190 \209\135\208\184\209\130\208\176\209\130\208\181\208\187\209\143 \208\189\208\176\209\135\208\184\208\189\208\176\208\181\209\130\209\129\209\143 \208\178 \208\188\208\184\209\128\208\181 \209\128\208\190\208\188\208\176\208\189\208\176, \209\128\208\190\208\188\208\176\208\189\208\176, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \209\129\208\188\208\190\208\179 \208\191\209\128\208\190\209\135\208\181\209\129\209\130\209\140 \208\187\208\184\209\136\209\140 \208\190\208\189.\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language th)
             (string
               "\"\224\185\128\224\184\148\224\184\181\224\185\139\224\184\162\224\184\167\224\184\153\224\184\176 \224\184\170\224\184\150\224\184\178\224\184\153\224\184\129\224\184\178\224\184\163\224\184\147\224\185\140\224\184\153\224\184\181\224\185\136\224\184\161\224\184\177\224\184\153\224\184\132\224\184\184\224\185\137\224\184\153\224\185\134?\" \224\185\130\224\184\165\224\184\129\224\185\131\224\184\154\224\185\128\224\184\148\224\184\180\224\184\161\224\184\158\224\184\165\224\184\180\224\184\129\224\184\156\224\184\177\224\184\153\224\185\132\224\184\155\224\185\131\224\184\153\224\184\138\224\184\177\224\185\136\224\184\167\224\184\158\224\184\163\224\184\180\224\184\154\224\184\149\224\184\178! \224\184\138\224\184\181\224\184\167\224\184\180\224\184\149\224\184\158\224\184\153\224\184\177\224\184\129\224\184\135\224\184\178\224\184\153\224\184\154\224\184\163\224\184\180\224\184\169\224\184\177\224\184\151\224\184\152\224\184\163\224\184\163\224\184\161\224\184\148\224\184\178\224\185\134 \224\184\130\224\184\173\224\184\135\224\184\156\224\184\161\224\185\128\224\184\155\224\184\165\224\184\181\224\185\136\224\184\162\224\184\153\224\185\129\224\184\155\224\184\165\224\184\135\224\185\132\224\184\155\224\184\173\224\184\162\224\185\136\224\184\178\224\184\135\224\184\137\224\184\177\224\184\154\224\184\158\224\184\165\224\184\177\224\184\153 \224\184\153\224\184\181\224\185\136\224\184\161\224\184\177\224\184\153\224\185\130\224\184\165\224\184\129\224\185\131\224\184\153\224\184\153\224\184\180\224\184\162\224\184\178\224\184\162\224\184\151\224\184\181\224\185\136\224\184\161\224\184\181\224\184\156\224\184\161\224\184\173\224\185\136\224\184\178\224\184\153\224\184\173\224\184\162\224\184\185\224\185\136\224\185\129\224\184\132\224\185\136\224\184\132\224\184\153\224\185\128\224\184\148\224\184\181\224\184\162\224\184\167\224\184\153\224\184\181\224\185\136!\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))
            ((language vi)
             (string
              "'M\195\172nh bi\225\186\191t di\225\187\133n bi\225\186\191n ti\225\186\191p theo c\225\187\167a c\195\162u chuy\225\187\135n n\195\160y.' Ngay trong kho\225\186\163nh kh\225\186\175c \225\186\165y, th\225\186\191 gi\225\187\155i c\197\169 b\225\187\139 di\225\187\135t vong, v\195\160 m\225\187\153t th\225\186\191 gi\225\187\155i kh\195\161c \196\145\198\176\225\187\163c m\225\187\159 ra. Cu\225\187\153c s\225\187\145ng c\225\187\167a m\225\187\153t \196\145\225\187\153c gi\225\186\163 t\225\186\167m th\198\176\225\187\157ng b\225\187\151ng chuy\225\187\131n sang ch\198\176\198\161ng m\225\187\155i, gi\225\187\175a th\225\186\191 gi\225\187\155i c\225\187\167a m\225\187\153t cu\225\187\145n ti\225\187\131u thuy\225\186\191t n\225\187\141, m\225\187\153t cu\225\187\145n ti\225\187\131u thuy\225\186\191t m\195\160 ch\225\187\137 m\195\172nh anh ta bi\225\186\191t \196\145\198\176\225\187\163c k\225\186\191t c\225\187\165c."))
            ((language zh-hk)
             (string
               "\227\128\140\230\130\168\230\148\182\229\136\176\228\186\134\228\184\187\231\183\154\228\187\187\229\139\153\227\128\130\227\128\141 \233\149\183\232\145\151\232\167\146\231\154\132\229\166\150\230\128\170\239\188\140\231\134\159\230\130\137\231\154\132\228\186\186\231\137\169\231\153\187\229\160\180\226\128\166\226\128\166 \229\164\170\230\137\175\228\186\134...\233\128\153\230\152\175\230\136\145\230\137\128\232\174\128\233\129\142\231\154\132\229\176\143\232\170\170\229\138\135\230\131\133\239\188\129\r\
              \n\r\
              \n---\r\
              \n- [Webtoon Trailer](https://www.youtube.com/watch?v=cB9fwJAnQFk) | [ENG](https://www.youtube.com/watch?v=8OHzcTtoLo4)\r\
              \n---\r\
              \n- [Original Book <Aladin>](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=258422833)\r\
              \n- [Original Book <Yes24>](http://www.yes24.com/Product/Goods/96195415)\r\
              \n>\r\
              \n- [Taiwan Official Website](https://www.starwatcher.com.tw/edm/orv/)\r\
              \n---\r\
              \n- [Official Traditional Chinese Translation](https://www.webtoons.com/zh-hant/fantasy/duzhe/list?title_no=2089)\r\
              \n\r\
              \n- [Official Simplified Chinese Translation](https://www.podoteng.com/)\r\
              \n\r\
              \n- [Official Spanish <Es> Translation](https://www.webtoons.com/es/fantasy/omniscient-reader/list?title_no=2208)\r\
              \n\r\
              \n- [Official Indonesian Translation](https://www.webtoons.com/id/fantasy/omniscient-reader/list?title_no=2109)\r\
              \n\r\
              \n- [Official Japanese Translation](https://manga.line.me/product/periodic?id=Z0000822)\r\
              \n\r\
              \n- [Official German Translation](https://www.webtoons.com/de/fantasy/omniscient-reader/list?title_no=2582)\r\
              \n\r\
              \n- [Official French Translation](https://www.webtoons.com/fr/fantasy/omniscient-reader/list?title_no=2175)\r\
              \n\r\
              \n- [Official Thai Translation](https://www.webtoons.com/th/fantasy/omniscient-reader/list?title_no=2106)\r\
              \n---\r\
              \n- [Web Novel Trailer](https://www.youtube.com/watch?v=5hHGZKgzEXo)\r\
              \n>\r\
              \n- Original Web Novel <Naver> [Web](https://series.naver.com/novel/detail.series?productNo=3400123)/[Book](https://series.naver.com/novel/detail.series?productNo=6020546)\r\
              \n- Original Web Novel <Munpia> [Web](https://novel.munpia.com/104753)/[Book](https://novel.munpia.com/256726)\r\
              \n---\r\
              \n- [3B2S Website](http://3b2s.co.kr/?page_id=1477)"))))
          (is_locked true)
          (links
           (((provider al) (link 119257))
            ((provider ap) (link omniscient-readers-viewpoint))
            ((provider kt) (link omniscient-readers-point-of-view))
            ((provider mu) (link 167681))
            ((provider nu) (link omniscient-readers-viewpoint))
            ((provider mal) (link 132214))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=747269))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/action/omniscient-reader/list?title_no=2154))))
          (original_language ko) (last_volume ()) (last_chapter ())
          (publication_demographic ()) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 9467335a-1b83-4497-9231-765337a00b96)
             (attributes
              ((name (((language en) (string Post-Apocalyptic)))) (group theme)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-07-23T10:37:19+00:00)
          (updated_at 2023-07-15T15:10:35+00:00) (version 34)
          (available_translated_languages
           (es-la it pt-br en id pl th tr de ru vi uk hu bg fr es ar he))
          (latest_uploaded_chapter 4b5910bc-7337-4510-99e2-4c54da40f273)))
        (relationships
         (((id 385c7225-4a07-4f78-bb5e-8f79fb802bbd) (type_ author))
          ((id b117b481-a835-4a00-80e4-865d1b21717c) (type_ author))
          ((id 48bc1ea4-50b5-48ca-bc34-b6c3f216f22a) (type_ artist))
          ((id 3a349b55-abf9-4fe8-b65d-c366d326bdb5) (type_ cover_art))
          ((id 14b81959-13ed-46eb-a277-da66f672acb5) (type_ manga))
          ((id 46392cb3-a0f8-42e4-b2ac-b89637df56d9) (type_ manga))
          ((id 64beeb43-c3fd-4392-a45d-e688ba5e0ade) (type_ manga))
          ((id aa0df6ce-a7dd-45d2-af0e-780b9d29a011) (type_ manga))
          ((id e8067480-6c51-4c61-a365-50f36461644e) (type_ manga)))))
       ((id eb1e9858-5d3c-4c3e-a394-12c5b4d0b55f)
        (attributes
         ((title (((language en) (string Re:Monster))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\170\227\131\187\227\131\162\227\131\179\227\130\185\227\130\191\227\131\188")))
            (((language th)
              (string
               "Re:Monster \224\184\163\224\184\178\224\184\138\224\184\177\224\184\153\224\184\138\224\184\178\224\184\149\224\184\180\224\184\173\224\184\170\224\184\185\224\184\163")))
            (((language ru)
              (string
               "\208\159\208\181\209\128\208\181\209\128\208\190\208\182\208\180\208\181\208\189\208\184\208\181: \208\156\208\190\208\189\209\129\209\130\209\128")))
            (((language zh-hk)
              (string "\233\135\141\239\188\142\230\128\170\231\137\169")))
            (((language pt-br) (string Re:Monster)))))
          (description
           (((language en)
             (string
              "Tomokui Kanata has been reincarnated into the weakest race, goblin, and given a new name, Gobrou, after having undergone an unfortunate death. However, Gobrou has retained his previous life's memories and ability to learn skills from what he eats. In this alternate world of survival of the fittest, events unfold. Will a goblin party become the heroes of this world, in a delightful twist from your usual scenario?"))
            ((language pt-br)
             (string
              "Tomokui Kanata reincarnou na ra\195\167a mais fraca, a dos goblins e ganhou um novo nome, Rou, ap\195\179s ter morrido de forma infeliz. Entretanto, o goblin Rou preservou as lembran\195\167as de sua vida passada, ganhando uma evolu\195\167\195\163o incomum, mas mantendo sua capacidade de ganhar habilidades por com\195\170-los. Neste mundo alternativo de sobreviv\195\170ncia do mais forte, com o desenrolar dos acontecimentos, ir\195\161 o grupo do goblins se tornarem os her\195\179is deste mundo e o transformarem em um cen\195\161rio totalmente diferente do habitual? Ele ir\195\161 se tornar o her\195\179i deste mundo ou um soberano das trevas dominar\195\161 a todos?"))))
          (is_locked false)
          (links
           (((provider al) (link 85495)) ((provider ap) (link re-monster))
            ((provider bw) (link series/62182/list)) ((provider kt) (link 25426))
            ((provider mu) (link 109745)) ((provider nu) (link remonster))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B07P5VXVHD))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/433048/))
            ((provider mal) (link 73271))
            ((provider raw)
             (link http://www.alphapolis.co.jp/manga/viewOpening/609000058))
            ((provider engtl)
             (link http://www.sevenseasentertainment.com/series/remonster))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2014))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id 97893a4c-12af-4dac-b6be-0dffb353568e)
             (attributes
              ((name (((language en) (string "Sexual Violence"))))
               (group content) (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-09-13T00:41:40+00:00)
          (updated_at 2024-07-19T16:04:16+00:00) (version 42)
          (available_translated_languages (id es pl pt-br ru de en fr uk it))
          (latest_uploaded_chapter ff39a915-5518-4849-b140-f97f68df327d)))
        (relationships
         (((id f7480af7-0db7-4ed6-a168-c7fa41cd7dc3) (type_ author))
          ((id 53f12797-f9d3-45e4-a7fa-6a43252a4c98) (type_ artist))
          ((id 3883a665-0e1c-4c20-8b83-60466a6bf764) (type_ cover_art)))))
       ((id 9547d8e5-048c-4c71-9b7c-97a3af0423eb)
        (attributes
         ((title (((language en) (string "Spinach Bouquet"))))
          (alt_titles
           ((((language ko)
              (string
               "\236\139\156\234\184\136\236\185\152 \234\189\131\235\139\164\235\176\156")))
            (((language en) (string "Spinach Flowers")))))
          (description
           (((language en)
             (string
               "Ji-woo transfers to a rural school with his parents who have returned to farming. The fresh air, the relaxed atmosphere... he liked them all. However, for a moment that seemed like a pleasant start,\
              \n\
              \nJi-woo discovers that the flower garden that he has carefully cared for has been messed up.. Ji-woo, who thought it was someone's territoriality, suspects Dongchan, who was particularly harsh to him at school.\
              \nFirst off, that bangs! I'll start with those bangs that make it impossible to know what you're thinking!!"))
            ((language fr)
             (string
              "La vie \195\160 la campagne est cens\195\169e \195\170tre idyllique, non ? Un endroit paisible rempli d'aimables voisins au grand c\197\147ur, pas vrai ? C'est ce que Jiwoo attend avec impatience... Mais de tous les voisins qu'il aurait pu avoir, c'est Dongchan qu'il est le sien. Froid, distant et insondable, Dongchan n'est pas le plus accueillant du voisinage. En fait, on dirait qu'il n\226\128\153a pas du tout envie que Jiwoo et sa famille s\226\128\153installent ici. D\195\169concert\195\169 mais pas d\195\169courag\195\169, Jiwoo fait de son mieux pour s'adapter \195\160 la vie \195\160 la campagne... jusqu'\195\160 ce qu'il s'av\195\168re que quelqu'un essaie de chasser sa famille d'ici. Jiwoo a des soup\195\167ons, mais sera-t-il capable de trouver le vrai coupable ?"))
            ((language ko)
             (string
               "\234\183\128\235\134\141\237\149\156 \235\182\128\235\170\168\235\139\152\236\157\132 \235\148\176\235\157\188 \236\139\156\234\179\168 \237\149\153\234\181\144\235\161\156 \236\160\132\237\149\153 \236\152\168 \236\167\128\236\154\176. \236\131\129\236\190\140\237\149\156 \234\179\181\234\184\176, \236\151\172\236\156\160\235\161\156\236\154\180 \235\182\132\236\156\132\234\184\176.. \235\170\168\235\145\144 \235\167\136\236\157\140\236\151\144 \235\147\164\236\151\136\235\139\164. \234\183\184\235\159\172\235\130\152 \234\184\176\235\182\132 \236\162\139\234\178\140 \236\131\136\236\182\156\235\176\156 \237\149\160 \236\136\152 \236\158\136\236\157\132 \234\178\131 \234\176\153\236\149\152\235\141\152 \234\178\131\235\143\132 \236\158\160\236\139\156,\
              \n\236\167\128\236\154\176\235\132\164\234\176\128 \236\160\149\236\132\177\234\187\143 \234\176\128\234\190\188 \234\189\131\235\176\173\236\157\180 \236\151\137\235\167\157\236\157\180 \235\144\156 \234\177\184 \235\176\156\234\178\172\237\149\152\235\138\148\235\141\176..\
              \n\235\136\132\234\181\176\234\176\128\236\157\152 \237\133\131\236\132\184\236\157\188 \234\177\176\235\157\188 \236\131\157\234\176\129\237\149\156 \236\167\128\236\154\176\235\138\148 \237\149\153\234\181\144\236\151\144\236\132\156 \236\158\144\236\139\160\236\151\144\234\178\140 \236\156\160\235\143\133 \234\185\140\236\185\160\237\150\136\235\141\152 \235\143\153\236\176\172\236\157\132 \236\157\152\236\139\172\237\149\156\235\139\164.\
              \n\236\157\188\235\139\168 \236\160\128 \236\149\158\235\168\184\235\166\172! \235\172\180\236\138\168 \236\131\157\234\176\129 \237\149\152\235\138\148\236\167\128 \236\149\140 \236\136\152 \236\151\134\234\178\140 \237\149\152\235\138\148 \236\160\128 \236\149\158\235\168\184\235\166\172\235\182\128\237\132\176 \234\185\140\234\179\160 \235\167\140\235\139\164!!"))))
          (is_locked false)
          (links
           (((provider mu) (link 184845))
            ((provider raw)
             (link https://www.bomtoon.com/comic/ep_list/spinach_fl))
            ((provider engtl)
             (link https://www.lezhinus.com/en/comic/spinach_bouquet))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 5920b825-4181-4a17-beeb-9918b0ff7a30)
             (attributes
              ((name (((language en) (string "Boys' Love")))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-01-10T22:34:47+00:00)
          (updated_at 2023-07-28T13:04:44+00:00) (version 7)
          (available_translated_languages (fr en))
          (latest_uploaded_chapter 271859e3-80de-41d5-8beb-33fc72836f36)))
        (relationships
         (((id c1f8c851-1184-4f06-8c3b-ffb09c0d2865) (type_ author))
          ((id c1f8c851-1184-4f06-8c3b-ffb09c0d2865) (type_ artist))
          ((id 3a22fb76-9b97-4591-9b5f-843c1d6c315b) (type_ cover_art))
          ((id 6a6f4735-af96-4ee0-a63b-e11b40e5b764) (type_ creator)))))
       ((id b05825a3-9d8e-45bc-a45a-1fe065186b83)
        (attributes
         ((title (((language en) (string "Filter-Goshi no Kanojo"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\149\227\130\163\227\131\171\227\130\191\227\131\188\232\182\138\227\129\151\227\129\174\227\130\171\227\131\142\227\130\184\227\131\167")))
            (((language zh-hk)
              (string
               "\233\154\148\232\145\151\230\191\190\233\143\161\231\154\132\229\165\179\230\156\139\229\143\139")))
            (((language ru)
              (string
               "\208\148\208\181\208\178\209\131\209\136\208\186\208\176 \209\135\208\181\209\128\208\181\208\183 \209\132\208\184\208\187\209\140\209\130\209\128")))
            (((language en) (string "Secret Girl Through the Filter")))))
          (description
           (((language en)
             (string
              "Hakobe Narumi is an expressionless high schooler known as Stoney. The highlight of his unnoticeable existence is following posts from the popular selfie poster \"Efa\" on social media. But it turns out \"Efa\" is his studious and popular classmate Mitsuha Koto?! The slightly erotic, adolescent, selfie, romantic comedy between an Iron Walled Selfie girl and a stone-faced boy begins!"))
            ((language ja)
             (string
              "\227\129\164\227\129\173\227\129\171\231\132\161\232\161\168\230\131\133\227\129\170\232\131\189\233\157\162\233\171\152\230\160\161\231\148\159\227\131\187\231\174\177\233\131\168\230\136\144\230\181\183\227\128\130\227\130\175\227\131\169\227\130\185\227\129\167\227\130\130\229\173\152\229\156\168\230\132\159\230\191\128\227\129\134\227\129\153\227\129\170\229\189\188\227\129\174\228\186\186\231\148\159\227\129\174\230\165\189\227\129\151\227\129\191\227\129\175\227\128\129SNS\227\129\167\228\186\186\230\176\151\227\129\174\227\129\136\227\129\163\227\129\161\227\129\170\232\135\170\230\146\174\227\130\138\229\165\179\229\173\144\227\128\140\227\129\136\227\129\181\227\129\129\227\128\141\227\129\174\230\138\149\231\168\191\227\130\146\232\191\189\227\129\132\227\129\139\227\129\145\227\130\139\227\129\147\227\129\168\227\128\130\227\129\151\227\129\139\227\129\151\227\128\129\227\129\157\227\129\174\227\128\140\227\129\136\227\129\181\227\129\129\227\128\141\227\129\174\230\173\163\228\189\147\227\129\140\227\128\129\231\156\159\233\157\162\231\155\174\227\129\167\232\170\176\227\129\139\227\130\137\227\130\130\229\165\189\227\129\139\227\130\140\227\130\139\227\130\175\227\131\169\227\130\185\227\131\161\227\130\164\227\131\136\227\129\174\228\184\137\232\145\137\231\144\180\227\129\167\227\129\130\227\130\139\227\129\147\227\129\168\227\130\146\231\159\165\227\129\163\227\129\166\227\129\151\227\129\190\227\129\132\227\131\188\227\131\188\226\129\137\239\184\142\233\137\132\229\163\129\232\135\170\230\146\174\227\130\138\229\165\179\229\173\144\226\156\150\239\184\143\232\131\189\233\157\162\231\148\183\229\173\144\227\129\174\227\129\161\227\130\135\227\129\163\227\129\168\227\129\136\227\129\163\227\129\161\227\129\170\233\157\146\230\152\165\232\135\170\230\146\174\227\130\138\227\131\169\227\131\150\227\130\179\227\131\161\233\150\139\229\185\149\226\128\188\239\184\142"))
            ((language ru)
             (string
              "\208\165\208\176\208\186\208\190\208\177\209\141 \208\157\208\176\209\128\209\131\208\188\208\184 \226\128\148 \208\189\208\181\208\178\209\139\209\128\208\176\208\183\208\184\209\130\208\181\208\187\209\140\208\189\209\139\208\185 \209\129\209\130\208\176\209\128\209\136\208\181\208\186\208\187\208\176\209\129\209\129\208\189\208\184\208\186 \208\191\208\190 \208\191\209\128\208\190\208\183\208\178\208\184\209\137\209\131 \194\171\208\154\208\176\208\188\208\181\208\189\208\189\208\190\208\187\208\184\209\134\209\139\208\185\194\187. \208\149\208\179\208\190 \208\189\208\181\208\183\208\176\208\188\208\181\209\130\208\189\208\190\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\208\190\208\178\208\176\208\189\208\184\208\181 \209\129\208\190\209\129\209\130\208\190\208\184\209\130 \208\178 \209\130\208\190\208\188, \209\135\209\130\208\190 \208\190\208\189 \209\129\208\187\208\181\208\180\208\184\209\130 \208\183\208\176 \208\191\208\190\209\129\209\130\208\176\208\188\208\184 \208\191\208\190\208\191\209\131\208\187\209\143\209\128\208\189\208\190\208\179\208\190 \209\141\209\128\208\190\209\130\208\184\209\135\208\181\209\129\208\186\208\190\208\179\208\190 \208\176\208\186\208\186\208\176\209\131\208\189\209\130\208\176 \194\171\208\173\209\132\208\176\194\187 \208\178 \209\129\208\190\209\134\209\129\208\181\209\130\209\143\209\133. \208\157\208\190 \208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143, \209\135\209\130\208\190 \194\171\208\173\209\132\208\176\194\187 \226\128\148 \209\141\209\130\208\190 \208\181\208\179\208\190 \208\190\208\180\208\189\208\190\208\186\208\187\208\176\209\129\209\129\208\189\208\184\209\134\208\176 \208\156\208\184\209\134\209\131\209\133\208\176 \208\154\208\190\209\130\208\190! \208\157\208\176\209\135\208\184\208\189\208\176\208\181\209\130\209\129\209\143 \209\129\208\187\208\181\208\179\208\186\208\176 \209\141\209\128\208\190\209\130\208\184\209\135\208\181\209\129\208\186\208\176\209\143, \208\191\208\190\208\180\209\128\208\190\209\129\209\130\208\186\208\190\208\178\208\176\209\143, \209\129\208\181\208\187\209\132\208\184-\209\128\208\190\208\188\208\176\208\189\209\130\208\184\209\135\208\181\209\129\208\186\208\176\209\143 \208\186\208\190\208\188\208\181\208\180\208\184\209\143 \208\188\208\181\208\182\208\180\209\131 \209\129\208\181\208\187\209\132\208\184-\208\180\208\181\208\178\208\190\209\135\208\186\208\190\208\185 \209\129 \208\182\208\181\208\187\208\181\208\183\208\189\208\190\208\185 \209\129\209\130\208\181\208\189\208\190\208\185 \208\184 \208\191\208\176\209\128\208\189\208\181\208\188 \209\129 \208\186\208\176\208\188\208\181\208\189\208\189\209\139\208\188 \208\187\208\184\209\134\208\190\208\188!"))))
          (is_locked true)
          (links
           (((provider al) (link 148025))
            ((provider ap) (link filter-goshi-no-kanojo))
            ((provider bw) (link series/394223))
            ((provider kt) (link filter-goshi-no-kanojo))
            ((provider mu) (link lt5kus1))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0BTH8CQM8))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2819269))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/739223))
            ((provider mal) (link 156749))
            ((provider raw)
             (link https://comic-zenon.com/episode/316190247077605976))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2022))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-03-10T00:31:11+00:00)
          (updated_at 2024-07-11T15:54:41+00:00) (version 30)
          (available_translated_languages (pt-br en ru es-la id))
          (latest_uploaded_chapter be17cebe-9a03-445f-852b-da2042a225c4)))
        (relationships
         (((id a4e52ff0-c7d4-4e2f-84a1-016904004b07) (type_ author))
          ((id a4e52ff0-c7d4-4e2f-84a1-016904004b07) (type_ artist))
          ((id 03f3e04e-2e7c-45bb-8e80-ea4d008658b9) (type_ cover_art))
          ((id 09e12143-a83e-4ff8-8365-be0e300a4663) (type_ creator)))))
       ((id 3ee3b476-0682-4563-96da-7018ff5e4bf7)
        (attributes
         ((title (((language en) (string "Dragon Tofu"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\137\227\131\169\227\130\180\227\131\179\227\131\187\227\131\136\227\130\166\227\131\149")))))
          (description
           (((language en)
             (string
               "Toshiki and Kazu Fujiwara are brothers who live an ordinary life in an ordinary world working as insurance salesmen. While Toshiki is content with this salaryman life, Kazu strives to be part of a Guild: a registered group of individuals who hunt artifacts and capture criminals. After finishing up a quest, they begin to unravel the truth: that everything is not as normal as it once seemed.  \
              \n  \
              \n[Author\226\128\153s Instagram](https://www.instagram.com/watanabe_ringo/)  \
              \n[Author\226\128\153s Twitter](https://mobile.twitter.com/watanabe_ringo)  \
              \n[Author\226\128\153s Pixiv](https://www.pixiv.net/en/users/59797630)"))))
          (is_locked false)
          (links (((provider raw) (link https://dragontofu.web.fc2.com/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year ())
          (content_rating safe)
          (tags
           (((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 891cf039-b895-47f0-9229-bef4c96eccd4)
             (attributes
              ((name (((language en) (string Self-Published)))) (group format)
               (version 1))))
            ((id b13b2a48-c720-44a9-9c77-39c9979373fb)
             (attributes
              ((name (((language en) (string Doujinshi)))) (group format)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-06-20T17:25:48+00:00)
          (updated_at 2024-03-29T10:58:31+00:00) (version 8)
          (available_translated_languages (ja en))
          (latest_uploaded_chapter d42b0bdb-6089-4f65-9236-09b23a68cbd1)))
        (relationships
         (((id c7785ee5-1b6a-405b-9305-3337eaba12e4) (type_ author))
          ((id c7785ee5-1b6a-405b-9305-3337eaba12e4) (type_ artist))
          ((id 252d6f0a-4d08-448b-939b-5cac8ec1fb97) (type_ cover_art)))))
       ((id e76f4bff-a772-4289-9d85-7bbec939e0d4)
        (attributes
         ((title
           (((language en)
             (string
              "I Became the Contract Daughter of the soon-to-be-ruined Family"))))
          (alt_titles
           ((((language ko)
              (string
               "\234\179\167 \235\167\157\237\149\160 \234\176\128\235\172\184\236\157\152 \234\179\132\236\149\189\236\167\129 \235\148\184\236\157\180 \235\144\152\236\151\136\235\139\164")))))
          (description
           (((language en)
             (string
               "I thought I had regressed from this ragged life, but why has my time-limited life remained the same?\
              \nI'm ruined... is this how I should live my life...?\
              \n\
              \n\"This time, I'll get adopted by a normal family, and live in comfort for the rest of my life!\"\
              \n\
              \nStep by step, I'm going to take revenge against the one behind my death, and I'll protect what's left of my small and precious life!\
              \n\
              \nHowever, did I put in too much effort?\
              \n\
              \n\"Anisha, you're perfect.\"\
              \n\
              \n\"I'm going to make this child a future professor.\"\
              \n\
              \nAll I wanted was to survive...\
              \n\
              \n\"Well, somehow, you\226\128\153ve passed. I'll have to adopt this brat.\"\
              \n\
              \nI ended up with a tycoon I didn't expect.\
              \nOne whose household will be massacred in a few years!\
              \n\
              \nHow do I know that?\
              \nMe too! I didn't want to! Know that!\
              \n\
              \nBut what can I do? The milk has already been spilt.\
              \nI'll just live in bliss while acting as the real daughter during my 5 years contract, then I'll leave!\
              \n\
              \nHowever...\
              \n\
              \n\"...I happened to pick this up on the way home.\"\
              \n\"Father, you're the best!\"\
              \n\"I know.\"\
              \n\
              \n...Something's wrong.\
              \n\
              \n\"I checked this out 'myself', and inspected it 'in person'. There's nothing to be grateful for.\"\
              \n\"Father, you're a genius!\"\
              \n\"I know this too.\"\
              \n\
              \nNo, well, something's REALLY wrong.\
              \n\
              \n**\
              \n\
              \nI became fond of this unique and strange family, but...\
              \n\
              \n\"The five years contract we signed,\"\
              \n\"Let's nullify it.\"\
              \n\
              \nWhile looking straight into my eyes, dad announced the termination.\
              \n\
              \n\"I can help you, but you'll still die anyway.\"\
              \n\
              \nNot only that,\
              \nBut death came under my nose too.\
              \n\
              \nWill I be able to survive?"))))
          (is_locked false)
          (links
           (((provider mu) (link flrqhal)) ((provider mal) (link 170905))
            ((provider raw) (link https://page.kakao.com/content/64071861))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 292e862b-2d17-4062-90a2-0356caa4ae27)
             (attributes
              ((name (((language en) (string "Time Travel")))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-05-03T19:11:11+00:00)
          (updated_at 2024-07-28T16:34:12+00:00) (version 5)
          (available_translated_languages (en pt-br tr))
          (latest_uploaded_chapter f51dd145-bb42-4a71-b6d6-9063f65d4c0c)))
        (relationships
         (((id 05f3cab9-c87c-42eb-99f6-f95f60174676) (type_ author))
          ((id 7cb686db-4040-4ffa-842c-6ab1300babfe) (type_ author))
          ((id 7cb686db-4040-4ffa-842c-6ab1300babfe) (type_ artist))
          ((id 8e3494b3-85c2-410b-957c-f59500788a66) (type_ cover_art))
          ((id 4a9ec36f-2b49-421b-b1cb-9138ad8059a4) (type_ creator)))))
       ((id be9e34d9-d2f5-4538-9132-00f59a7468ae)
        (attributes
         ((title (((language en) (string "Shachiku Jidai no Neet-san"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\164\190\231\149\156\230\153\130\228\187\163\227\129\174\227\131\139\227\131\188\227\131\136\227\129\149\227\130\147")))))
          (description ()) (is_locked false)
          (links
           (((provider raw)
             (link https://twitter.com/zurikishi/status/1579837851545767942))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status completed) (year (2022))
          (content_rating safe)
          (tags
           (((id 92d6d951-ca5e-429c-ac78-451071cbf064)
             (attributes
              ((name (((language en) (string "Office Workers")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-09-18T21:53:13+00:00)
          (updated_at 2023-10-20T11:08:22+00:00) (version 2)
          (available_translated_languages (en pt-br))
          (latest_uploaded_chapter d08ecb80-76f1-4a79-8e17-2dfbe3f1fbfa)))
        (relationships
         (((id 87ffb9a0-fb94-43af-9ecf-dab61c8fbce3) (type_ author))
          ((id 87ffb9a0-fb94-43af-9ecf-dab61c8fbce3) (type_ artist))
          ((id 6e586ace-343f-4cb3-9c41-7faf33452d4c) (type_ cover_art))
          ((id 02c385d5-beac-4ee4-9383-20b55d7d8a50) (type_ creator)))))
       ((id 5dc30682-a224-4f47-b695-f4fab7e26b68)
        (attributes
         ((title
           (((language en) (string "Dorei wo Choukyoushite Harem Tsukuru"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\165\180\233\154\183\227\130\146\232\170\191\230\149\153\227\129\151\227\129\166\227\131\143\227\131\188\227\131\172\227\131\160\228\189\156\227\130\139")))
            (((language ja-ro) (string "Dorei wo Choukyoushite Harem Tsukuru")))
            (((language ru)
              (string
               "\208\162\209\128\208\181\208\189\208\184\209\128\209\131\208\181\208\188 \209\128\208\176\208\177\209\139\208\189\209\140, \209\135\209\130\208\190\208\177\209\139 \209\129\208\180\208\181\208\187\208\176\209\130\209\140 \208\179\208\176\209\128\208\181\208\188")))
            (((language zh)
              (string
               "\229\133\187\229\165\179\229\132\191\229\188\128\229\144\142\229\174\171")))
            (((language zh-hk)
              (string
               "\232\170\191\230\149\153\229\165\180\233\154\184\229\187\186\229\190\140\229\174\174")))
            (((language pt-br) (string "Treinando escravas pra fazer um harem")))
            (((language en) (string "Training Slaves to Make a Harem")))
            (((language es-la)
              (string "Entrenando Esclavas Para Hacer Un Harem")))))
          (description
           (((language en)
             (string
              "A man purchases three little slaves and begins to groom them into perfect girls for his harem. You will never have a gaggle of lolis with horns in your life. ;_;"))
            ((language vi)
             (string
              "\196\144\195\162y l\195\160 c\195\162u chuy\225\187\135n v\225\187\129 g\195\163 ch\225\187\167 nh\195\162n mua n\195\180 l\225\187\135, ch\196\131m s\195\179c gi\195\161o d\225\187\165c c\195\161c b\195\169 l\195\170n ng\198\176\225\187\157i \196\145\225\187\131 hi\225\187\135n th\225\187\177c ho\195\161 gi\225\186\165c m\198\161 d\195\160n harem l\195\189 t\198\176\225\187\159ng"))
            ((language es-la)
             (string
              "Un hombre compra 3 esclavas Lolis para as\195\173 poder criarlas y convertirlas en mujeres de su agrado para que posteriormente cuando crezcan completamente de acuerdo a sus gustos pueda hacerles el sin respeto a gusto las veces que quiera"))
            ((language pt-br)
             (string
              "Um homem compra tr\195\170s pequenas escravas e come\195\167a a transform\195\161-las em garotas perfeitas para seu har\195\169m."))))
          (is_locked false)
          (links
           (((provider al) (link 149329)) ((provider bw) (link series/442403))
            ((provider kt) (link dorei-wo-choukyoushite-harem-tsukuru))
            ((provider mu) (link buo9hov))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0CLKWY3D5))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/791050/))
            ((provider mal) (link 150788))
            ((provider raw)
             (link https://www.pixiv.net/user/578571/series/155360))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2022))
          (content_rating suggestive)
          (tags
           (((id 2d1f5d56-a1e5-4d0d-a961-2193588b08ec)
             (attributes
              ((name (((language en) (string Loli)))) (group theme) (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b13b2a48-c720-44a9-9c77-39c9979373fb)
             (attributes
              ((name (((language en) (string Doujinshi)))) (group format)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-05-14T15:51:09+00:00)
          (updated_at 2024-07-19T08:35:54+00:00) (version 42)
          (available_translated_languages (vi fr ru id pl en pt-br uk es-la))
          (latest_uploaded_chapter 682fd5fe-af5a-40bf-a047-49fb8d4d0a3a)))
        (relationships
         (((id 66895a0b-5a77-4e00-bcb6-d0be5b991a10) (type_ author))
          ((id 66895a0b-5a77-4e00-bcb6-d0be5b991a10) (type_ artist))
          ((id bc8d9cd6-6ebd-4931-8a6e-0c77381b38f7) (type_ cover_art))
          ((id 052dd36f-eeb8-4439-85cf-c0da83dec8a7) (type_ manga))
          ((id 066c2c55-73a9-485f-b888-255e862c76fe) (type_ manga))
          ((id 066c2c55-73a9-485f-b888-255e862c76fe) (type_ manga))
          ((id 1f9bce21-500d-4de6-ae4f-80ddad8fa12b) (type_ manga))
          ((id 330aa63d-36cf-41c3-9afc-04f964f58414) (type_ manga))
          ((id 33b10129-a363-4084-84ff-1dcf9f806066) (type_ manga))
          ((id 3f7a98eb-568c-4685-8215-d057e0966bc9) (type_ manga))
          ((id 562524f1-1ecb-4aca-b04c-6e0eb43625a0) (type_ manga))
          ((id 562524f1-1ecb-4aca-b04c-6e0eb43625a0) (type_ manga))
          ((id 74c29b17-8fd2-414b-a830-a6f397c369e2) (type_ manga))
          ((id c6acecc4-14ed-41f2-834c-ac4fd18e1f94) (type_ manga))
          ((id c6acecc4-14ed-41f2-834c-ac4fd18e1f94) (type_ manga))
          ((id f26625c8-8eb3-4a41-8fc9-ba4fc0a677d9) (type_ manga))
          ((id f732fec6-1906-48a3-81e9-01bced7d6718) (type_ manga))
          ((id f93177d9-779f-4180-baac-32a9d0a88433) (type_ manga))
          ((id f93177d9-779f-4180-baac-32a9d0a88433) (type_ manga))
          ((id f25a2435-7dc9-4766-aa89-86b5643356be) (type_ creator)))))
       ((id cb77e4a6-3921-43b9-9d64-7d78cd3205ce)
        (attributes
         ((title (((language en) (string Jigokuraku))))
          (alt_titles
           ((((language en) (string "Hell's Paradise")))
            (((language ja-ro) (string "Jigoku Raku")))
            (((language ja-ro) (string Jigoku-Raku)))
            (((language it) (string "Paradiso infernale")))
            (((language fr) (string Paradition)))
            (((language ru)
              (string
               "\208\144\208\180\209\129\208\186\208\184\208\185 \209\128\208\176\208\185")))
            (((language zh) (string "\229\156\176\231\139\177\228\185\144")))
            (((language ja) (string "\229\156\176\231\141\132\230\165\189")))
            (((language zh-hk) (string "\229\156\176\231\141\132\230\168\130")))
            (((language fa)
              (string
               "\217\135\217\132\216\178 \217\190\216\167\216\177\216\175\216\167\219\140\216\179")))
            (((language ja)
              (string
               "\227\130\184\227\131\163\227\131\179\227\131\151\227\130\179\227\131\159\227\131\131\227\130\175\227\130\185")))
            (((language pl) (string "Piekielny raj")))
            (((language th)
              (string
               "\224\184\170\224\184\184\224\184\130\224\184\178\224\184\167\224\184\148\224\184\181\224\184\173\224\185\128\224\184\167\224\184\136\224\184\181")))
            (((language cs) (string "Pekeln\195\189 r\195\161j")))))
          (description
           (((language en)
             (string
               "Gabimaru the Empty, a former ninja assassin feared as a heartless husk of a man, spends his days on death row wondering when an executioner skilled enough to so much as harm him will arrive, as he thinks nothing of seeing an end to his meaningless existence\226\128\166 Or so he thought. \
              \nThen the lady executioner, Asaemon the Beheader, rekindles his hope with an astounding proposition. \
              \nIf he ever wishes to see his beloved wife again, he must embark under the auspices of the shogunate on a perilous voyage to the mysterious mystic island said to house the elixir of immortality. \
              \nShould he be the one among many rival death-row fiends and scoundrels to find the elixir, he'll earn a full exoneration, and, more importantly, a chance at an ordinary married life with the light of his life: the woman who made the world seem not so ugly. \
              \nWhat awaits them is a journey like no other!"))
            ((language ru)
             (string
              "\208\173\209\130\208\190 \209\129\208\187\209\131\209\135\208\184\208\187\208\190\209\129\209\140 \208\178\208\190 \208\178\209\128\208\181\208\188\208\181\208\189\208\176 \208\191\209\128\208\176\208\178\208\187\208\181\208\189\208\184\209\143 \208\190\208\180\208\184\208\189\208\189\208\176\208\180\209\134\208\176\209\130\208\190\208\179\208\190 \209\129\209\145\208\179\209\131\208\189\208\176 \208\184\208\183 \208\180\208\184\208\189\208\176\209\129\209\130\208\184\208\184 \208\162\208\190\208\186\209\131\208\179\208\176\208\178\208\176\226\128\166 \208\147\208\176\208\177\208\184\208\188\208\176\209\128\209\131, \208\189\208\181\208\186\208\190\208\179\208\180\208\176 \209\129\208\184\208\187\209\140\208\189\208\181\208\185\209\136\208\184\208\185 \209\129\208\184\208\189\208\190\208\177\208\184, \209\129\208\190\208\177\208\184\209\128\208\176\208\178\209\136\208\184\208\185\209\129\209\143 \208\191\208\190\208\186\208\184\208\189\209\131\209\130\209\140 \209\129\208\178\208\190\209\142 \208\180\208\181\209\128\208\181\208\178\208\189\209\142, \208\183\208\176\209\133\208\178\208\176\209\135\208\181\208\189 \208\178 \208\191\208\187\208\181\208\189. \208\157\208\190 \208\175\208\188\208\176\208\180\208\176 \208\144\209\129\208\176\209\141\208\188\208\190\208\189, \208\180\208\181\208\178\209\131\209\136\208\186\208\176-\208\191\208\176\208\187\208\176\209\135, \208\191\209\128\208\181\208\180\208\187\208\190\208\182\208\184\208\187\208\176 \208\181\208\188\209\131 \208\191\209\128\208\190\209\137\208\181\208\189\208\184\208\181 \208\184 \209\129\208\178\208\190\208\177\208\190\208\180\209\131 \209\129 \208\190\208\180\208\189\208\184\208\188 \209\131\209\129\208\187\208\190\208\178\208\184\208\181\208\188\226\128\166 \208\158\208\189 \208\180\208\190\208\187\208\182\208\181\208\189 \208\183\208\176\208\191\208\190\208\187\209\131\209\135\208\184\209\130\209\140 \208\178 \209\128\208\176\208\185\209\129\208\186\208\184\209\133 \208\183\208\181\208\188\208\187\209\143\209\133 \209\141\208\187\208\184\208\186\209\129\208\184\209\128 \208\177\208\181\209\129\209\129\208\188\208\181\209\128\209\130\208\184\209\143!.. \208\160\208\190\208\188\208\176\208\189\209\130\208\184\209\135\208\181\209\129\208\186\208\184\208\181 \208\191\209\128\208\184\208\186\208\187\209\142\209\135\208\181\208\189\208\184\209\143 \208\184 \208\184\209\129\208\186\209\131\209\129\209\129\209\130\208\178\208\190 \208\189\208\184\208\189\208\180\208\183\209\142\209\134\209\131 \208\190\209\130 \208\154\208\176\208\186\209\131 \208\174\208\180\208\183\208\184."))
            ((language pt-br)
             (string
              "Gabimaru, o Vazio, \195\169 um dos ninjas assassinos mais cru\195\169is que j\195\161 saiu da vila de Iwagakure. Ele \195\169 implacavelmente eficiente, mas uma trai\195\167\195\163o resulta em uma senten\195\167a de morte. S\195\179 h\195\161 uma esperan\195\167a para ter sua liberdade: viajar para uma ilha escondida e conseguir um elixir, que tornar\195\161 o shogun imortal. O fracasso n\195\163o \195\169 uma op\195\167\195\163o, nesta ilha, o C\195\169u e o Inferno est\195\163o a um metro de dist\195\162ncia."))))
          (is_locked false)
          (links
           (((provider al) (link 100994))
            ((provider ap) (link hells-paradise-jigokuraku))
            ((provider bw) (link series/151407)) ((provider kt) (link 40546))
            ((provider mu) (link 146739))
            ((provider amz) (link https://www.amazon.co.jp/dp/B07H6QR25X))
            ((provider cdj)
             (link http://www.cdjapan.co.jp/product/NEOBK-2204553))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/451004/))
            ((provider mal) (link 112318))
            ((provider raw)
             (link https://shonenjumpplus.com/episode/13932016480029295972))
            ((provider engtl)
             (link https://mangaplus.shueisha.co.jp/titles/100040))))
          (original_language ja) (last_volume (13)) (last_chapter (127))
          (publication_demographic (shounen)) (status completed) (year (2018))
          (content_rating safe)
          (tags
           (((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-03-12T21:24:49+00:00)
          (updated_at 2024-05-01T03:47:44+00:00) (version 25)
          (available_translated_languages
           (fr zh-hk it es-la es ru vi fa tr uk de cs pt-br th en))
          (latest_uploaded_chapter d62852df-7ece-41f5-b229-62cfea4f994a)))
        (relationships
         (((id 801b900b-c364-450a-923a-76aba1bf010f) (type_ author))
          ((id 801b900b-c364-450a-923a-76aba1bf010f) (type_ artist))
          ((id 310eea75-9452-4fa5-93b5-881d4e3fecc1) (type_ cover_art))
          ((id 140cadf4-ce3a-41e7-ba5d-58ee4b8fbdc1) (type_ manga))
          ((id 6b76a5e8-78f0-4477-a279-cf0f4bc017f6) (type_ manga)))))
       ((id 80d1414d-06cc-4cc6-b67c-0732c5f6a119)
        (attributes
         ((title
           (((language en)
             (string "My Harem Grew So Large, I Was Forced to Ascend"))))
          (alt_titles
           ((((language zh)
              (string
               "H\195\178ug\197\141ng t\195\160i du\197\141, zh\199\144h\199\142o f\196\147ish\196\147ngle")))
            (((language en) (string "This Harem Is Too Much, I Have To Ascend!")))
            (((language ru)
              (string
               "\208\156\208\190\208\185 \208\179\208\176\209\128\208\181\208\188 \209\130\208\176\208\186 \208\178\208\181\208\187\208\184\208\186, \209\135\209\130\208\190 \208\191\209\128\208\184\209\136\208\187\208\190\209\129\209\140 \208\190\209\130\208\191\209\128\208\176\208\178\208\184\209\130\209\140\209\129\209\143 \208\189\208\176 \208\189\208\181\208\177\208\181\209\129\208\176")))
            (((language zh)
              (string
               "\229\144\142\229\174\171\229\164\170\229\164\154\239\188\140\229\143\170\229\165\189\233\163\158\229\141\135\228\186\134")))))
          (description
           (((language en)
             (string
               "Tsundere heavenly master, big-breasted sister, barefoot poison cultivator, immortal swordswoman with white silk clothes, the last 5 out of the 6 strongest people in the world. I, Ye Gulou have become the first person to cultivate immortality through pure unbounded Yang. But wait, cultivating pure unbounded Yang means I can't form relationships with women or else I'll die?! Then what can I do about this harem of mine that's grown so large over the years? They're all chasing me down, coercing me to choose between them (otherwise they'll kill Me). They've forced me to ascend to the Heavens, to immortality right now to escape from their wrath. Oh shit, they followed me to the new world?!! Let's see what awaits us as my harems from both worlds combine!  \
              \nAuthor\226\128\153s Twitter-<https://mobile.twitter.com/bearmaker5>"))
            ((language ru)
             (string
               "\208\157\208\181\208\177\208\181\209\129\208\189\208\176\209\143 \208\189\208\176\209\129\209\130\208\176\208\178\208\189\208\184\209\134\208\176-\209\134\209\131\208\189\208\180\208\181\209\128\208\181,, \208\177\208\190\208\187\209\140\209\136\208\181\208\179\209\128\209\131\208\180\208\176\209\143 \209\129\208\181\209\129\209\130\209\128\208\181\208\189\208\186\208\176-\208\189\208\176\209\129\209\130\208\176\208\178\208\189\208\184\209\134\208\176, \208\177\208\190\209\129\208\190\208\189\208\190\208\179\208\176\209\143 \208\190\209\130\209\128\208\176\208\178\208\184\209\130\208\181\208\187\209\140\208\189\208\184\209\134\208\176, \209\132\208\181\209\133\209\130\208\190\208\178\208\176\208\187\209\140\209\137\208\184\209\134\208\176 \208\178 \208\177\208\181\208\187\209\139\209\133 \209\135\209\131\208\187\208\186\208\176\209\133\226\128\166 \208\175, \208\149 \208\147\209\131\208\187\208\190\209\131 \226\128\147 \209\129\208\176\208\188\209\139\208\185 \209\142\208\189\209\139\208\185 \208\184 \209\129\208\176\208\188\209\139\208\185 \208\190\208\180\208\176\209\128\208\181\208\189\208\189\209\139\208\185 \208\186\209\131\208\187\209\140\209\130\208\184\208\178\208\176\209\130\208\190\209\128 \208\189\208\176 \208\188\208\176\209\130\208\181\209\128\208\184\208\186\208\181 \208\174\208\189\209\140\208\187\208\176\208\185, \208\189\208\190, \208\190\208\177\209\137\208\184\208\188\208\184 \209\131\209\129\208\184\208\187\208\184\209\143\208\188\208\184, \208\188\208\190\208\185 \208\179\208\176\209\128\208\181\208\188 \208\184\208\183 \208\189\208\181\209\129\209\128\208\176\208\178\208\189\208\181\208\189\208\189\209\139\209\133 \208\186\209\128\208\176\209\129\208\176\208\178\208\184\209\134 \208\178\208\190\209\130-\208\178\208\190\209\130 \209\129\208\178\208\181\208\180\208\181\209\130 \208\188\208\181\208\189\209\143 \208\178 \208\188\208\190\208\179\208\184\208\187\209\131!  \
              \n  \
              \n\208\148\208\190\208\178\208\190\208\187\209\140\208\189\208\190! \208\159\209\128\208\184\209\136\208\187\208\190 \208\178\209\128\208\181\208\188\209\143 \208\178\208\190\208\183\208\189\208\181\209\129\209\130\208\184\209\129\209\140 \208\189\208\176 \208\189\208\181\208\177\208\181\209\129\208\176! \208\163\208\178\209\139, \208\178\208\188\208\181\209\129\209\130\208\181 \209\129\208\190 \208\188\208\189\208\190\208\185 \208\178 \208\180\209\128\209\131\208\179\208\190\208\185 \208\188\208\184\209\128 \208\190\209\130\208\191\209\128\208\176\208\178\208\184\208\187\208\184\209\129\209\140 \208\184 \208\190\208\189\208\184. \208\144 \208\189\208\176\209\131\209\130\209\128\208\190 \208\179\208\176\209\128\208\181\208\188 \208\189\208\176 \209\128\209\131\208\177\208\181\208\182\208\181 \208\180\208\178\209\131\209\133 \208\188\208\184\209\128\208\190\208\178 \208\178\208\189\208\190\208\178\209\140 \208\191\209\128\208\181\208\180\209\129\209\130\208\176\208\187 \208\191\208\181\209\128\208\181\208\180 \208\188\208\190\208\184\208\188\208\184 \208\179\208\187\208\176\208\183\208\176\208\188\208\184: \209\141\208\187\209\140\209\132\208\184\208\185\208\186\208\176, \208\183\208\178\208\181\209\128\208\190\208\180\208\181\208\178\209\131\209\136\208\186\208\176, \208\180\208\181\208\178\209\131\209\136\208\186\208\176-\209\128\209\139\209\134\208\176\209\128\209\140 \208\184 \208\191\208\181\209\128\208\178\208\190\209\129\208\178\209\143\209\137\208\181\208\189\208\189\208\184\209\134\208\176. \208\162\208\181\208\191\208\181\209\128\209\140 \208\189\208\181\208\187\209\140\208\183\209\143 \208\191\208\190\209\128\209\131\209\135\208\184\209\130\209\140\209\129\209\143, \209\135\209\130\208\190 \209\130\208\181\208\187\208\190 \208\191\208\190\208\180\209\128\208\190\209\129\209\130\208\186\208\176, \208\178 \208\186\208\190\209\130\208\190\209\128\208\190\208\188 \208\189\208\176\209\133\208\190\208\180\208\184\209\130\209\129\209\143 \208\188\208\190\209\143 \208\180\208\181\208\178\209\143\209\130\208\184\209\129\208\190\209\130\208\187\208\181\209\130\208\189\209\143\209\143 \209\129\209\131\209\137\208\189\208\190\209\129\209\130\209\140 \208\178 \208\190\208\180\208\189\208\190 \208\191\209\128\208\181\208\186\209\128\208\176\209\129\208\189\208\190\208\181 \209\131\209\130\209\128\208\190 \208\189\208\181 \208\187\208\184\209\136\208\184\209\130\209\129\209\143 \209\129\208\178\208\190\208\181\208\179\208\190 \209\134\208\181\208\187\208\190\208\188\209\131\208\180\209\128\208\184\209\143.  \
              \n  \
              \n\208\152, \208\191\208\190\209\133\208\190\208\182\208\181, \208\188\208\190\208\185 \208\179\208\176\209\128\208\181\208\188 \208\178 \208\189\208\190\208\178\208\190\208\188 \208\188\208\184\209\128\208\181 \208\177\209\131\208\180\208\181\209\130 \208\187\208\184\209\136\209\140 \208\189\208\181\208\191\209\128\208\181\209\128\209\139\208\178\208\189\208\190 \209\128\208\176\209\129\209\130\208\184\226\128\166"))))
          (is_locked false)
          (links
           (((provider ap) (link my-harem-grew-so-large-i-was-forced-to-ascend))
            ((provider mu) (link 174388))
            ((provider raw) (link https://manga.bilibili.com/detail/mc28932))))
          (original_language zh) (last_volume ("")) (last_chapter (78))
          (publication_demographic ()) (status completed) (year (2020))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id acc803a4-c95a-4c22-86fc-eb6b582d82a2)
             (attributes
              ((name (((language en) (string Wuxia)))) (group genre) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-12-01T23:44:54+00:00)
          (updated_at 2024-06-14T00:34:03+00:00) (version 8)
          (available_translated_languages (pt-br fr ru en th pl))
          (latest_uploaded_chapter e536183f-116f-4bbf-af16-8480d546fead)))
        (relationships
         (((id c4dcdbb2-9ce3-492e-9870-4b79407a28c5) (type_ author))
          ((id c4dcdbb2-9ce3-492e-9870-4b79407a28c5) (type_ artist))
          ((id 3767aa6b-e9c5-4ded-a18b-731dac37b452) (type_ cover_art)))))
       ((id 3fc308c9-4b00-4dc3-943e-1f39242bc708)
        (attributes
         ((title (((language en) (string Overgeared))))
          (alt_titles
           ((((language ko) (string "\237\133\156\235\185\168")))
            (((language ru)
              (string
               "\208\146\208\190 \208\178\209\129\208\181\208\190\209\128\209\131\208\182\208\184\208\184 (\208\191\208\181\209\128\208\181\208\183\208\176\208\191\209\131\209\129\208\186)")))
            (((language fa)
              (string
               "\216\170\216\167 \216\175\217\134\216\175\216\167\217\134 \217\133\216\179\217\132\216\173")))
            (((language en) (string "Overgeared (Team Argo)")))
            (((language ja)
              (string
               "\227\131\134\227\131\160\227\131\145\227\131\171\227\128\156\227\130\162\227\130\164\227\131\134\227\131\160\227\129\174\229\138\155\227\128\156")))
            (((language id) (string "Kekuatan Item")))
            (((language zh-hk) (string "\232\163\157\229\130\153\228\187\148")))
            (((language zh)
              (string
               "\232\163\133\229\164\135\230\136\145\230\156\128\229\188\186")))))
          (description
           (((language de)
             (string
               "Shin Youngwoo spielt mit seinem Avatar \"Grid\" das zurzeit beliebteste Virtual-Reality-Spiel der Welt: Satisfy.  \
              \n  \
              \nOb in der Realit\195\164t oder in-game, Shin scheint vom Ungl\195\188ck verfolgt zu werden. Doch als er nach der Suche nach einem Questgegenstand seine Belohnung erh\195\164lt, kann er zu einer legend\195\164ren Klasse wechseln. Einer Klasse, die au\195\159er ihm niemand der \195\188ber 2 Milliarden Spielern besitzt."))
            ((language en)
             (string
               "Shin Youngwoo (aka Grid), an unlucky man in life and a low-level player in the popular VR game Satisfy, finds a powerful item that earns him a rare legendary class title: Pagma\226\128\153s Successor. Now a skilled blacksmith, he can forge unique weapons and equip the game\226\128\153s most powerful gear!\
              \n\
              \nGrid resolves to use his new abilities to achieve fame and fortune, but as his very existence begins to stir up trouble in Satisfy, he realizes that life as a legend may be more than he bargained for\226\128\166."))
            ((language fa)
             (string
               "\226\129\167\226\129\167\216\168\216\178\216\177\218\175\226\128\140\216\170\216\177\219\140\217\134 \216\168\216\167\216\178\219\140 \217\136\216\167\217\130\216\185\219\140\216\170 \217\133\216\172\216\167\216\178\219\140 \216\172\217\135\216\167\217\134 \194\171\216\179\216\170\219\140\216\179\217\129\216\167\219\140\194\187.  \
              \n\226\129\167\218\134\217\135 \216\170\217\136 \217\136\216\167\217\130\216\185\219\140\216\170 \217\136 \218\134\217\135 \216\175\216\177 \216\175\217\134\219\140\216\167\219\140 \217\133\216\172\216\167\216\178\219\140 \216\180\219\140\217\134\218\175 \217\136\217\136 \218\169\216\179\219\140 \216\168\217\136\216\175 \218\169\217\135 \217\135\217\133\217\135\226\128\140\219\140 \216\168\216\175\216\168\216\174\216\170\219\140\226\128\140\217\135\216\167 \216\179\216\177\216\180 \217\133\219\140\226\128\140\216\167\217\136\217\133\216\175.  \
              \n\226\129\167\216\167\217\133\216\167 \216\170\217\136 \217\133\219\140\217\136\217\134 \216\167\219\140\217\134\226\128\140\217\135\217\133\217\135 \216\168\216\175\216\168\216\174\216\170\219\140\226\128\140\216\140 \219\140\217\135\226\128\140\216\168\216\167\216\177 \216\180\216\167\217\134\216\179 \216\168\217\135\216\180 \216\177\217\136 \217\133\219\140\226\128\140\218\169\217\134\217\135 \217\136 \216\170\217\136 \219\140\217\135 \217\133\216\163\217\133\217\136\216\177\219\140\216\170 \216\186\219\140\216\177\217\133\217\133\218\169\217\134 \218\169\216\170\216\167\216\168 \217\190\216\167\218\175\217\133\216\167 \216\177\217\136 \217\190\219\140\216\175\216\167 \217\133\219\140\226\128\140\218\169\217\134\217\135\216\140 \218\169\216\170\216\167\216\168\219\140 \216\167\217\129\216\179\216\167\217\134\217\135\226\128\140\216\167\219\140 \218\169\217\135 \216\178\217\134\216\175\218\175\219\140 \216\167\217\136\217\134 \216\177\217\136 \216\167\216\178 \216\167\219\140\217\134 \216\177\217\136 \216\168\217\135 \216\167\217\136\217\134 \216\177\217\136 \217\133\219\140\226\128\140\218\169\217\134\217\135."))
            ((language fr)
             (string
               "Quand un joueur rat\195\169 de VMMORPG tombe, lors d\226\128\153une qu\195\170te, sur un livre l\195\169gendaire permettant de changer de classe, il en profite imm\195\169diatement. Attention joueurs, le plus grand de tous les forgerons est n\195\169 ! Et il n\226\128\152a pas pr\195\169vu de passer inaper\195\167u !\
              \n\
              \n---\
              \n- [Official French Translation](https://www.delitoon.com/webtoon/overgeared)"))
            ((language id)
             (string
               "Shin Youngwoo punya kehidupan yang bernasib sial. Ia terpaksa bekerja kasar di sebuah tempat kontruksi untuk membayar biaya sekolah dan uang game yang ia gunakan. Bahkan ia juga kerja kasar di VR Game yang bernama Satisfy. Namun, hidupnya mulai berubah ketika karakternya sebagai 'Grid' di game menemukan 'Pagma's Rare Book' hingga menjadi legendary class player.\
              \n\
              \n---\
              \n- [Official Indonesian Translation](https://kakaopage.co.id/content/Kekuatan-Item/3406)"))
            ((language ja)
             (string
               "\228\184\150\231\149\140\230\156\128\233\171\152\227\129\174\227\131\144\227\131\188\227\131\129\227\131\163\227\131\171\227\131\170\227\130\162\227\131\170\227\131\134\227\130\163\227\130\178\227\131\188\227\131\160<SATISFY>\227\128\130 \229\133\168\228\184\150\231\149\140\227\131\166\227\131\188\227\130\182\227\131\188\230\149\176\239\188\146\239\188\144\229\132\132\228\186\186\227\128\129\227\130\130\227\129\134\228\184\128\227\129\164\227\129\174\229\156\176\231\144\131\227\129\168\229\145\188\227\129\176\227\130\140\227\130\139\227\129\187\227\129\169\227\129\174\229\163\174\229\164\167\227\129\170\227\131\149\227\130\161\227\131\179\227\130\191\227\130\184\227\131\188\227\130\178\227\131\188\227\131\160\227\128\130 \227\129\151\227\129\140\227\129\170\227\129\132\231\132\161\232\129\183\227\129\174\227\130\178\227\131\188\227\131\160\228\184\173\230\175\146\232\128\133\227\129\167\227\129\130\227\130\139\227\128\140\233\149\183\229\182\186\229\183\167\227\128\141\227\129\175\227\130\178\227\131\188\227\131\160\232\170\178\233\135\145\227\129\174\229\128\159\233\135\145\227\130\146\232\191\148\227\129\153\227\129\159\227\130\129\227\129\171\230\151\165\233\155\135\227\129\132\229\138\180\229\131\141\227\130\146\227\129\153\227\130\139\228\187\165\229\164\150\227\129\174\227\129\187\227\129\168\227\130\147\227\129\169\227\129\174\230\153\130\233\150\147\227\129\175\227\130\178\227\131\188\227\131\160\227\129\171\232\178\187\227\130\132\227\129\151\227\129\166\227\129\132\227\129\159\227\128\130 \227\129\130\227\130\139\230\151\165\227\128\129\227\130\175\227\130\168\227\130\185\227\131\136\228\184\173\227\129\171\227\131\172\227\130\184\227\130\167\227\131\179\227\131\128\227\131\170\227\131\188\232\187\162\232\129\183\230\155\184\239\188\156\227\131\149\227\130\161\227\130\176\227\131\158\227\129\174\229\165\135\230\155\184\239\188\158\227\130\146\230\137\139\227\129\171\229\133\165\227\130\140\227\129\159\227\128\140\229\183\167\227\128\141\227\128\130 \239\188\156\227\131\149\227\130\161\227\130\176\227\131\158\227\129\174\229\165\135\230\155\184\239\188\158\229\163\178\227\129\163\227\129\166\229\164\167\229\132\178\227\129\145\227\129\167\227\129\141\227\130\139\227\129\168\230\128\157\227\129\163\227\129\159\227\129\157\227\129\174\231\158\172\233\150\147\226\128\166\239\188\129\230\150\176\227\129\159\227\129\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\229\139\149\227\129\149\227\130\140\230\174\186\227\129\149\227\130\140\227\130\139\229\175\184\229\137\141\227\129\171\227\129\170\227\130\139\227\129\140\226\128\166 \227\129\147\227\129\174\227\129\190\227\129\190\227\129\160\227\129\168\230\174\186\227\129\149\227\130\140\227\128\129\227\131\172\227\130\184\227\130\167\227\131\179\227\131\128\227\131\170\227\131\188\232\187\162\232\129\183\230\155\184\239\188\156\227\131\149\227\130\161\227\130\176\227\131\158\227\129\174\229\165\135\230\155\184\239\188\158\227\130\130\227\129\170\227\129\143\227\129\151\227\129\166\227\129\151\227\129\190\227\129\134\227\129\168\230\128\157\227\129\163\227\129\159\227\128\140\229\183\167\227\128\141\227\129\175\239\188\156\227\131\149\227\130\161\227\130\176\227\131\158\227\129\174\229\165\135\230\155\184\239\188\158\227\130\146\233\150\139\227\129\141\227\128\129\228\188\157\232\170\172\227\129\174\232\129\183\228\186\186\239\188\156\227\131\149\227\130\161\227\130\176\227\131\158\227\129\174\230\156\171\232\163\148\239\188\158\227\129\184\227\129\168\227\130\184\227\131\167\227\131\150\227\131\129\227\130\167\227\131\179\227\130\184\227\129\153\227\130\139\227\129\140\226\128\166 \229\128\159\233\135\145\227\129\190\227\129\191\227\130\140\227\129\174\229\186\149\232\190\186\228\186\186\231\148\159\227\129\139\227\130\137\239\188\146\239\188\144\229\132\132\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\174\233\160\130\231\130\185\227\129\171\231\171\139\227\129\164\227\131\172\227\130\184\227\130\167\227\131\179\227\131\128\227\131\170\227\131\188\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\129\170\227\130\140\227\130\139\227\129\174\227\129\139\239\188\129\239\188\159\
              \n\
              \n---\
              \n- [Official Japanese Translation](https://piccoma.com/web/product/43170)"))
            ((language ko)
             (string
               "[\236\139\160\236\152\129\236\154\176 (\236\156\160\236\160\128 \235\132\164\236\158\132: \234\183\184\235\166\172\235\147\156)]\
              \n\236\132\184\234\179\132 \236\181\156\234\179\160\236\157\152 \234\176\128\236\131\129 \237\152\132\236\139\164 \234\178\140\236\158\132 <SATISFY>.\
              \n\
              \n\237\152\132\236\139\164\236\151\144\236\132\156\235\130\152, \234\178\140\236\158\132 \236\134\141\236\151\144\236\132\156\235\130\152, \235\182\136\236\154\180\236\157\128 \237\149\173\236\131\129 \234\183\184\236\157\152 \234\179\129\236\157\132 \235\167\180\235\143\132\235\138\148\235\141\176....\
              \n\237\128\152\236\138\164\237\138\184 \236\136\152\237\150\137 \236\164\145 \236\154\176\236\151\176\237\158\136 \235\176\156\234\178\172\237\149\156 \234\178\140\236\158\132 \236\134\141 \235\161\156\235\152\144, '\237\140\140\234\183\184\235\167\136\236\157\152 \234\184\176\236\132\156'. \
              \n20\236\150\181 \235\170\133\236\157\180 \235\132\152\235\138\148 \236\156\160\236\160\128 \236\164\145 \236\156\160\236\157\188\237\149\156 \236\181\156\234\176\149\236\157\152 \235\160\136\236\160\132\235\147\156\235\166\172 \236\167\129\236\151\133\236\156\188\235\161\156 \236\160\132\236\167\129.\
              \n\
              \n\"\236\150\180\235\150\187\234\178\140 \236\149\132\236\167\129 \236\130\180\236\149\132\236\158\136\235\138\148 \234\177\176\236\167\128...?!\"\
              \n\
              \n\"\235\173\144, \237\138\185\235\179\132\237\149\156 \234\177\180 \236\151\134\234\179\160...\"\
              \n\
              \n\
              \n\"\237\133\156\235\185\168\236\157\180\236\163\160.\"\
              \n\
              \n\236\167\128\234\184\139\236\167\128\234\184\139\237\149\156 \235\182\136\236\154\180\234\179\188 \236\149\133\235\170\189 \234\176\153\236\157\128 \235\185\154\236\159\129\236\157\180 \236\157\184\236\131\157\236\151\144\236\132\156 \235\178\151\236\150\180\235\130\156\
              \n\236\181\156\234\176\149 \237\148\140\235\160\136\236\157\180\236\150\180 \"\234\183\184\235\166\172\235\147\156\".\
              \n\234\179\160\236\157\184\235\172\188\235\143\132 \236\154\184\234\179\160 \234\176\136 \235\129\157\237\140\144\236\153\149\236\157\180 \236\176\190\236\149\132\236\152\168\235\139\164!\
              \n\
              \n[<SATISFY>\236\151\144 \236\160\145\236\134\141\237\149\169\235\139\136\235\139\164.]\
              \n\
              \n\236\155\185\237\136\176 <\237\133\156\235\185\168>\236\157\128 \235\167\164\236\163\188 \237\134\160\236\154\148\236\157\188 \236\151\176\236\158\172\235\144\169\235\139\136\235\139\164."))
            ((language ru)
             (string
              "\208\146 \209\128\208\181\208\176\208\187\209\140\208\189\208\190\209\129\209\130\208\184, \208\178 \208\184\208\179\209\128\208\176\209\133, \208\179\208\180\208\181 \208\177\209\139 \208\190\208\189 \208\189\208\184 \208\177\209\139\208\187, \208\181\208\188\209\131 \209\129\208\190\208\191\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\189\208\181\209\131\208\180\208\176\209\135\208\184... \208\157\208\190 \208\178 \208\190\208\180\208\184\208\189 \208\188\208\190\208\188\208\181\208\189\209\130 \208\178\209\129\209\145 \208\188\208\181\208\189\209\143\208\181\209\130\209\129\209\143. \208\146 \208\184\208\179\209\128\208\181 \208\186\208\190\208\189\209\134\208\181 \208\161\208\181\208\178\208\181\209\128\208\189\208\190\208\185 \208\191\208\181\209\137\208\181\209\128\209\139 \208\190\208\189 \208\190\208\177\208\189\208\176\209\128\209\131\208\182\208\184\209\130 \208\186\208\178\208\181\209\129\209\130, \208\178 \208\186\208\190\209\130\208\190\209\128\208\190\208\188 \208\189\208\176\208\185\208\180\209\145\209\130 \"\208\160\208\181\208\180\208\186\209\131\209\142 \208\186\208\189\208\184\208\179\209\131 \208\159\208\176\208\179\208\188\209\139\"... \208\149\208\188\209\131 \209\131\208\180\208\176\209\129\209\130\209\129\209\143 \209\130\208\190, \209\135\209\130\208\190 \208\189\208\181 \209\131\208\180\208\176\208\187\208\190\209\129\209\140 \209\129\208\190\209\130\208\189\209\143\208\188 \208\188\208\184\208\187\208\187\208\184\208\190\208\189\208\190\208\178 \208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\208\181\208\185. - \208\154\208\176\208\186 \209\130\209\139 \208\178\209\139\208\182\208\184\208\187? - \208\157\208\184\209\135\208\181\208\179\208\190 \208\190\209\129\208\190\208\177\208\181\208\189\208\189\208\190\208\179\208\190."))
            ((language th)
             (string
               "\224\184\138\224\184\180\224\184\153\224\184\162\224\184\173\224\184\135\224\184\173\224\184\185 ID \224\184\129\224\184\163\224\184\180\224\184\148 \224\185\132\224\184\161\224\185\136\224\184\167\224\185\136\224\184\178\224\184\136\224\184\176\224\185\131\224\184\153\224\184\138\224\184\181\224\184\167\224\184\180\224\184\149\224\184\136\224\184\163\224\184\180\224\184\135\224\184\171\224\184\163\224\184\183\224\184\173\224\185\131\224\184\153\224\185\131\224\184\153\224\185\130\224\184\165\224\184\129\224\185\128\224\184\129\224\184\161\224\185\128\224\184\170\224\184\161\224\184\183\224\184\173\224\184\153\224\184\136\224\184\163\224\184\180\224\184\135 SATISFY \224\185\128\224\184\130\224\184\178\224\184\129\224\185\135\224\185\128\224\184\155\224\185\135\224\184\153\224\184\149\224\184\177\224\184\167\224\185\129\224\184\151\224\184\153\224\185\129\224\184\171\224\185\136\224\184\135\224\184\132\224\184\167\224\184\178\224\184\161\224\184\173\224\184\177\224\184\154\224\185\130\224\184\138\224\184\132\224\185\132\224\184\161\224\185\136\224\184\149\224\185\136\224\184\178\224\184\135\224\184\129\224\184\177\224\184\153...\
              \n\224\185\129\224\184\149\224\185\136\224\184\173\224\184\162\224\184\185\224\185\136\224\184\161\224\184\178\224\184\167\224\184\177\224\184\153\224\184\171\224\184\153\224\184\182\224\185\136\224\184\135 \224\184\129\224\184\163\224\184\180\224\184\148 \224\185\132\224\184\148\224\185\137\224\184\158\224\184\154\224\184\129\224\184\177\224\184\154\224\184\149\224\184\179\224\184\163\224\184\178\224\185\128\224\184\155\224\184\165\224\184\181\224\185\136\224\184\162\224\184\153\224\184\173\224\184\178\224\184\138\224\184\181\224\184\158\224\184\151\224\184\181\224\185\136\224\184\153\224\184\179\224\185\128\224\184\130\224\184\178\224\185\132\224\184\155\224\184\170\224\184\185\224\185\136\224\184\129\224\184\178\224\184\163\224\185\128\224\184\155\224\184\165\224\184\181\224\185\136\224\184\162\224\184\153\224\185\128\224\184\155\224\185\135\224\184\153\224\184\173\224\184\178\224\184\138\224\184\181\224\184\158\224\184\163\224\184\176\224\184\148\224\184\177\224\184\154\224\184\149\224\184\179\224\184\153\224\184\178\224\184\153 '\224\184\151\224\184\178\224\184\162\224\184\178\224\184\151\224\184\130\224\184\173\224\184\135\224\185\129\224\184\158\224\185\135\224\184\129\224\184\161\224\185\136\224\184\178'\
              \n\224\184\173\224\184\178\224\184\138\224\184\181\224\184\158\224\184\138\224\185\136\224\184\178\224\184\135\224\184\149\224\184\181\224\185\128\224\184\171\224\184\165\224\185\135\224\184\129\224\185\131\224\184\153\224\184\149\224\184\179\224\184\153\224\184\178\224\184\153\224\184\151\224\184\181\224\185\136\224\184\136\224\184\176\224\184\151\224\184\179\224\185\131\224\184\171\224\185\137\224\185\128\224\184\130\224\184\178\224\184\171\224\184\165\224\184\184\224\184\148\224\184\158\224\185\137\224\184\153\224\184\136\224\184\178\224\184\129\224\184\171\224\184\153\224\184\181\224\185\137\224\184\170\224\184\180\224\184\153 \224\184\158\224\184\163\224\185\137\224\184\173\224\184\161\224\184\129\224\184\177\224\184\154\224\185\132\224\184\148\224\185\137\224\184\170\224\184\177\224\184\161\224\184\156\224\184\177\224\184\170 '\224\184\158\224\184\165\224\184\177\224\184\135\224\185\129\224\184\171\224\185\136\224\184\135\224\185\132\224\184\173\224\185\128\224\184\151\224\184\161' \224\185\129\224\184\165\224\184\176\224\184\129\224\185\137\224\184\178\224\184\167\224\184\170\224\184\185\224\185\136\224\184\129\224\184\178\224\184\163\224\185\128\224\184\155\224\185\135\224\184\153\224\184\156\224\184\185\224\185\137\224\185\128\224\184\165\224\185\136\224\184\153\224\184\151\224\184\181\224\185\136\224\185\129\224\184\130\224\185\135\224\184\135\224\185\129\224\184\129\224\184\163\224\185\136\224\184\135\224\184\151\224\184\181\224\185\136\224\184\170\224\184\184\224\184\148!\
              \n\
              \n---\
              \n- [Official Thai Translation](https://th.kakaowebtoon.com/content/Overgeared/43)"))
            ((language zh)
             (string
               "\230\151\160\232\174\186\230\152\175\231\142\176\229\174\158\228\184\150\231\149\140\232\191\152\230\152\175\230\184\184\230\136\143\228\184\150\231\149\140\228\184\173\239\188\140\228\187\150\233\131\189\230\152\175\230\156\128\229\186\149\229\177\130\231\154\132\229\173\152\229\156\168\239\188\129\231\132\182\232\128\140\229\146\184\233\177\188\231\191\187\232\186\171\231\154\132\230\156\186\228\188\154\231\187\136\228\186\142\230\157\165\228\186\134\239\188\129\229\143\170\232\166\129\232\131\189\229\164\159\230\137\190\229\136\176\230\184\184\230\136\143\228\184\173\231\154\132\230\156\128\229\188\186\232\163\133\229\164\135\239\188\140\229\176\177\232\131\189\232\142\183\229\190\151\232\182\13320\228\186\191\231\142\169\229\174\182\228\184\173\229\148\175\228\184\128\228\184\128\228\184\170\230\136\144\228\184\186\228\188\160\232\175\180\228\184\173\230\156\128\229\188\186\232\129\140\228\184\154\231\148\181\231\171\158\233\128\137\230\137\139\231\154\132\230\156\186\228\188\154\239\188\129\228\187\150\232\131\189\229\144\166\229\156\168\229\129\135\230\131\179\231\142\176\229\174\158\230\184\184\230\136\143\228\184\150\231\149\140\228\184\173\229\136\155\233\128\160\230\150\176\231\154\132\228\188\160\229\165\135\239\188\140\230\136\144\229\138\159\232\132\177\231\166\187\229\166\130\229\144\140\229\153\169\230\162\166\232\136\172\231\154\132\230\130\178\230\131\168\228\186\186\231\148\159\229\145\162\239\188\159\
              \n\
              \n---\
              \n- [Official Simplified Chinese Translation](https://manga.bilibili.com/detail/mc28630)"))
            ((language zh-hk)
             (string
               "[\231\148\179\232\139\177\229\174\135(\228\189\191\231\148\168\232\128\133\229\144\141\231\168\177\239\188\154\230\160\188\233\135\140\229\190\183)]\
              \n\231\168\177\233\156\184\229\133\168\231\144\131\231\154\132\232\153\155\230\147\172\229\175\166\229\162\131\233\129\138\230\136\178\227\128\138SATISFY\227\128\139\
              \n\
              \n\231\132\161\232\171\150\231\143\190\229\175\166\233\130\132\230\152\175\233\129\138\230\136\178\228\184\173\239\188\140\228\187\150\233\131\189\230\152\175\229\128\139\227\128\140\228\184\141\229\185\184\227\128\141\231\154\132\232\177\161\229\190\181...\
              \n\229\156\168\232\167\163\228\187\187\229\139\153\230\153\130\229\129\182\231\132\182\231\153\188\231\143\190\
              \n\233\129\138\230\136\178\228\184\173\231\154\132\230\168\130\233\128\143\226\128\148\226\128\148\227\128\140\229\184\149\230\160\188\231\145\170\231\154\132\229\165\135\230\155\184\227\128\141\239\188\140\
              \n\228\184\166\232\189\137\232\129\183\230\136\14420\229\132\132\231\142\169\229\174\182\228\184\173\239\188\140\229\131\133\229\143\170\228\184\128\229\144\141\231\154\132\230\156\128\229\188\183\229\130\179\229\165\135\231\180\154\232\129\183\230\165\173\227\128\130\
              \n\
              \n\227\128\140\228\189\160\230\128\142\233\186\188\233\130\132\230\180\187\232\145\151...?!\227\128\141\
              \n\
              \n\227\128\140\229\151\175...\228\185\159\230\178\146\228\187\128\233\186\188\229\149\166...\227\128\141\
              \n\
              \n\227\128\140\233\157\160\232\163\157\229\130\153\229\155\137\227\128\130\227\128\141\
              \n\
              \n\232\132\171\233\155\162\228\184\141\229\185\184\232\136\135\230\131\161\229\164\162\232\136\172\231\154\132\229\130\181\229\139\153\239\188\140\
              \n\233\135\141\231\148\159\231\130\186\230\156\128\229\188\183\231\142\169\229\174\182\231\154\132\227\128\140\230\160\188\233\135\140\229\190\183\227\128\141!\
              \n\231\182\147\229\133\184\229\144\141\232\145\151\233\128\154\233\128\154\230\187\190\233\150\139\239\188\140\231\156\159\230\173\163\231\154\132\231\142\139\232\128\133\233\167\149\229\136\176\228\186\134!\
              \n\
              \n[\229\183\178\230\136\144\229\138\159\231\153\187\229\133\165\227\128\138SATISFY\227\128\139\227\128\130]\
              \n\
              \n---\
              \n- [Official Traditional Chinese Translation](https://tw.kakaowebtoon.com/content/%E8%A3%9D%E5%82%99%E4%BB%94/47)"))))
          (is_locked false)
          (links
           (((provider al) (link 117460))
            ((provider ap) (link overgeared-team-argo))
            ((provider kt) (link 56166)) ((provider mu) (link 164862))
            ((provider nu) (link overgeared)) ((provider mal) (link 147727))
            ((provider raw) (link https://page.kakao.com/content/54727849))
            ((provider engtl) (link https://tapas.io/series/overgeared/info))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 8c86611e-fab7-4986-9dec-d1a2f44acdd5)
             (attributes
              ((name (((language en) (string "Virtual Reality")))) (group theme)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-06-08T07:17:21+00:00)
          (updated_at 2024-07-14T21:00:08+00:00) (version 24)
          (available_translated_languages (fa en ru pl es-la it id de tr pt-br))
          (latest_uploaded_chapter 17acadff-18ed-4a02-a719-51422afe5b82)))
        (relationships
         (((id 7d4fee3b-c2b9-41fb-bccc-4f3013375b72) (type_ author))
          ((id f07f34f5-a17e-48b9-9ee1-359acc1aab84) (type_ author))
          ((id a504fe41-4a8f-40ec-9a4e-0a5a562f9168) (type_ artist))
          ((id 6dde7717-3323-4fbd-80ac-c9f7b1b9ad0b) (type_ cover_art))
          ((id 6ef19044-70d3-4e87-994b-4cc07ccd0810) (type_ manga)))))
       ((id 485a777b-e395-4ab1-b262-2a87f53e23c0)
        (attributes
         ((title (((language en) (string "Pyu to Fuku! Jaguar"))))
          (alt_titles
           ((((language en) (string "Blow that Flute! Jaguar")))
            (((language ja-ro) (string "Pyuu to Fuku! Jaguar")))
            (((language ja)
              (string
               "\227\131\148\227\131\165\227\131\188\227\129\168\229\144\185\227\129\143!\227\130\184\227\131\163\227\130\172\227\131\188")))))
          (description
           (((language en)
             (string
              "Piyohiko has a dream: He wants to be a succesfull guitar-player. Then this guy Jaguar shows up, and coaxes him into playing the 'recorder'. Thus ending Piyohiko's noble dream."))))
          (is_locked false)
          (links
           (((provider al) (link 33084))
            ((provider ap) (link pyuu-to-fuku-jaguar))
            ((provider bw) (link series/13045)) ((provider kt) (link 6624))
            ((provider mu) (link 1615))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B07571XHPF))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/134513/))
            ((provider mal) (link 3084))))
          (original_language ja) (last_volume (20)) (last_chapter (438))
          (publication_demographic (shounen)) (status completed) (year (2000))
          (content_rating safe)
          (tags
           (((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f42fbf9e-188a-447b-9fdc-f19dc1e4d685)
             (attributes
              ((name (((language en) (string Music)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-03-20T12:59:03+00:00)
          (updated_at 2023-11-23T12:53:27+00:00) (version 3)
          (available_translated_languages (en pt-br pl))
          (latest_uploaded_chapter ebae4173-be7b-4d21-a7ee-3f814cf3f052)))
        (relationships
         (((id b1ffa33f-72ab-48d5-a805-36861a8ee272) (type_ author))
          ((id b1ffa33f-72ab-48d5-a805-36861a8ee272) (type_ artist))
          ((id d0b8f639-303b-4f14-b7d9-fd209f56d458) (type_ cover_art))
          ((id ca680e09-960f-48f7-9a33-e9fe706157f0) (type_ manga)))))
       ((id d84b20c0-2502-4ed6-8a3a-65448e1acd46)
        (attributes
         ((title (((language en) (string "Slam Dunk (Shinsoban Release)"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\130\185\227\131\169\227\131\160\227\131\128\227\131\179\227\130\175")))
            (((language ja)
              (string
               "SLAM DUNK \230\150\176\232\163\133\229\134\141\231\183\168\231\137\136")))))
          (description
           (((language en)
             (string
               "Winning isn't everything in the game of basketball, but who wants to come in second? It takes dedication and discipline to be the best, and the Shohoku High hoops team wants to be just that. They have one last year to make their captain's dream of reaching the finals come true\226\128\147will they do it? Takehiko Inoue's legendary beloved basketball manga is finally here and the tale of a lifetime is in your hands.\
              \n\
              \nHanamichi Sakuragi's got no game with girls\226\128\148none at all! It doesn't help that he's known for throwing down at a moment's notice and always coming out on top. A hopeless bruiser, he's been rejected by 50 girls in a row! All that changes when he meets the girl of his dreams, Haruko, and she's actually not afraid of him! When she introduces him to the game of basketball, his life is changed forever\226\128\166"))))
          (is_locked false)
          (links
           (((provider al) (link 30051)) ((provider mu) (link pklldyu))
            ((provider mal) (link 51))))
          (original_language ja) (last_volume (20)) (last_chapter (""))
          (publication_demographic (shounen)) (status completed) (year (1990))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-07-23T14:55:00+00:00)
          (updated_at 2023-07-23T14:57:53+00:00) (version 2)
          (available_translated_languages (pl))
          (latest_uploaded_chapter c7c65f21-6c21-4a79-a5cf-4c8e49271774)))
        (relationships
         (((id 0b59098f-13c0-41cb-a110-9cbcec72dc0c) (type_ author))
          ((id 0b59098f-13c0-41cb-a110-9cbcec72dc0c) (type_ artist))
          ((id 9e3e9bea-8e32-4f23-bb53-5e3b0dd98fc5) (type_ cover_art))
          ((id 319df2e2-e6a6-4e3a-a31c-68539c140a84) (type_ manga))
          ((id cccbf058-6ad8-462b-adcd-e5ccb5d58431) (type_ creator)))))
       ((id 2707b1cc-05b9-455f-ae6f-f351dd9f8741)
        (attributes
         ((title (((language en) (string "Evolution Begins With a Big Tree"))))
          (alt_titles
           ((((language en) (string "Evolution From the Big Tree")))
            (((language zh-ro)
              (string
               "C\195\179ng D\195\160 Sh\195\185 K\196\129ish\199\144 De J\195\172nhu\195\160")))
            (((language zh)
              (string
               "\228\187\142\229\164\167\230\160\145\229\188\128\229\167\139\231\154\132\232\191\155\229\140\150")))
            (((language ja)
              (string
               "\233\128\178\229\140\150\227\129\153\227\130\139\232\128\133\227\129\159\227\129\161")))
            (((language vi)
              (string
               "Chuy\225\187\131n Sinh Th\195\160nh Li\225\187\133u \196\144\225\187\153t Bi\225\186\191n")))
            (((language vi)
              (string
               "T\225\187\171 \196\144\225\186\161i Th\225\187\165 Ti\225\186\191n H\195\179a")))
            (((language ru)
              (string
               "\208\156\208\190\209\145 \208\191\208\181\209\128\208\181\209\128\208\190\208\182\208\180\208\181\208\189\208\184\208\181 \208\178 \208\180\209\128\208\181\208\178\208\190: \208\157\208\176\209\135\208\176\208\187\208\190 \209\141\208\178\208\190\208\187\209\142\209\134\208\184\208\184")))))
          (description
           (((language en)
             (string
               "Reborn as a willow tree!? Resurrection of spiritual energy, rise of all things. The reborn willow has also embarked on the path of evolution. It can evolve infinitely, is it \226\128\156divine power\226\128\157 or \226\128\156curse\226\128\157?\r\
              \n\r\
              \nOfficial Translations:\r\
              \n[Japanese](https://piccoma.com/web/product/146958)"))
            ((language ru)
             (string
               "\208\159\208\190\209\129\208\187\208\181 \209\129\208\188\208\181\209\128\209\130\208\184 \208\174\208\185 \208\166\208\183\209\139\209\142\208\185 \208\191\208\181\209\128\208\181\209\128\208\190\208\182\208\180\208\176\208\181\209\130\209\129\209\143 \208\184 \209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\129\209\143\226\128\166 \208\152\208\178\208\190\208\185! \
              \n\208\152 \208\189\208\181\208\184\208\183\208\178\208\181\209\129\209\130\208\189\208\190, \209\129\209\131\208\188\208\181\208\181\209\130 \208\187\208\184 \208\190\208\189 \208\191\209\128\208\184\209\129\208\191\208\190\209\129\208\190\208\177\208\184\209\130\209\140\209\129\209\143 \208\186 \209\130\208\176\208\186\208\190\208\185 \208\183\208\189\208\176\208\186\208\190\208\188\208\190\208\185, \208\189\208\190 \208\178 \209\130\208\190 \208\182\208\181 \208\178\209\128\208\181\208\188\209\143 \209\135\209\131\208\182\208\180\208\190\208\185 \208\190\208\186\209\128\209\131\208\182\208\176\209\142\209\137\208\181\208\185 \209\129\209\128\208\181\208\180\208\181 \226\128\147 \208\178\208\181\208\180\209\140 \209\130\208\176\208\186 \209\129\208\190\208\178\208\191\208\176\208\187\208\190, \209\135\209\130\208\190 \208\181\208\179\208\190 \208\191\208\181\209\128\208\181\209\128\208\190\208\182\208\180\208\181\208\189\208\184\208\181 \209\129\208\187\209\131\209\135\208\184\208\187\208\190\209\129\209\140 \208\186\208\176\208\186 \209\128\208\176\208\183 \208\178\208\190 \208\178\209\128\208\181\208\188\209\143 \208\146\208\181\208\187\208\184\208\186\208\190\208\185 \209\141\208\191\208\190\209\133\208\184 \208\178\208\190\208\183\209\128\208\190\208\182\208\180\208\181\208\189\208\184\209\143 \208\180\209\131\209\133\208\190\208\178\208\189\208\190\208\185 \209\141\208\189\208\181\209\128\208\179\208\184\208\184. \
              \n\208\146\208\190\208\183\209\128\208\190\208\182\208\180\208\181\208\189\208\184\208\181 \208\180\209\131\209\133\208\190\208\178\208\189\208\190\208\185 \209\141\208\189\208\181\209\128\208\179\208\184\208\184 \208\183\208\189\208\176\208\188\208\181\208\189\209\131\208\181\209\130 \208\178\208\190\208\183\208\178\209\139\209\136\208\181\208\189\208\184\208\181 \208\178\209\129\208\181\209\133 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\226\128\166 \
              \n\208\160\208\181\208\178 \209\133\208\184\209\137\208\189\209\139\209\133 \208\183\208\178\208\181\209\128\208\181\208\185 \209\129\209\130\208\176\208\187 \209\129\208\191\208\190\209\129\208\190\208\177\208\181\208\189 \209\129\208\190\209\130\209\128\209\143\209\129\209\130\208\184 \208\179\208\190\209\128\209\139 \208\184 \208\178\208\183\208\178\208\190\208\187\208\189\208\190\208\178\208\176\209\130\209\140 \209\128\208\181\208\186\208\184, \208\176 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\208\176 \209\129 \208\188\208\190\208\179\209\131\209\137\208\181\209\129\209\130\208\178\208\181\208\189\208\189\208\190\208\185 \209\129\208\184\208\187\208\190\208\185 \208\189\208\176\208\178\208\190\208\180\208\189\208\184\208\187\208\184 \209\141\209\130\208\190\209\130 \208\188\208\184\209\128 \208\178 \209\130\208\176\208\186\208\190\208\188 \208\186\208\190\208\187\208\184\209\135\208\181\209\129\209\130\208\178\208\181, \209\135\209\130\208\190 \208\190\208\189 \208\178\208\190\209\130-\208\178\208\190\209\130 \208\187\208\190\208\191\208\189\208\181\209\130 \208\191\208\190 \209\136\208\178\208\176\208\188. \
              \n\208\157\208\190, \208\189\208\181\209\129\208\188\208\190\209\130\209\128\209\143 \208\189\208\176 \208\178\209\129\208\181 \209\141\209\130\208\190, \208\178\208\190 \208\178\209\128\208\181\208\188\209\143 \208\191\208\190\208\180\208\190\208\177\208\189\208\190\208\185 \209\141\208\191\208\190\209\133\208\184 \208\178\209\139\209\128\208\190\209\129\208\187\208\176 \208\178\208\181\208\187\208\184\209\135\208\181\209\129\209\130\208\178\208\181\208\189\208\189\208\176\209\143 \208\184\208\178\208\176, \209\129\208\191\208\190\209\129\208\190\208\177\208\189\208\176\209\143 \208\177\208\181\208\183\208\179\209\128\208\176\208\189\208\184\209\135\208\189\208\190 \209\128\208\176\208\183\208\178\208\184\208\178\208\176\209\130\209\140\209\129\209\143 \208\184 \209\141\208\178\208\190\208\187\209\142\209\134\208\184\208\190\208\189\208\184\209\128\208\190\208\178\208\176\209\130\209\140. \
              \n\208\159\208\187\208\190\208\180\209\139, \209\135\209\130\208\190 \209\128\208\176\209\129\209\130\209\131\209\130 \208\189\208\176 \208\189\208\181\208\185, \209\129\208\191\208\190\209\129\208\190\208\177\208\189\209\139 \208\180\208\176\209\128\208\190\208\178\208\176\209\130\209\140 \208\180\209\128\209\131\208\179\208\184\208\188 \208\189\208\181\208\190\208\177\209\139\209\135\208\176\208\185\208\189\209\139\208\181 \209\129\208\191\208\190\209\129\208\190\208\177\208\189\208\190\209\129\209\130\208\184, \208\176 \208\180\209\131\209\133\208\190\208\178\208\189\208\176\209\143 \209\141\208\189\208\181\209\128\208\179\208\184\209\143, \208\186\208\190\209\130\208\190\209\128\209\131\209\142 \208\190\208\189\208\176 \209\128\208\176\209\129\208\191\209\128\208\190\209\129\209\130\209\128\208\176\208\189\209\143\208\181\209\130, \209\131\208\186\209\128\208\181\208\191\208\187\209\143\208\181\209\130 \209\129\208\184\208\187\209\139 \208\183\208\178\208\181\209\128\208\181\208\185, \209\135\209\130\208\190 \208\190\208\177\208\184\209\130\208\176\209\142\209\130 \208\189\208\176 \208\181\208\181 \209\130\208\181\209\128\209\128\208\184\209\130\208\190\209\128\208\184\208\184. \
              \n\226\128\166 \
              \n\208\158\208\180\208\189\208\184 \208\178\208\181\208\187\208\184\209\135\208\176\209\142\209\130 \208\181\208\181 \208\188\208\184\209\128\208\190\208\178\209\139\208\188 \208\180\209\128\208\181\208\178\208\190\208\188 \226\128\147 \208\152\208\179\208\179\208\180\209\128\208\176\209\129\208\184\208\187\208\181\208\188, \208\180\208\181\208\189\209\140 \208\183\208\176 \208\180\208\189\208\181\208\188 \208\178\208\190\209\129\209\129\208\187\208\176\208\178\208\187\209\143\209\143 \208\181\208\179\208\190 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\208\190\208\178\208\176\208\189\208\184\208\181! \
              \n\208\148\209\128\209\131\208\179\208\184\208\181 \226\128\147 \194\171\208\178\208\181\208\187\208\184\208\186\208\184\208\188 \208\177\208\190\208\182\208\181\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\188 \208\180\209\128\208\181\208\178\208\190\208\188\194\187, \208\191\208\190\208\180\208\191\208\184\209\128\208\176\209\142\209\137\208\184\208\188 \208\189\208\181\208\177\208\190\209\129\208\178\208\190\208\180! \
              \n\208\160\208\176\208\183\209\131\208\188\208\181\208\181\209\130\209\129\209\143, \208\177\208\190\208\187\209\140\209\136\208\184\208\189\209\129\209\130\208\178\208\190 \208\191\209\128\208\190\209\129\209\130\208\190 \208\183\208\190\208\178\209\131\209\130 \208\181\208\179\208\190 \194\171\209\129\208\178\209\143\209\137\208\181\208\189\208\189\209\139\208\188 \208\180\209\128\208\181\208\178\208\190\208\188\194\187, \208\184\208\187\208\184 \194\171\208\191\209\128\208\190\208\186\208\187\209\143\209\130\209\139\208\188 \208\180\208\181\209\128\208\181\208\178\208\190\208\188\194\187, \208\184\208\187\208\184 \208\182\208\181 \194\171\208\180\209\140\209\143\208\178\208\190\208\187\209\140\209\129\208\186\208\184\208\188 \208\180\208\181\209\128\208\181\208\178\208\190\208\188\194\187\226\128\166 \208\148\208\176 \208\184 \208\181\209\137\208\181 \208\188\208\189\208\190\208\179\208\190 \208\186\208\176\208\186. \
              \n\208\152 \208\178\209\129\208\181 \208\182\208\181, \208\191\209\128\208\184 \208\187\209\142\208\177\208\190\208\188 \208\181\208\179\208\190 \209\131\208\191\208\190\208\188\208\184\208\189\208\176\208\189\208\184\208\184 \208\178 \208\179\208\190\208\187\208\190\209\129\208\181 \208\186\208\176\208\182\208\180\208\190\208\179\208\190 \209\143\209\129\208\189\208\190 \209\129\208\187\209\139\209\136\208\184\209\130\209\129\209\143 \208\177\208\187\208\176\208\179\208\190\208\179\208\190\208\178\208\181\208\185\208\189\209\139\208\185 \209\130\209\128\208\181\208\191\208\181\209\130."))
            ((language zh)
             (string
              "\233\187\145\233\184\159\231\164\190\230\150\176\228\189\156\239\188\140\233\135\141\231\148\159\230\136\144\228\184\186\228\184\128\230\160\170\230\159\179\230\160\145\239\188\129\239\188\159\231\129\181\230\176\148\229\164\141\232\139\143\239\188\140\228\184\135\231\137\169\229\180\155\232\181\183\227\128\130\233\135\141\231\148\159\231\154\132\230\159\179\230\160\145\228\185\159\232\181\176\228\184\138\228\186\134\232\191\155\229\140\150\228\185\139\232\183\175\227\128\130\232\131\189\229\164\159\230\151\160\233\153\144\232\191\155\229\140\150\231\154\132\229\174\131\239\188\140\230\152\175\226\128\156\231\165\158\229\138\155\226\128\157\232\191\152\230\152\175\226\128\156\232\175\133\229\146\146\226\128\157\239\188\159"))))
          (is_locked false)
          (links
           (((provider mu) (link tl84n1q))
            ((provider raw)
             (link https://www.kuaikanmanhua.com/web/topic/15551/))))
          (original_language zh) (last_volume ()) (last_chapter ())
          (publication_demographic ()) (status ongoing) (year (2022))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-02-11T09:30:42+00:00)
          (updated_at 2024-05-29T19:01:31+00:00) (version 10)
          (available_translated_languages (en ru))
          (latest_uploaded_chapter 0327f7ea-9585-4e7e-9a40-d247f48862e0)))
        (relationships
         (((id a38b91b3-aede-455d-a444-ad53802e15af) (type_ author))
          ((id 83f85b14-d75c-4605-a380-adcc2bad6f72) (type_ artist))
          ((id 60d2103f-f724-4d21-84c9-ee41d2c96ca7) (type_ cover_art))
          ((id e929368d-a2ef-4bd8-8405-bfbbe5d385bc) (type_ creator)))))
       ((id 52b6a95d-d8c8-4e10-a643-a262ad9b1402)
        (attributes
         ((title
           (((language en)
             (string
              "Ikenie ni Natta Ore ga Nazeka Jashin wo Horoboshite Shimatta Ken"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\148\159\232\180\132\227\129\171\227\129\170\227\129\163\227\129\159\228\191\186\227\129\140\227\128\129\227\129\170\227\129\156\227\129\139\233\130\170\231\165\158\227\130\146\230\187\133\227\129\188\227\129\151\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159\228\187\182")))
            (((language en)
              (string "I, the Sacrifice, Somehow Killed the Evil God")))))
          (description
           (((language en)
             (string
              "Elt sacrificed himself to the evil god in place of his childhood friend. He was prepared to die in the face of the evil god's attack, and was supposed to meet his end...However, at that moment, his unique skill \"Inventory\" activates, and he finds himself turning the tables on the evil god. Surviving, Elt sets off for his home village to inform his childhood friend of his safety, but on the way, he encounters a powerful monster walking through the forest\226\128\148however, as he prepares to avoid the confrontation, he spots a fainted girl right next to the creature! A royal welcome upon this world! The success fantasy starting with a sacrificial hero!"))
            ((language ja)
             (string
              "\232\135\170\227\130\137\229\185\188\233\166\180\230\159\147\227\129\174\232\186\171\228\187\163\227\130\143\227\130\138\227\129\171\233\130\170\231\165\158\227\129\184\227\129\174\231\148\159\232\180\132\227\129\168\227\129\170\227\129\163\227\129\159\227\130\168\227\131\171\227\131\136\227\128\130\233\130\170\231\165\158\227\129\174\230\148\187\230\146\131\227\130\146\229\137\141\227\129\171\230\173\187\227\130\146\232\166\154\230\130\159\227\129\151\227\128\129\230\156\128\230\156\159\227\130\146\232\191\142\227\129\136\227\130\139\226\128\166\226\128\166\227\129\175\227\129\154\227\129\160\227\129\163\227\129\159\227\128\130\227\129\140\227\128\129\227\131\166\227\131\139\227\131\188\227\130\175\227\130\185\227\130\173\227\131\171\227\128\142\227\130\185\227\131\136\227\131\131\227\130\175\227\128\143\227\129\140\231\153\186\229\139\149\227\129\151\227\128\129\230\176\151\227\129\140\228\187\152\227\129\143\227\129\168\233\130\170\231\165\158\227\130\146\232\191\148\227\130\138\232\168\142\227\129\161\227\129\171\227\129\151\227\129\166\227\129\132\227\129\159\227\128\130\231\148\159\233\130\132\227\129\151\227\129\159\227\130\168\227\131\171\227\131\136\227\129\175\229\185\188\233\166\180\230\159\147\227\129\171\231\132\161\228\186\139\227\130\146\228\188\157\227\129\136\227\130\139\227\129\159\227\130\129\227\128\129\230\149\133\233\131\183\227\129\174\230\157\145\227\129\184\227\129\168\230\151\133\231\171\139\227\129\164\227\129\147\227\129\168\227\129\171\227\128\130\233\129\147\228\184\173\227\128\129\230\163\174\227\130\146\230\173\169\227\129\132\227\129\166\227\129\132\227\130\139\227\129\168\229\188\183\229\138\155\227\129\170\227\131\162\227\131\179\227\130\185\227\130\191\227\131\188\227\129\171\233\129\173\233\129\135\227\128\130\230\136\166\233\151\152\227\130\146\229\155\158\233\129\191\227\129\151\227\130\136\227\129\134\227\129\168\232\128\131\227\129\136\227\129\159\227\129\157\227\129\174\230\153\130\227\128\129\227\131\162\227\131\179\227\130\185\227\130\191\227\131\188\227\129\174\229\130\141\227\129\167\230\176\151\227\130\146\229\164\177\227\129\163\227\129\166\227\129\132\227\130\139\229\176\145\229\165\179\227\130\146\231\153\186\232\166\139\227\129\151\226\128\148\226\128\148\231\148\159\232\180\132\231\179\187\228\184\187\228\186\186\229\133\172\227\129\171\227\130\136\227\130\139\231\142\139\233\129\147\230\136\144\227\130\138\228\184\138\227\129\140\227\130\138\227\131\149\227\130\161\227\131\179\227\130\191\227\130\184\227\131\188\233\150\139\229\185\149\239\188\129"))))
          (is_locked false)
          (links
           (((provider al) (link 150717))
            ((provider ap)
             (link
              ikenie-ni-natta-ore-ga-naze-ka-jashin-wo-horoboshite-shimatta-ken))
            ((provider bw) (link series/349497/list))
            ((provider kt)
             (link
              ikenie-ni-natta-ore-ga-naze-ka-jashin-wo-horoboshite-shimatta-ken-2022))
            ((provider mu) (link eimc273))
            ((provider nu) (link i-the-sacrifice-somehow-killed-the-evil-god-ln))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0BL17QL56))
            ((provider cdj)
             (link
              https://www.cdjapan.co.jp/searchuni?q=%E7%94%9F%E8%B4%84%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E4%BF%BA%E3%81%8C%E3%80%81%E3%81%AA%E3%81%9C%E3%81%8B%E9%82%AA%E7%A5%9E%E3%82%92%E6%BB%85%E3%81%BC%E3%81%97%E3%81%A6%E3%81%97%E3%81%BE%E3%81%A3%E3%81%9F%E4%BB%B6+Comics&opt.exclude_prx=on&order=reldesc))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/695688/))
            ((provider mal) (link 147954))
            ((provider raw)
             (link
              https://gaugau.futabanet.jp/list/work/60a734cb7765611395000000))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating suggestive)
          (tags
           (((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-08-15T20:28:58+00:00)
          (updated_at 2024-05-09T16:59:55+00:00) (version 20)
          (available_translated_languages (en))
          (latest_uploaded_chapter e136e631-9a5f-423d-bf2a-e57343302757)))
        (relationships
         (((id dfa9b0e4-5994-433e-8085-befcdcf7574e) (type_ author))
          ((id aab9b61a-95ee-423a-9c2b-39732ee9f64b) (type_ artist))
          ((id 39a34431-e0cb-4b92-87f7-c29ad4df1ad2) (type_ cover_art))
          ((id 806ce32c-3e4b-4695-a95a-71ee12c9ded3) (type_ creator)))))
       ((id f032b354-db45-4f39-a07e-1e4902c02c7a)
        (attributes
         ((title (((language en) (string "Kimi to Picopico"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\141\227\129\191\227\129\168\227\131\148\227\130\179\227\131\148\227\130\179")))
            (((language ja-ro) (string "Kimi to Pikopiko")))
            (((language ja-ro) (string "Kimi to Pico-Pico")))
            (((language zh)
              (string
               "\229\146\140\228\189\160\228\184\128\232\181\183\230\137\147\230\184\184\230\136\143")))
            (((language en) (string "You & Picopico")))
            (((language en) (string "You & Bleep Bloop")))))
          (description
           (((language en)
             (string
              "Oota, an otaku, joined the game club to live his ideal high school life. That was when he met by chance the freshman gal, Ageha Onisaki!! They dive straight into playing video games, but Ageha's choices are the Famicom (NES), the Super Famicom (SNES), and the Megadrive (Sega Genesis)! Who the heck is this person!? Playing a wide range from famous to retro games, the gal and the otaku start their heart-throbbing life!"))
            ((language pt-br)
             (string
              "Oota, um otaku, ingressou no clube de jogos para viver sua vida ideal de colegial. Foi quando ele conheceu por acaso a caloura Ageha Onisaki!! Eles mergulham direto nos videogames, mas as escolhas de Ageha s\195\163o NES, SNES e Megadora! Quem diabos \195\169 essa garota!? Jogando uma ampla variedade de jogos retr\195\180s famosos, gal e o otaku come\195\167am sua agitada vida juntos!"))))
          (is_locked false)
          (links
           (((provider al) (link 131287)) ((provider ap) (link kimi-to-picopico))
            ((provider bw) (link series/311830/list))
            ((provider kt) (link 60561)) ((provider mu) (link 170628))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B09QK3YLNM))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/648457))
            ((provider mal) (link 135383))
            ((provider raw)
             (link https://pocket.shonenmagazine.com/episode/3269632237290946280))))
          (original_language ja) (last_volume (5)) (last_chapter (57))
          (publication_demographic (shounen)) (status completed) (year (2021))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 9438db5a-7e2a-4ac0-b39e-e0d95a34b8a8)
             (attributes
              ((name (((language en) (string "Video Games")))) (group theme)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-10-31T18:43:59+00:00)
          (updated_at 2024-06-04T06:49:48+00:00) (version 28)
          (available_translated_languages (en pt-br vi id))
          (latest_uploaded_chapter 5c35fef7-f731-403e-89bb-7e33e07d8bfe)))
        (relationships
         (((id e2943882-62e9-47b9-9ca9-4f810c17acc5) (type_ author))
          ((id e2943882-62e9-47b9-9ca9-4f810c17acc5) (type_ artist))
          ((id d8c01a80-d98e-4551-846e-526125e5ffb8) (type_ cover_art))
          ((id 598ae3a9-ac0f-45d6-b33b-8f9f971d9cbe) (type_ manga))
          ((id e0bf4630-2056-46b6-b840-f61d459f3e41) (type_ creator)))))
       ((id b22561f9-81f1-45f6-b2c0-f5b53cfaee19)
        (attributes
         ((title (((language en) (string "All Hail the Sect Leader"))))
          (alt_titles
           ((((language en) (string "The Greatest Sect Leader of All-Time")))
            (((language zh-ro) (string "Wangu Zui Qiang Zong")))
            (((language zh)
              (string
               "\228\184\135\229\143\164\230\156\128\229\188\186\229\174\151")))))
          (description
           (((language en)
             (string
              "All the members of my sect are abnormally strong. All my disciples turn out to be big shots, and I'll definitely become invincible in this world!"))
            ((language fr)
             (string
              "Ma qu\195\170te est de d\195\169velopper une secte qui serait un foyer chaleureux pour ses membres. Dedans, non seulement le chef de secte est amusant (ouais c'est moi) mais les disciples sont excentriques, aux personnalit\195\169s tr\195\168s vari\195\169es. Ils ont comme particularit\195\169s d'\195\170tre en constante \195\169volution et d'\195\170tre anormalement forts. Tous se r\195\169v\195\168lent \195\170tre des gros bonnets, et moi, leur patriarche, je deviendrai invincible ! Approchez, les enfants, rejoignez ma secte et ensemble nous r\195\169aliserons vos r\195\170ves !"))))
          (is_locked false)
          (links
           (((provider al) (link 136499)) ((provider mu) (link oyvebmw))
            ((provider nu) (link the-strongest-sect-of-all-times))
            ((provider raw) (link https://ac.qq.com/Comic/comicInfo/id/650464))
            ((provider engtl)
             (link
              https://www.webnovel.com/comic/all-hail-the-sect-leader_19783613905232101))))
          (original_language zh) (last_volume ()) (last_chapter ())
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id acc803a4-c95a-4c22-86fc-eb6b582d82a2)
             (attributes
              ((name (((language en) (string Wuxia)))) (group genre) (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-05-25T04:03:21+00:00)
          (updated_at 2024-08-01T10:27:23+00:00) (version 11)
          (available_translated_languages (en fr pt-br it))
          (latest_uploaded_chapter a8a3e70c-8ff0-425a-8030-35de938ae560)))
        (relationships
         (((id 63200b97-bbf8-4dab-8522-a158fec3afad) (type_ author))
          ((id 63200b97-bbf8-4dab-8522-a158fec3afad) (type_ artist))
          ((id 332b4593-e026-49e8-9b86-291934f6c780) (type_ cover_art))
          ((id 5fbdf751-d5ff-4af6-acf7-9b32ce1308fd) (type_ creator)))))
       ((id 22c844da-1122-4ab3-b726-e7d4b7114254)
        (attributes
         ((title
           (((language en) (string "Classroom of the Elite - 2nd Year Arc"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\130\136\227\129\134\227\129\147\227\129\157\229\174\159\229\138\155\232\135\179\228\184\138\228\184\187\231\190\169\227\129\174\230\149\153\229\174\164\227\129\184 2\229\185\180\231\148\159\231\183\168")))
            (((language ru)
              (string
               "\208\148\208\190\208\177\209\128\208\190 \208\191\208\190\208\182\208\176\208\187\208\190\208\178\208\176\209\130\209\140 \208\178 \208\186\208\187\208\176\209\129\209\129 \208\191\209\128\208\181\208\178\208\190\209\129\209\133\208\190\208\180\209\129\209\130\208\178\208\176 - \208\146\209\130\208\190\209\128\208\190\208\185 \208\179\208\190\208\180")))
            (((language en) (string "Classroom of the Elite: Year 2")))
            (((language vi)
              (string
               "Ch\195\160o m\225\187\171ng \196\145\225\186\191n v\225\187\155i l\225\187\155p h\225\187\141c \196\145\225\187\129 cao th\225\187\177c l\225\187\177c n\196\131m 2")))
            (((language tr)
              (string "Elitler S\196\177n\196\177f\196\177: 2. Y\196\177l")))
            (((language ja-ro)
              (string
               "Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e: 2-nensei-hen")))
            (((language fi) (string "Eliittien luokkahuone: Toinen vuosi")))
            (((language fi)
              (string "Tervetuloa eliittien luokkahuoneeseen: Toinen vuosi")))))
          (description
           (((language en)
             (string
              "The second spring at the Advanced Nurturing High School is welcoming Ayanokoji and Class D. The special exams aren't only what awaits them, but the unique freshmen as well. Kazuomi H\197\141sen and Ry\197\171en. The two who shared the bad reputation between themselves during Ryuen's middle school days. Takuya Yagami, who proclaims to come from the same middle school as Kushida, is approaching her. And the capricious Ichika Amasawa who is pulling Ayanokoji left and right."))
            ((language pt-br)
             (string
              "A cortina sobe e o arco do segundo ano dessa s\195\169rie extremamente popular come\195\167a!Quando Kiyotaka Ayanokouji e seus colegas de classe come\195\167am seu segundo ano, mudan\195\167as s\195\163o vistas em toda a Tokyo Metropolitan Advanced Nurturing High School. Com a gradua\195\167\195\163o do terceiro ano e a entrada do primeiro ano na escola, as alian\195\167as est\195\163o bem encaminhadas. Al\195\169m disso, agora que Miyabi Nagumo \195\169 o presidente do conselho estudantil, a promessa de transformar a escola em uma baseada meritocracia pode se tornar uma realidade. Enquanto isso, os conflitos entre as classes continuam a crescer \195\160 medida que o total de pontos da classe se aproxima. Com outro exame especial se aproximando, Ayanokouji permanecer\195\161 nas sombras, ou ele finalmente entrar\195\161 nos holofotes e ajudar\195\161 sua classe a subir para a ilustre Classe A?"))))
          (is_locked false)
          (links
           (((provider al) (link 141044))
            ((provider ap) (link classroom-of-the-elite-year-2))
            ((provider bw) (link series/361293)) ((provider mu) (link trbjtb2))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0C2T87XQD))
            ((provider mal) (link 142246))
            ((provider raw)
             (link
              https://comic-walker.com/contents/detail/KDCW_MF02203140010000_68/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2021))
          (content_rating suggestive)
          (tags
           (((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-12-24T15:48:07+00:00)
          (updated_at 2024-03-26T11:57:47+00:00) (version 21)
          (available_translated_languages (fr vi id pt-br en ru fi ar es es-la))
          (latest_uploaded_chapter 893da2c4-91a4-400f-976f-5f1003e3b274)))
        (relationships
         (((id 7295d6da-7fd4-46b9-88dc-5723cc8da29f) (type_ author))
          ((id e6e93bd9-2f7f-494f-9b02-4f0ee816f10c) (type_ artist))
          ((id d9875374-0944-4fa8-be81-3d1bf8b0114b) (type_ cover_art))
          ((id bc5f9952-4bb0-4f60-a1ff-b3b2186b560f) (type_ manga))
          ((id 0218ac4d-c69e-4670-8ea0-3bb161a3ef8d) (type_ creator)))))
       ((id 1d20b5df-2b7c-4bac-be8a-b90181a65323)
        (attributes
         ((title (((language en) (string "Mangaka-san and his Assistants"))))
          (alt_titles
           ((((language ja) (string "The Comic Artist And His Assistants")))
            (((language ru)
              (string
               "\208\156\208\176\208\189\208\179\208\176\208\186\208\176 \208\184 \208\181\208\179\208\190 \208\176\209\129\209\129\208\184\209\129\209\130\208\181\208\189\209\130\208\186\208\176")))
            (((language ar)
              (string
               "\216\177\216\179\216\167\217\133 \216\167\217\132\217\133\216\167\217\134\216\172\216\167 \217\136 \217\133\216\179\216\167\216\185\216\175\216\167\216\170\217\135")))
            (((language ja)
              (string
               "\227\131\158\227\131\179\227\130\172\229\174\182\227\129\149\227\130\147\227\129\168\227\130\162\227\130\183\227\130\185\227\130\191\227\131\179\227\131\136\227\129\149\227\130\147\227\129\168")))
            (((language ja-ro) (string "Mangaka-san to Assistant-san to")))))
          (description
           (((language en)
             (string
               "A Life Description about the Mangaka Aito Yuuki and his Assistant Ashisu Sahoto.  \
              \nAito-san doesn't understand the feelings of the characters on his stories. So He asks Ashisu to help him. Ashisu would do everything for the work. She would even let him touch her breast so he will know how it feels like?!  \
              \n  \
              \nThe Habit?! The Pervert?! Can we understand them? That's the Comedy of a Mangaka Life.\
              \n\
              \nThe mangaka alternates between the standard style and the 4koma.  \
              \n\
              \n---\
              \n\
              \n**Links:**  \
              \n- [Anime on ANN](https://www.animenewsnetwork.com/encyclopedia/anime.php?id=15793)"))
            ((language ru)
             (string
              "\208\150\208\184\208\183\208\189\209\140 \208\190\208\191\208\184\209\129\208\176\208\189\208\184\208\181 \208\188\208\176\208\189\208\179\208\176\208\186\208\176 \208\144\208\185\209\130\208\190 \208\174\208\186\208\184 \208\184 \208\181\208\179\208\190 \208\191\208\190\208\188\208\190\209\137\208\189\208\184\209\134\209\139 \208\144\209\136\208\184\209\129\209\131 \208\161\208\176\209\133\208\190\209\130\208\190. \208\144\208\185\209\130\208\190-\209\129\208\176\208\189 \208\189\208\181 \208\191\208\190\208\189\209\143\209\130\209\140 \209\135\209\131\208\178\209\129\209\130\208\178\208\176 \208\179\208\181\209\128\208\190\208\181\208\178 \208\181\208\179\208\190 \209\128\208\176\209\129\209\129\208\186\208\176\208\183\208\190\208\178. \208\159\208\190\209\141\209\130\208\190\208\188\209\131 \208\190\208\189 \208\191\209\128\208\190\209\129\208\184\209\130 \208\144\209\136\208\184\209\129\209\131, \209\135\209\130\208\190\208\177\209\139 \208\191\208\190\208\188\208\190\209\135\209\140 \208\181\208\188\209\131. \208\144\209\136\208\184\209\129\209\131 \209\129\208\180\208\181\208\187\208\176\208\181\209\130 \208\178\209\129\208\181 \208\180\208\187\209\143 \209\128\208\176\208\177\208\190\209\130\209\139. \208\158\208\189\208\176 \208\177\209\139 \208\180\208\176\208\182\208\181 \208\180\208\176\209\129\209\130 \208\191\208\190\209\137\209\131\208\191\208\176\209\130\209\140 \208\181\208\181 \209\129\208\190\208\177\209\129\209\130\208\178\208\181\208\189\208\189\208\190\208\185 \208\179\209\128\209\131\208\180\208\184 \209\130\208\176\208\186 \208\190\208\189 \208\177\209\131\208\180\208\181\209\130 \208\183\208\189\208\176\209\130\209\140, \208\186\208\176\208\186 \208\190\208\189\208\176 \209\135\209\131\208\178\209\129\209\130\208\178\209\131\208\181\209\130, \208\186\208\176\208\186?! \208\159\209\128\208\184\208\178\209\139\209\135\208\186\208\176?! \208\152\208\183\208\178\209\128\208\176\209\137\208\181\208\189\209\134\208\181?! \208\156\209\139 \208\188\208\190\208\182\208\181\208\188 \208\184\209\133 \208\191\208\190\208\189\209\143\209\130\209\140? \208\173\209\130\208\190 \208\186\208\190\208\188\208\181\208\180\208\184\209\143 \208\190 \208\188\208\176\208\189\208\179\208\176\208\186\208\176 \208\182\208\184\208\183\208\189\208\184."))
            ((language pt-br)
             (string
              "A hist\195\179ria desse mang\195\161 descreve sobre a vida do mangaka Aito Yuuki e de sua assistente Ashisu Sahoto. Aito-san n\195\163o entende os sentimentos dos personagens de suas hist\195\179rias. Ent\195\163o ele pede para Ashisu ajud\195\161-lo. Ashisu faria tudo pelo trabalho. Ela poderia at\195\169 mesmo deixar ele tocar em seus pr\195\179prios seios para que ele sinta como \195\169."))))
          (is_locked false)
          (links
           (((provider al) (link 41294))
            ((provider ap) (link mangaka-to-assistant-san-to))
            ((provider bw) (link series/346625)) ((provider kt) (link 21236))
            ((provider mu) (link 16197))
            ((provider amz) (link https://www.amazon.co.jp/dp/B09VF83GZQ))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/687668/))
            ((provider mal) (link 11294))
            ((provider raw)
             (link
              https://magazine.jp.square-enix.com/gangan/introduction/manga/))))
          (original_language ja) (last_volume (10)) (last_chapter (151))
          (publication_demographic (seinen)) (status completed) (year (2008))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b11fda93-8f1d-4bef-b2ed-8803d3733170)
             (attributes
              ((name (((language en) (string 4-Koma)))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-01-23T11:23:35+00:00)
          (updated_at 2023-12-24T16:57:05+00:00) (version 11)
          (available_translated_languages (pt-br en pl))
          (latest_uploaded_chapter 53d64bfd-5438-46c3-8aec-2954ab95e36c)))
        (relationships
         (((id ec768aea-fa7f-40c3-a67f-4c1b95cafb45) (type_ author))
          ((id ec768aea-fa7f-40c3-a67f-4c1b95cafb45) (type_ artist))
          ((id 3ab662d5-7c36-4f1b-b8fc-bbd63db80ea6) (type_ cover_art))
          ((id a65cdd66-cc22-448d-86cf-757f1a9ec82a) (type_ manga)))))
       ((id 787a9f0c-6f48-401c-8edc-d6ee07516c4f)
        (attributes
         ((title (((language en) (string "Cheeky Brat"))))
          (alt_titles
           ((((language ja-ro) (string Namaikizakari)))
            (((language ja)
              (string
               "\227\129\170\227\129\190\227\129\132\227\129\141\227\129\150\227\129\139\227\130\138\227\128\130")))
            (((language zh)
              (string "\231\155\155\230\176\148\229\135\140\228\186\186")))
            (((language en) (string "His Cheekiness is in Full Bloom")))
            (((language cs) (string "Drzej spratek")))))
          (description
           (((language cs)
             (string
              "Jsem Yuki a nidky to nep\197\153izn\195\161m. Nikdy. To co bych nikdy neud\196\155lala je p\197\153iznat se k tomi, \197\190e m\195\161m mo\197\190n\195\161 men\197\161\195\173 slabost pro m\195\169ho drz\195\169ho kr\195\161sn\195\169ho spolu\197\190\195\161ka \226\128\147 kter\195\189 se chov\195\161 jako nehor\195\161zn\195\189 spratek \226\128\147 Naruse. Kdy\197\190 u\197\190 se o n\196\155m bav\195\173me, m\195\173sto toho, aby se soust\197\153edil na svou zvl\195\161\197\161tn\195\173 st\197\153edo\197\161koln\195\173 rivalitu s n\196\155jak\195\189m klukem jm\195\169nem Shizuka, tak by se m\196\155l pustit do hry a soust\197\153edit se na n\195\161\197\161 kvalifika\196\141n\195\173 z\195\161pas\226\128\166!! Mo\197\190n\195\161 jsem toho od n\196\155j nakonec \196\141ekala a\197\190 moc\226\128\166"))
            ((language en)
             (string
              "I, Yuki, have no intention of admitting it. Never. The last thing I will ever do is plead guilty to the crime of maybe possibly having a soft spot for my cheeky playboy of an underclassman\226\128\148who\226\128\153s an absolute brat\226\128\148Naruse. Speaking of which, instead of focusing on his strange grade school rivalry with this Shizuka guy, he needs to get his head in the game and focus on our qualifiers\226\128\166!! Maybe I was expecting too much from him, after all\226\128\166"))
            ((language pt-br)
             (string
              "Machida Yuki sabe que n\195\163o quer nada com Naruse Shou. Mas como evit\195\161-lo quando ela gerencia o grupo de basquete em que ele participa?!"))))
          (is_locked false)
          (links
           (((provider al) (link 85395)) ((provider ap) (link namaikizakari))
            ((provider bw) (link series/21572/list)) ((provider kt) (link 25496))
            ((provider mu) (link 104388))
            ((provider amz)
             (link https://www.amazon.co.jp/-/en/gp/product/B07PLM8NCN))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2709065))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/248405/))
            ((provider mal) (link 67645))
            ((provider engtl)
             (link https://yenpress.com/9781975334352/cheeky-brat-vol-1/))))
          (original_language ja) (last_volume (23)) (last_chapter (137))
          (publication_demographic (shoujo)) (status completed) (year (2013))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-09-05T11:41:57+00:00)
          (updated_at 2024-07-12T15:53:05+00:00) (version 19)
          (available_translated_languages (pt-br en pl cs))
          (latest_uploaded_chapter 50339464-5e07-4847-b12e-c617eecde607)))
        (relationships
         (((id ef2fd5a1-9299-4a82-8daf-2b97335f9868) (type_ author))
          ((id ef2fd5a1-9299-4a82-8daf-2b97335f9868) (type_ artist))
          ((id d81fc0ee-8475-49ce-889b-dd27477c5488) (type_ cover_art)))))
       ((id 5f035bce-267a-4c95-bff1-b319cad73bda)
        (attributes
         ((title (((language en) (string "Silver Triangle"))))
          (alt_titles
           ((((language ja-ro) (string "Gin no Sankaku")))
            (((language pl) (string "Srebrny Tr\195\179jk\196\133t")))
            (((language ja)
              (string "\233\138\128\227\129\174\228\184\137\232\167\146")))
            (((language zh)
              (string "\233\147\182\228\185\139\228\184\137\232\167\146")))))
          (description
           (((language en)
             (string
               "Marlee, an agent of the advanced civilization Central on the planet Blue Ear, finds himself on a mission to track down the troubadour Lagthorin. His mission leads him to the planet Corundum, where he finds the elusive musician and subsequently dies. Back at Central, he is regenerated into a new clone, Marlee Two, who sets off once more, drawn back to Lagthorin and her song. And so the strings of fate guide Marlee forward, inescapably intertwined with both the events on the planet Corundum and, 30,000 years across time, with the long-extinct race of the planet Silver Triangle.  \
              \n  \
              \nA 1-volume classic sci-fi manga.  \
              \n  \
              \nWinner of the Seiun Award in 1983."))))
          (is_locked false)
          (links
           (((provider al) (link 39180)) ((provider ap) (link gin-no-sankaku))
            ((provider bw) (link def48bdfca-a72b-4339-ad70-3ccf015728a8))
            ((provider kt) (link 18609)) ((provider mu) (link 12394))
            ((provider amz) (link https://www.amazon.co.jp/dp/B00VHZIAEK/))
            ((provider cdj)
             (link
              http://www.cdjapan.co.jp/product/NEOBK-80367?s_ssid=e32ca05c716b249fbc))
            ((provider mal) (link 9180))))
          (original_language ja) (last_volume (1)) (last_chapter (19))
          (publication_demographic ()) (status completed) (year (1980))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 292e862b-2d17-4062-90a2-0356caa4ae27)
             (attributes
              ((name (((language en) (string "Time Travel")))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-03-07T02:06:19+00:00)
          (updated_at 2024-07-21T19:52:44+00:00) (version 6)
          (available_translated_languages (en vi))
          (latest_uploaded_chapter 1b11328f-2acd-4d94-9c9b-fc96f0e3533a)))
        (relationships
         (((id 76bc5e4b-1785-4ece-b3e8-2daa2ab82c9e) (type_ author))
          ((id 76bc5e4b-1785-4ece-b3e8-2daa2ab82c9e) (type_ artist))
          ((id 9b2d9729-91e3-4ffa-a223-62bfcd95676d) (type_ cover_art)))))
       ((id 728698ee-f78f-4257-8b8d-212e0b3a6037)
        (attributes
         ((title (((language en) (string "Battle Studies"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\144\227\131\136\227\131\171\227\130\185\227\130\191\227\131\135\227\130\163\227\131\188\227\130\186")))
            (((language ko)
              (string
               "\235\176\176\237\139\128 \236\138\164\237\132\176\235\148\148\236\166\136")))))
          (description
           (((language en)
             (string
               "You can\226\128\153t win through only with \226\128\156friendship\226\128\157 and \226\128\156youth\226\128\157. We stake our lives to get to Koshien!!  \
              \n  \
              \nKanou Shoutarou entered an official baseball club at one of the best powerhouse baseball schools in the country - DL Gakuen. However the discipline in the club, he admired so much, was beyond all imagination!  \
              \n  \
              \nFrom Nakibokuro - the former member of PL Gakuen\226\128\153s baseball club who played at the Koshien as the regular!"))))
          (is_locked false)
          (links
           (((provider al) (link 95443)) ((provider ap) (link battle-studies))
            ((provider bw) (link series/43397/list)) ((provider kt) (link 36282))
            ((provider mu) (link 117245))
            ((provider amz) (link https://www.amazon.co.jp/dp/B074C5VRXR))
            ((provider cdj)
             (link
              "https://www.cdjapan.co.jp/searchuni?fq.category=UD:14:03:09&q=\227\131\144\227\131\136\227\131\171\227\130\185\227\130\191\227\131\135\227\130\163\227\131\188\227\130\186&order=reldesc&opt.exclude_prx=on"))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/258550/))
            ((provider mal) (link 91156))))
          (original_language ja) (last_volume ()) (last_chapter ())
          (publication_demographic (seinen)) (status ongoing) (year (2015))
          (content_rating safe)
          (tags
           (((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-11-23T14:49:47+00:00)
          (updated_at 2024-06-09T05:58:14+00:00) (version 6)
          (available_translated_languages (en))
          (latest_uploaded_chapter 0c1005dc-8c12-46f3-bf82-9cb8b74d2910)))
        (relationships
         (((id 40eb840d-f121-41f6-b291-497f877e7585) (type_ author))
          ((id 40eb840d-f121-41f6-b291-497f877e7585) (type_ artist))
          ((id 7aba3b0c-b8cd-40eb-ad10-fb3025d3fc86) (type_ cover_art)))))
       ((id b2edff10-fe5f-4a8f-8d17-59796d3e61ec)
        (attributes
         ((title (((language en) (string "Hanma Baki (Shinsoban Release)"))))
          (alt_titles
           ((((language ja)
              (string "\231\175\132\233\166\172\229\136\131\231\137\153")))
            (((language ja-ro) (string "Hanma Baki - Son of Ogre (Shinsoban)")))
            (((language en) (string "Baki Part 3 (Shinsoban Release)")))
            (((language en)
              (string "Baki Hanma - Son of Ogre (Shinsoban Release)")))
            (((language zh) (string "\229\136\131\231\137\153\226\133\162")))
            (((language zh-ro) (string "Baki \226\133\162")))))
          (description
           (((language en)
             (string
               "The climax of the Baki series, \"Hanma Baki\", newly re-edited!\
              \n\
              \nHanma Yuujirou, the world's strongest creature, vs. Hanma Baki, the world's strongest high schooler... A spat between father and son on an unprecedented scale begins here!"))))
          (is_locked false) (links (((provider mu) (link se0wcvx))))
          (original_language ja) (last_volume (21)) (last_chapter (319))
          (publication_demographic (shounen)) (status completed) (year (2006))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 69964a64-2f90-4d33-beeb-f3ed2875eb4c)
             (attributes
              ((name (((language en) (string Sports)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b1e97889-25b4-4258-b28b-cd7f4d28ea9b)
             (attributes
              ((name (((language en) (string Philosophical)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-04-05T16:15:37+00:00)
          (updated_at 2024-08-01T19:08:11+00:00) (version 7)
          (available_translated_languages (en es-la))
          (latest_uploaded_chapter 28ee4872-679d-40fb-a640-1789756d0934)))
        (relationships
         (((id 53c89376-b005-4a99-ad46-f88fe2f9de1c) (type_ author))
          ((id 53c89376-b005-4a99-ad46-f88fe2f9de1c) (type_ artist))
          ((id bd92773a-be15-4e5f-adc7-65dd6034ac3b) (type_ cover_art))
          ((id 0b3f409c-2bda-40b7-9d1d-1039c0b7d62a) (type_ manga))
          ((id 0ee2f134-87c6-4715-b31e-b3b1344fa5ea) (type_ manga))
          ((id 5fcc1d85-86c9-4deb-a0b0-34e2176dc4bd) (type_ manga))
          ((id 1fb71175-cc34-4b7a-beb3-59546a95fcd6) (type_ creator)))))
       ((id 43df19d5-0990-46ec-9367-ea29c502e7bb)
        (attributes
         ((title (((language en) (string "Ame Demo Hare Demo"))))
          (alt_titles
           ((((language en) (string "Come Rain or Shine")))
            (((language ja)
              (string
               "\233\155\168\227\129\167\227\130\130\230\153\180\227\130\140\227\129\167\227\130\130")))))
          (description
           (((language en)
             (string
              "Country-born Mikoto and student council member Ren have always spent their time after school together. But one day, that ordinary routine suddenly comes to an end\226\128\166 With Uchouten High School as the stage, the love and youth of these impressionable young girls is about to begin!"))
            ((language pt-br)
             (string
               "Mikoto, nascida no interior, e Ren, membro do conselho estudantil, sempre passam o tempo juntas depois da escola. \
              \n  Mas um dia, essa rotina normal chega subitamente ao fim... \
              \nCom a escola Uchouten como palco, o amor e a juventude destas jovens impression\195\161veis \226\128\139\226\128\139est\195\163o prestes a come\195\167ar!"))))
          (is_locked false)
          (links
           (((provider al) (link 113658))
            ((provider ap) (link ame-demo-hare-demo))
            ((provider mu) (link 160214)) ((provider mal) (link 125760))
            ((provider raw)
             (link
              https://comic-walker.com/contents/detail/KDCW_AM05201400010000_68/))))
          (original_language ja) (last_volume (3)) (last_chapter (19))
          (publication_demographic (shounen)) (status completed) (year (2019))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-04-23T14:14:11+00:00)
          (updated_at 2024-05-25T07:55:50+00:00) (version 10)
          (available_translated_languages (en id ru pt-br it))
          (latest_uploaded_chapter fede309a-6ab6-46b7-a4db-8ca5cdf2d12c)))
        (relationships
         (((id c78d2464-10a7-4f1c-a3fd-674ac03930cb) (type_ author))
          ((id c78d2464-10a7-4f1c-a3fd-674ac03930cb) (type_ artist))
          ((id b13d927e-0ece-451f-af9d-e97a2674882c) (type_ cover_art))
          ((id efce5c3b-81ac-4cef-afee-d3730af5a392) (type_ manga)))))
       ((id 31acae21-e957-4f79-8bbd-42b5e6302365)
        (attributes
         ((title
           (((language en)
             (string "Layton Mystery Tanteisha: Katri no Nazotoki File"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\172\227\130\164\227\131\136\227\131\179\227\131\159\227\130\185\227\131\134\227\131\170\227\131\188\230\142\162\229\129\181\231\164\190 \227\130\171\227\131\136\227\131\170\227\131\188\227\129\174\227\131\138\227\130\190\227\131\136\227\130\173\228\186\139\228\187\182\231\176\191")))
            (((language en)
              (string
               "Layton Mystery Detective Agency: Katri's Puzzle Solving Files")))
            (((language fr)
              (string
               "L'agence de D\195\169tectives Layton - Katrielle et les Enqu\195\170tes Mysterieuses")))))
          (description
           (((language ja)
             (string
               "\227\128\140\226\128\149\226\128\149\231\143\190\229\174\159\227\129\175\227\129\132\227\129\164\227\130\130\231\168\128\230\156\137\227\129\170\227\130\130\227\129\174\227\129\170\227\129\174\227\129\167\227\129\153\239\188\129\227\128\141\
              \n\
              \n\227\129\138\227\129\151\227\130\131\227\130\140\227\130\132\227\130\185\227\130\164\227\131\188\227\131\132\227\129\168\229\144\140\227\129\152\227\129\143\227\130\137\227\129\132\228\184\141\230\128\157\232\173\176\227\129\170\227\131\138\227\130\190\227\129\140\229\164\167\229\165\189\227\129\141\227\129\170\229\165\179\227\129\174\229\173\144\227\131\187\227\130\171\227\131\136\227\131\170\227\131\188\227\129\140\233\150\139\227\129\132\227\129\159\227\128\140\227\131\172\227\130\164\227\131\136\227\131\179\227\131\159\227\130\185\227\131\134\227\131\170\227\131\188\230\142\162\229\129\181\231\164\190\227\128\141\227\128\130\227\129\157\227\129\147\227\129\171\227\129\175\227\131\173\227\131\179\227\131\137\227\131\179\227\129\167\232\181\183\227\129\147\227\130\139\233\155\163\228\186\139\228\187\182\227\129\140\230\172\161\227\128\133\227\129\168\230\140\129\227\129\161\232\190\188\227\129\190\227\130\140\227\130\139\227\130\136\227\129\134\227\129\171\227\129\170\227\129\163\227\129\166\226\128\166\239\188\159"))))
          (is_locked false)
          (links
           (((provider ap)
             (link layton-mystery-tanteisha-katri-no-nazotoki-file))
            ((provider bw) (link series/168042)) ((provider mu) (link fg7lkeq))
            ((provider amz) (link https://www.amazon.co.jp/dp/B07Y4438MT))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/471279/))
            ((provider mal) (link 146661))))
          (original_language ja) (last_volume (2)) (last_chapter (10))
          (publication_demographic (shoujo)) (status completed) (year (2018))
          (content_rating safe)
          (tags
           (((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-02-07T08:02:28+00:00)
          (updated_at 2024-07-30T22:04:20+00:00) (version 6)
          (available_translated_languages (en))
          (latest_uploaded_chapter d31bb2b4-21c4-4b25-8108-a08932a2bc09)))
        (relationships
         (((id c6cc603b-8c33-462d-82e6-bc1e0165c6b1) (type_ author))
          ((id c6cc603b-8c33-462d-82e6-bc1e0165c6b1) (type_ artist))
          ((id dbd610d8-84c9-46be-b091-ca149259c727) (type_ cover_art)))))
       ((id 661a792b-6729-4f54-af20-4108db55ccf4)
        (attributes
         ((title (((language en) (string "Ouran High School Host Club"))))
          (alt_titles
           ((((language vi)
              (string "6 ch\195\160ng trai v\195\160 1 c\195\180 g\195\161i")))
            (((language pt-br) (string "Col\195\169gio Ouran Host Club")))
            (((language fr)
              (string "Host Club - Le Lyc\195\169e de la s\195\169duction")))
            (((language ru)
              (string
               "\208\147\208\190\209\129\209\130\208\181\208\178\208\190\208\185 \208\186\208\187\209\131\208\177 \208\187\208\184\209\134\208\181\209\143 \208\158\209\128\208\176\208\189")))
            (((language ru)
              (string
               "\208\165\208\190\209\129\209\130-\208\186\208\187\209\131\208\177 \209\136\208\186\208\190\208\187\209\139 \208\158\209\128\208\176\208\189")))
            (((language ar)
              (string
               "\217\134\216\167\216\175\217\138 \216\167\217\132\216\182\217\138\216\167\217\129\216\169 \217\132\216\171\216\167\217\134\217\136\217\138\216\169 \216\163\217\136\216\177\216\167\217\134")))
            (((language ja)
              (string
               "\230\161\156\232\152\173\233\171\152\230\160\161\227\131\155\227\130\185\227\131\136\233\131\168")))
            (((language zh-hk)
              (string
               "\230\171\187\232\152\173\233\171\152\230\160\161\231\148\183\229\133\172\233\151\156\233\131\168")))
            (((language ko)
              (string
               "\236\152\164\235\158\128\234\179\160\234\181\144 \237\152\184\236\138\164\237\138\184\235\182\128")))))
          (description
           (((language en)
             (string
              "One day, Haruhi, a scholarship student at exclusive Ouran High School, breaks an $80,000 vase that belongs to the \"Host Club,\" a mysterious campus group consisting of six super-rich (and gorgeous) guys. To pay back the damages, she is forced to work for the club, and it's there that she discovers just how wealthy the boys are and how different they are from everybody else. [Viz]"))))
          (is_locked false)
          (links
           (((provider al) (link 30030))
            ((provider ap) (link ouran-high-school-host-club))
            ((provider bw) (link series/16901)) ((provider kt) (link 78))
            ((provider mu) (link 947))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B0756ZN94W))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEODAI-136184))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/126339))
            ((provider mal) (link 30))
            ((provider raw) (link https://manga-park.com/title/8234))
            ((provider engtl)
             (link https://www.viz.com/ouran-high-school-host-club))))
          (original_language ja) (last_volume (18)) (last_chapter (83.5))
          (publication_demographic (shoujo)) (status completed) (year (2003))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 65761a2a-415e-47f3-bef2-a9dababba7a6)
             (attributes
              ((name (((language en) (string "Reverse Harem")))) (group theme)
               (version 1))))
            ((id 9ab53f92-3eed-4e9b-903a-917c86035ee3)
             (attributes
              ((name (((language en) (string Crossdressing)))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-04-04T01:46:57+00:00)
          (updated_at 2024-05-03T20:26:16+00:00) (version 8)
          (available_translated_languages (tr en pt-br))
          (latest_uploaded_chapter a1d5a1c2-d161-48b2-8e33-4c623090f67a)))
        (relationships
         (((id d162127e-7665-4956-b756-c618ced56ef9) (type_ author))
          ((id d162127e-7665-4956-b756-c618ced56ef9) (type_ artist))
          ((id 2695ed68-5b24-4f52-a1fa-73e17447f524) (type_ cover_art))
          ((id 5b1348cf-7555-47bd-a509-dbf895b08952) (type_ manga)))))
       ((id 26c8f00a-3925-4f22-ac21-83145be2b733)
        (attributes
         ((title (((language en) (string "The Lazy Lord Masters the Sword"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\130\152\237\131\156 \234\179\181\236\158\144, \235\133\184\235\160\165 \236\178\156\236\158\172 \235\144\152\235\139\164")))
            (((language en) (string "Reformation of the Deadbeat Noble")))
            (((language en) (string "The Lazy Prince Becomes a Genius")))
            (((language ru)
              (string
               "\208\158\209\130 \208\189\208\181\209\128\208\176\208\180\208\184\208\178\208\190\208\179\208\190 \208\176\209\128\208\184\209\129\209\130\208\190\208\186\209\128\208\176\209\130\208\176 \208\180\208\190 \209\131\209\129\208\181\209\128\208\180\208\189\208\190\208\179\208\190 \208\179\208\181\208\189\208\184\209\143")))
            (((language ja)
              (string
               "\230\128\160\230\131\176\229\133\172\229\173\144\227\128\129\229\138\170\229\138\155\227\129\174\229\164\169\230\137\141\227\129\171\227\129\170\227\130\139")))
            (((language zh-hk)
              (string
               "\230\135\182\230\131\176\229\133\172\229\173\144\230\136\144\233\149\183\232\168\152")))))
          (description
           (((language en)
             (string
               "After witnessing the shocking death of his mother, young Airen Farreira uses sleep to escape his painful reality, earning him the nickname, \226\128\156the lazy lord\226\128\157. Yet, in spite of others\226\128\153 jeers and whispers, Airen has no intention of changing his ways.\
              \n\
              \nBut when he awakens one day from a dream about a mysterious swordsman, his life\226\128\153s trajectory takes a complete turn...\
              \n\
              \n---\
              \n- [Alternative English Translation (Tappytoon)](https://www.tappytoon.com/en/comics/the-lazy-lord-masters-the-sword)"))
            ((language fr)
             (string
              "Irene Perreira est un gar\195\167on qui dort pour s\226\128\153enfuir de la r\195\169alit\195\169. Les gens se moquent de lui, en l\226\128\153appelant 'bon \195\160 rien' , mais il n'a aucune envie de changer. Jusqu'\195\160 ce qu'un jour, il r\195\170va d'un \195\169p\195\169iste... C'\195\169tait un r\195\170ve d'un homme sans talent qui a entra\195\174n\195\169 ses mouvements \195\160 l'\195\169p\195\169e pendant des d\195\169cennies."))
            ((language ja)
             (string
              "\232\170\176\227\130\130\230\156\159\229\190\133\227\129\151\227\129\166\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\228\184\128\230\151\143\227\129\174\230\128\160\227\129\145\232\128\133\227\128\129\227\130\162\227\130\164\227\131\171\227\131\188\227\131\179\227\131\145\227\131\172\227\130\164\227\131\169\227\129\140\227\129\164\227\129\132\227\129\171\229\137\163\227\130\146\230\137\139\227\129\171\229\143\150\227\130\139\227\128\130"))
            ((language ko)
             (string
               "\236\158\160\236\157\132 \235\143\132\237\148\188\236\178\152\235\161\156 \236\130\188\236\149\132 \236\152\168 \236\134\140\235\133\132 \236\149\132\236\157\180\235\165\184 \237\140\140\235\160\136\236\157\180\235\157\188.\
              \n\236\130\172\235\158\140\235\147\164\236\157\128 \234\183\184\235\165\188 \235\130\152\237\131\156 \234\179\181\236\158\144\235\157\188 \235\182\128\235\165\180\235\169\176 \236\161\176\235\161\177\237\150\136\236\167\128\235\167\140 \234\183\184\235\138\148 \235\179\128\237\149\160 \236\131\157\234\176\129\236\157\180 \236\151\134\236\151\136\235\139\164.\
              \n\236\150\180\235\138\144 \235\130\160 \236\150\180\235\138\144 \234\178\128\236\130\172\236\157\152 \234\191\136\236\157\132 \234\190\184\234\184\176 \236\160\132\234\185\140\236\167\128\235\138\148...\
              \n\234\183\184\234\178\131\236\157\128 \234\183\184\236\160\128 \235\172\181\235\172\181\237\158\136 \236\136\152\236\139\173 \235\133\132\234\176\132 \234\178\128\236\157\132 \237\156\152\235\145\144\235\165\180\235\169\176 \235\139\168\235\160\168\237\149\152\235\138\148 \237\149\156 \236\158\172\235\138\165 \236\151\134\235\138\148 \236\130\172\235\130\180\236\151\144 \234\180\128\237\149\156 \234\191\136\236\157\180\236\151\136\235\139\164."))
            ((language ru)
             (string
               "\208\174\208\189\209\139\208\185 \208\144\208\185\209\128\208\190\208\189 \208\159\208\176\209\128\208\181\208\185\209\128\208\176 \209\129\208\180\208\181\208\187\208\176\208\187 \209\129\208\178\208\190\208\185 \208\188\208\184\209\128 \208\179\209\128\209\145\208\183 \209\131\208\177\208\181\208\182\208\184\209\137\208\181\208\188 \208\190\209\130 \208\177\208\190\208\187\208\184 \209\130\209\128\208\176\208\179\208\181\208\180\208\184\208\184 \208\191\209\128\208\190\209\136\208\187\208\190\208\179\208\190. \208\155\209\142\208\180\208\181\208\185 \208\183\208\176\208\177\208\176\208\178\208\187\209\143\208\187\208\190 \209\141\209\130\208\190, \208\190\208\189\208\184 \208\191\208\190\208\180\208\189\209\143\208\187\208\184 \208\181\208\179\208\190 \208\189\208\176 \209\129\208\188\208\181\209\133 \208\184 \208\191\209\128\208\190\208\183\208\178\208\176\208\187\208\184 \208\189\208\181\209\128\208\176\208\180\208\184\208\178\209\139\208\188 \208\176\209\128\208\184\209\129\209\130\208\190\208\186\209\128\208\176\209\130\208\190\208\188. \208\158\208\180\208\189\208\176\208\186\208\190 \208\191\208\190\208\180\208\190\208\177\208\189\208\190\208\181 \208\190\209\130\208\189\208\190\209\136\208\181\208\189\208\184\208\181 \208\189\208\184\208\186\208\176\208\186 \208\189\208\181 \208\183\208\176\208\180\208\181\208\178\208\176\208\187\208\190 \208\189\208\176\209\136\208\181\208\179\208\190 \208\179\208\181\209\128\208\190\209\143 \208\189\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190\209\129\209\130\209\140\209\142 \208\188\208\181\208\189\209\143\209\130\209\140\209\129\209\143.\
              \n\208\162\208\176\208\186 \208\177\209\139 \208\178\209\129\209\145 \208\184 \208\191\209\128\208\190\208\180\208\190\208\187\208\182\208\176\208\187\208\190\209\129\209\140, \208\189\208\181 \208\191\208\190\208\178\209\129\209\130\209\128\208\181\209\135\208\176\208\185 \208\190\208\189 \208\178\208\190 \209\129\208\189\208\181 \208\177\208\181\208\183\208\180\208\176\209\128\208\189\208\190\208\179\208\190 \209\142\208\189\208\190\209\136\209\131, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \209\130\209\128\208\184\208\180\209\134\208\176\209\130\209\140 \209\129\208\181\208\188\209\140 \208\187\208\181\209\130 \208\191\208\190\208\180\209\128\209\143\208\180 \208\190\208\177\209\131\209\135\208\176\208\187\209\129\209\143 \208\178\208\187\208\176\208\180\208\181\208\189\208\184\209\142 \208\188\208\181\209\135\208\190\208\188, \208\180\208\176 \209\130\208\176\208\186 \208\184 \209\131\208\188\208\181\209\128 \209\129 \208\190\209\128\209\131\208\182\208\184\208\181\208\188 \208\178 \209\128\209\131\208\186\208\176\209\133."))
            ((language zh-hk)
             (string
              "\229\174\182\230\151\143\228\184\173\231\154\132\230\135\182\230\131\176\232\159\178\231\181\130\230\150\188\230\139\191\232\181\183\228\186\134\229\138\141\239\188\129\229\176\135\231\157\161\232\166\186\232\166\150\231\130\186\233\128\131\233\129\191\230\150\185\230\179\149\231\154\132\229\176\145\229\185\180\232\137\190\229\128\171\239\188\142\229\184\149\233\155\183\230\139\137\239\188\140\229\141\179\228\189\191\228\186\186\229\128\145\233\131\189\229\152\178\231\172\145\228\187\150\231\130\186\230\135\182\230\131\176\229\133\172\229\173\144\239\188\140\228\187\150\228\190\157\231\132\182\228\184\141\233\161\152\230\148\185\232\174\138\239\188\140\231\155\180\229\136\176\230\156\137\229\164\169\228\187\150\229\164\162\232\166\139\228\186\134\228\184\128\228\189\141\230\149\184\229\141\129\229\185\180\233\150\147\228\184\141\230\150\183\230\143\174\229\138\141\233\141\155\231\183\180\231\154\132\231\132\161\230\137\141\231\148\183\229\173\144..."))))
          (is_locked false)
          (links
           (((provider al) (link 135325))
            ((provider kt) (link reformation-of-the-deadbeat-noble))
            ((provider mu) (link 182180))
            ((provider nu) (link reformation-of-the-deadbeat-noble))
            ((provider mal) (link 146827))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=772853))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/fantasy/the-lazy-lord-masters-the-sword/list?title_no=3349))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-10-25T20:08:12+00:00)
          (updated_at 2024-07-31T23:37:02+00:00) (version 28)
          (available_translated_languages (es-la fr pt-br en))
          (latest_uploaded_chapter 7f9d3064-82d6-4649-964a-b1e2200a11e3)))
        (relationships
         (((id 1e55f58a-4a99-4ff7-8a04-a1322756d7b6) (type_ author))
          ((id 68a3d559-06dd-4f0b-be70-096bbd571117) (type_ author))
          ((id 8ea9cbd2-f76a-4f14-876b-08cd4f4a31ad) (type_ artist))
          ((id bf561f3e-0d7b-45f9-a39a-a15aae988a00) (type_ cover_art))
          ((id 9a81fd51-370a-42a7-a5c5-5b5d72a3dd5c) (type_ creator)))))
       ((id 0681ae41-df2e-4ffa-8063-c8d18877853c)
        (attributes
         ((title
           (((language en) (string "A Former Delinquent Girl Falls in Love"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\133\131\227\131\164\227\131\179\229\168\152\227\128\129\230\129\139\227\130\146\227\129\153\227\130\139")))
            (((language ja-ro) (string "Motoyan Musume, Koi o Suru")))))
          (description
           (((language en)
             (string
              "Spin-off/Spiritual Sequel of the authors other work \"The Mentor and the New Employee Who are Getting More and More Into Each Other\"; with this story focusing on the mask wearing former delinquent and her budding romance with the little brother of the Female MC of the previous work."))))
          (is_locked false)
          (links
           (((provider al) (link 179005))
            ((provider raw) (link https://x.com/katomayumi))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year ())
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 92d6d951-ca5e-429c-ac78-451071cbf064)
             (attributes
              ((name (((language en) (string "Office Workers")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-05-27T10:08:44+00:00)
          (updated_at 2024-07-05T23:31:05+00:00) (version 4)
          (available_translated_languages (en))
          (latest_uploaded_chapter 1cf4cba0-716e-478b-861b-a1437cacc32a)))
        (relationships
         (((id 6b6ef4df-b39b-4549-8d03-464856b9d489) (type_ author))
          ((id 6b6ef4df-b39b-4549-8d03-464856b9d489) (type_ artist))
          ((id d40421cd-3fe0-47fd-843d-39bcbd5a605a) (type_ cover_art))
          ((id a79e2584-c08e-4bc8-9293-8a441b6802d6) (type_ manga))
          ((id e71bf799-08e8-4ede-94cd-745a717f72e6) (type_ creator)))))
       ((id 440f8d91-b032-4bf3-8dba-2cde482fbc53)
        (attributes
         ((title
           (((language en) (string "Journey to Seek Past Reincarnations"))))
          (alt_titles
           ((((language en) (string "A Journey to the Past")))
            (((language zh-ro) (string XunZhaoQianShiZhiLv)))
            (((language zh)
              (string
               "\229\175\187\230\137\190\229\137\141\228\184\150\228\185\139\230\151\133")))
            (((language zh-ro) (string "Xun Zhao Qian Shi Zhi Lu")))))
          (description
           (((language en)
             (string
              "The story is about a little Master, Gong Yao Ying, in order to accomplish the assigned tasks, she travels across the different periods. The stories are created after meeting with the famous historical figures."))))
          (is_locked false)
          (links
           (((provider ap) (link the-journey)) ((provider kt) (link 47088))
            ((provider mu) (link 134728))
            ((provider nu) (link journey-to-seek-past-reincarnations))
            ((provider mal) (link 103280))
            ((provider raw) (link https://ac.qq.com/Comic/comicInfo/id/550704))
            ((provider engtl)
             (link https://h5.mangatoon.mobi/contents/detail/2093))))
          (original_language zh) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year ())
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 292e862b-2d17-4062-90a2-0356caa4ae27)
             (attributes
              ((name (((language en) (string "Time Travel")))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-01-11T02:53:53+00:00)
          (updated_at 2024-05-21T23:33:59+00:00) (version 5)
          (available_translated_languages (en))
          (latest_uploaded_chapter cc310f81-51ee-4b78-bb4e-9abac734e17c)))
        (relationships
         (((id 0b7b70db-9af1-4b52-a1ae-9931daf4b1e3) (type_ author))
          ((id 566f01de-6433-4fff-915c-e5e8ba7b982d) (type_ artist))
          ((id fa0b433c-71e4-4f13-bd1b-334a7b05b664) (type_ cover_art)))))
       ((id 8f9f282b-c0a8-4890-9098-3e080b3c36da)
        (attributes
         ((title
           (((language en) (string "Kusobitch na Gal Ane o Wakaraseru Hanashi"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\148\159\230\132\143\230\176\151\227\129\170\227\130\174\227\131\163\227\131\171\229\167\137\227\130\146\232\167\163\227\130\137\227\129\155\227\130\139\232\169\177")))
            (((language ja-ro)
              (string "Kusobitch na Gal Ane wo Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Kusobicchi na Gyaru Ane o Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Kusobicchi na Gyaru Ane wo Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Namaiki na Gal Ane o Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Namaiki na Gal Ane wo Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Namaiki na Gyaru Ane o Wakaraseru Hanashi")))
            (((language ja-ro)
              (string "Namaiki na Gyaru Ane wo Wakaraseru Hanashi")))
            (((language en)
              (string "The Story of Making My Bitchy Gal Sister Understand")))
            (((language en)
              (string "The Story of Making My Cheeky Gal Sister Understand")))
            (((language en)
              (string "The Story of Making My Cheeky Gyaru Sister Understand")))))
          (description
           (((language en)
             (string
              "Every time she opens her mouth, it's nothing but abusive language, and her problematic behavior never stops. The protagonist has had enough and sets a \226\128\156plan\226\128\157 into motion\226\128\166??!"))
            ((language ja)
             (string
              "\229\143\163\227\130\146\233\150\139\227\129\145\227\129\176\230\154\180\232\168\128\227\129\176\227\129\139\227\130\138\227\129\167\227\128\129\229\149\143\233\161\140\232\161\140\229\139\149\227\129\140\231\181\182\227\129\136\227\129\170\227\129\132\229\167\137\227\128\130 \229\189\188\229\165\179\227\129\171\231\151\186\227\130\140\227\130\146\229\136\135\227\130\137\227\129\151\227\128\129\228\184\187\228\186\186\229\133\172\227\129\140\232\184\143\227\129\191\229\135\186\227\129\151\227\129\159\226\128\156\232\168\136\231\148\187\226\128\157\227\129\168\227\129\175---??!"))
            ((language es-la)
             (string
               "Su hermana siempre dice cosas hirientes y cuyos comportamientos problem\195\161ticos nunca cesan, el protagonista, cansado de ella, da un paso adelante con un \"plan\"\
              \n\194\191Cu\195\161l ser\195\161...?"))))
          (is_locked false)
          (links
           (((provider al) (link 179506)) ((provider mu) (link o341cqq))
            ((provider mal) (link 172129))
            ((provider raw)
             (link https://tonarinoyj.jp/episode/2550689798814983672))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2024))
          (content_rating suggestive)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-12T14:45:50+00:00)
          (updated_at 2024-07-17T03:26:35+00:00) (version 16)
          (available_translated_languages (es-la en vi pt-br))
          (latest_uploaded_chapter 902d7530-d232-447f-8a9c-74bf1fdff527)))
        (relationships
         (((id 5b65c885-8ce1-42c9-96fd-1cdcf89c8749) (type_ author))
          ((id 5b65c885-8ce1-42c9-96fd-1cdcf89c8749) (type_ artist))
          ((id 999db045-ef68-408b-bd5d-19a9304f619d) (type_ cover_art))
          ((id 30d044df-e502-46e5-94ef-aae0e9a2cb0d) (type_ manga))
          ((id e0df27d4-97ba-4dca-ab26-df70b70d3241) (type_ manga))
          ((id 29069e0a-5525-468c-a3d6-b138bf16afba) (type_ creator)))))
       ((id 0dfc179b-26e6-469e-a2c2-01ad3185e607)
        (attributes
         ((title (((language en) (string "Kyou, Koshiba Aoi ni Aetara."))))
          (alt_titles
           ((((language en) (string "Chasing After Aoi Koshiba")))
            (((language en) (string "If I Could See Koshiba Aoi Today.")))
            (((language zh)
              (string
               "\228\187\138\230\151\165\239\188\140\232\139\165\230\152\175\232\131\189\228\184\142\229\176\143\230\159\180\232\145\181\231\155\184\233\129\135")))
            (((language ja)
              (string
               "\228\187\138\230\151\165\227\128\129\229\176\143\230\159\180\232\145\181\227\129\171\228\188\154\227\129\136\227\129\159\227\130\137\227\128\130")))))
          (description
           (((language en)
             (string
              "The latest manga by the creator of Masamune-Kun's Revenge. The story of Kyo, Koshiba Aoi ni Aetera follows Sahoko, a girl who values what others think of her, and Aoi, a girl who is able to let out her true self without caring about what others think. To get closer to Aoi whose candid air appeared shining, the action that Sahoko takes to get closer is\226\128\166 a kiss."))
            ((language pt)
             (string
              "A hist\195\179ria segue Sahoko, uma t\195\173pica garota do colegial, que conhece Aoi, uma t\195\173pica garota espont\195\162nea do ensino m\195\169dio. A hist\195\179ria se desenvolve \195\160 medida que elas passam sua fugaz juventude no ensino m\195\169dio. Mesmo ap\195\179s se tornarem adultas, seus sentimentos n\195\163o desapareceram e continuam brilhando como nunca."))))
          (is_locked false)
          (links
           (((provider al) (link 104662))
            ((provider ap) (link kyou-koshiba-aoi-ni-aetara))
            ((provider bw) (link series/213649)) ((provider kt) (link 57820))
            ((provider mu) (link 154312))
            ((provider amz) (link https://www.amazon.co.jp/dp/B08C5H84SV))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/552607/))
            ((provider mal) (link 120947))
            ((provider raw)
             (link
              https://pocket.shonenmagazine.com/episode/10834108156763169577))
            ((provider engtl)
             (link https://kodansha.us/series/chasing-after-aoi-koshiba/))))
          (original_language ja) (last_volume (4)) (last_chapter (33))
          (publication_demographic (shounen)) (status completed) (year (2019))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-09-07T04:55:17+00:00)
          (updated_at 2023-06-11T18:55:18+00:00) (version 7)
          (available_translated_languages (pt-br es ru en fr))
          (latest_uploaded_chapter f33fc59b-1a51-4bd3-9663-f174baaf5663)))
        (relationships
         (((id 17a9f7bb-8288-49f1-8ada-c5174d0c0a7c) (type_ author))
          ((id 99fa07d1-863a-43ab-af81-9cf874ec83ea) (type_ artist))
          ((id 79f4ebba-698e-4a92-8b94-15a90e8900e1) (type_ cover_art)))))
       ((id a98d039a-da7f-46ec-aef4-f4bd03d0d925)
        (attributes
         ((title
           (((language en) (string "The Hero Became the Duke's Eldest Son"))))
          (alt_titles
           ((((language ko)
              (string
               "\236\152\129\236\155\133, \234\179\181\236\158\145\234\176\128 \236\158\165\235\130\168 \235\144\152\235\139\164")))))
          (description
           (((language en)
             (string
               "Aden Albireo, the \"Dragon Slayer King\", was a hero who saved the world by eliminating the Berserker and the Underlord. However, he was betrayed by those who whispered friendship to him, and met his death...\
              \n\
              \n\"I didn't know I would be resurrected like this?!\"\
              \n\
              \n15 years before the Underlord's resurrection, 'Aden Albireo' reincarnated into the body of the eldest son of a unheard-of duke's family, 'Aden Remes'! And...\
              \n\
              \n\"It's been a while, Dragon Slayer King!\"\
              \n\
              \n\"The Underlord I thought I had defeated is inside my soul?!\"\
              \n\
              \nWill Aden be able to end his uncomfortable cohabitation(?) with the Underlord and prevent his resurrection?"))
            ((language ko)
             (string
               "\236\149\132\235\141\180 \236\149\140\235\185\132\235\160\136\236\152\164, \234\183\184\235\138\148 \234\180\145\235\163\161\234\179\188 \236\167\128\237\149\152 \234\181\176\236\163\188, \236\150\184\235\141\148\235\161\156\235\147\156\235\165\188 \236\151\134\236\149\160\234\179\160 \236\132\184\236\131\129\236\157\132 \234\181\172\237\149\156 \236\152\129\236\155\133, \"\236\154\169\236\130\180\236\153\149\"\236\157\180\235\157\188 \235\182\136\235\160\184\235\139\164. \234\183\184\235\159\172\235\130\152 \236\154\176\236\160\149\236\157\132 \236\134\141\236\130\173\236\152\128\235\141\152 \236\157\180\235\147\164\236\151\144\234\178\140 \235\176\176\236\139\160\235\139\185\237\149\180, \236\163\189\236\157\140\236\157\132 \235\167\158\234\178\140 \235\144\152\235\138\148\235\141\176...\
              \n\
              \n\"\236\157\180\235\159\176 \236\139\157\236\156\188\235\161\156 \235\144\152\236\130\180\236\149\132\235\130\160 \236\164\132\236\157\128 \235\170\176\235\158\144\235\138\148\235\141\176?\"\
              \n\
              \n\236\150\184\235\141\148\235\161\156\235\147\156 \235\182\128\237\153\156 15\235\133\132 \236\160\132, \235\147\163\235\143\132 \235\179\180\235\143\132 \235\170\187\237\149\156 \234\179\181\236\158\145\234\176\128\236\157\152 \235\167\157\235\130\152\235\139\136 \236\158\165\235\130\168, '\236\149\132\235\141\180 \235\160\136\235\169\148\236\138\164'\236\157\152 \235\170\184\236\156\188\235\161\156 \237\154\140\234\183\128\237\149\156 '\236\149\132\235\141\180 \236\149\140\235\185\132\235\160\136\236\152\164'! \234\178\140\235\139\164\234\176\128\226\128\166\
              \n\
              \n\"\236\152\164\235\158\156\235\167\140\236\157\180\234\181\172\235\130\152, \236\154\169\236\130\180\236\153\149\236\157\180\236\151\172!\"\
              \n\
              \n\237\149\180\236\185\152\236\154\180 \236\164\132 \236\149\140\236\149\152\235\141\152 \236\150\184\235\141\148\235\161\156\235\147\156\234\176\128 \235\130\180 \236\152\129\237\152\188 \236\149\136\236\151\144 \236\158\136\235\139\164\234\179\160?!\
              \n\
              \n\234\179\188\236\151\176 \236\149\132\235\141\180\236\157\128 \236\150\184\235\141\148\235\161\156\235\147\156\236\153\128\236\157\152 \235\182\136\237\142\184\237\149\156 \235\143\153\234\177\176(?)\235\165\188 \235\129\157\235\130\180\234\179\160 \234\183\184\236\157\152 \235\182\128\237\153\156\236\157\132 \235\167\137\236\149\132\235\130\188 \236\136\152 \236\158\136\236\157\132 \234\178\131\236\157\184\234\176\128!"))))
          (is_locked false)
          (links
           (((provider mu) (link 66518zu))
            ((provider raw) (link https://page.kakao.com/content/64385699))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-13T00:35:05+00:00)
          (updated_at 2024-08-01T04:49:27+00:00) (version 5)
          (available_translated_languages (en pl))
          (latest_uploaded_chapter 4671c388-d21a-4013-863f-97e0fa32c36d)))
        (relationships
         (((id 5209f518-467d-481c-b094-3d4455dfc156) (type_ author))
          ((id afb10fa2-28a9-4bc4-a70a-f3d0342b6552) (type_ author))
          ((id e79986ee-acf0-4489-9398-9b653b578883) (type_ artist))
          ((id d1af3095-39a8-459f-a878-e347706249be) (type_ cover_art))
          ((id 8cf0de3c-daa8-443c-b6f8-c2cdf4dde1e4) (type_ creator)))))
       ((id 418791c0-35cf-4f87-936b-acd9cddf0989)
        (attributes
         ((title (((language en) (string "Kaoru Hana wa Rin to Saku"))))
          (alt_titles
           ((((language ja)
              (string
               "\232\150\171\227\130\139\232\138\177\227\129\175\229\135\155\227\129\168\229\146\178\227\129\143")))
            (((language es-la) (string "La fragante flor florece con dignidad")))
            (((language id) (string "Kusuma Harum Mekar dengan Anggun")))
            (((language ja-ro) (string "Kaoru Hana wa Rin to Saku")))
            (((language ru)
              (string
               "\208\145\208\187\208\176\208\179\208\190\209\131\209\133\208\176\209\142\209\137\208\184\208\185 \209\134\208\178\208\181\209\130\208\190\208\186 \209\128\208\176\209\129\209\134\208\178\208\181\209\130\208\176\208\181\209\130 \209\129 \208\180\208\190\209\129\209\130\208\190\208\184\208\189\209\129\209\130\208\178\208\190\208\188")))
            (((language ru)
              (string
               "\208\158\209\135\208\176\209\128\208\190\208\178\208\176\209\130\208\181\208\187\209\140\208\189\209\139\208\185 \209\134\208\178\208\181\209\130\208\190\208\186 \209\128\208\176\209\129\209\134\208\178\208\181\209\130\208\176\208\181\209\130 \209\129 \208\180\208\190\209\129\209\130\208\190\208\184\208\189\209\129\209\130\208\178\208\190\208\188")))
            (((language th)
              (string
               "\224\184\148\224\184\173\224\184\129\224\184\163\224\184\177\224\184\129\224\184\156\224\184\165\224\184\180\224\184\154\224\184\178\224\184\153\224\184\151\224\184\181\224\185\136\224\184\129\224\184\165\224\184\178\224\184\135\224\185\131\224\184\136")))
            (((language ja) (string "#\232\150\171\227\130\139\232\138\177")))
            (((language zh-hk)
              (string
               "\232\150\176\233\166\153\232\138\177\230\156\181\229\135\155\231\132\182\231\182\187\230\148\190")))
            (((language fr)
              (string "La fleur emparfum\195\169e \195\169clot dignement")))
            (((language ja-ro) (string "Kaoru Hana Wa Rin To Saku")))
            (((language es) (string "La nobleza de las flores")))
            (((language en) (string "The Fragrant Flower Blooms With Dignity")))))
          (description
           (((language en)
             (string
               "In a certain place, there are two neighboring high schools. Chidori High School, a bottom-feeder boys' school where idiots gather, and Kikyo Girls' School, a well-established girls' school. Rintaro Tsumugi, a strong and quiet second year student at Chidori High School, meets Kaoruko Waguri, a girl who comes as a customer while helping out at his family's cake shop. Rintaro feels comfortable spending time with Kaoruko, but she is a student at Kikyo Girls, a neighboring school that thoroughly dislikes Chidori High. This is the story of two people who are so close and yet so far apart.\
              \n___\
              \n**Links:**\
              \n- [Official Twitter (JP)](https://twitter.com/kaoruhana_mp)\
              \n- Official English - [K MANGA](https://kmanga.kodansha.com/title/10023/episode/320130) (U.S. Only | Simulpub)"))
            ((language fr)
             (string
               "Bien qu'ils soient mitoyens, le lyc\195\169e public Chidori pour gar\195\167ons et le prestigieux lyc\195\169e priv\195\169 pour filles Kiky\197\141 continuent \195\160 entretenir leur tradition de se ha\195\175r mutuellement au plus haut point. Tsumugi Rintar\197\141 pensait la m\195\170me chose, jusqu'\195\160 ce qu'il fasse la rencontre de Wakuri Kaoruko, \195\169l\195\168ve de Chidori et habitu\195\169e de la p\195\162tisserie tenue par ses parents. Malgr\195\169 la d\195\169sapprobation et les pr\195\169jug\195\169s de leurs camarades respectifs, Rintar\197\141 et Kaoruko vont petit \195\160 petit se rapprocher, et tant pis ce qu'en pensent les autres !\
              \n\
              \n___\
              \n**Liens :**\
              \n- [Official Twitter (JP)](https://twitter.com/kaoruhana_mp)\
              \n- Official English - [K MANGA](https://kmanga.kodansha.com/title/10023/episode/320130) (U.S. Only | Simulpub)"))
            ((language ja)
             (string
               "\227\129\168\227\129\130\227\130\139\229\160\180\230\137\128\227\129\171\227\128\129\233\154\163\230\142\165\227\129\153\227\130\139\227\129\181\227\129\159\227\129\164\227\129\174\233\171\152\230\160\161\227\129\140\227\129\130\227\130\139\227\128\130\227\131\144\227\130\171\227\129\140\233\155\134\227\129\190\227\130\139\229\186\149\232\190\186\231\148\183\229\173\144\230\160\161\227\131\187\229\141\131\233\179\165\233\171\152\230\160\161\227\129\168\227\128\129\231\148\177\231\183\146\230\173\163\227\129\151\227\129\141\227\129\138\229\172\162\230\167\152\230\160\161\227\131\187\230\161\148\230\162\151\229\165\179\229\173\144\227\128\130\227\129\157\227\129\147\227\129\171\233\128\154\227\129\134\231\180\172 \229\135\155\229\164\170\233\131\142\227\129\168\227\128\129\229\146\140\230\160\151\232\150\171\229\173\144\227\129\140\229\135\186\228\188\154\227\129\132\226\128\166\227\128\130\
              \n\226\128\156\232\191\145\227\129\143\227\129\166\233\129\160\227\129\132\226\128\157\228\186\140\228\186\186\227\129\140\231\185\148\227\130\138\227\129\170\227\129\153\227\128\129\233\174\174\227\130\132\227\129\139\227\129\170\233\157\146\230\152\165\229\189\169\227\130\139\229\173\166\229\156\146\231\137\169\232\170\158!!\
              \n\
              \n\227\129\168\227\129\130\227\130\139\229\160\180\230\137\128\227\129\171\227\128\129\233\154\163\230\142\165\227\129\153\227\130\139\227\129\181\227\129\159\227\129\164\227\129\174\233\171\152\230\160\161\227\129\140\227\129\130\227\130\139\227\128\130\227\131\144\227\130\171\227\129\140\233\155\134\227\129\190\227\130\139\229\186\149\232\190\186\231\148\183\229\173\144\230\160\161\227\131\187\229\141\131\233\179\165\233\171\152\230\160\161\227\129\168\227\128\129\231\148\177\231\183\146\230\173\163\227\129\151\227\129\141\227\129\138\229\172\162\230\167\152\230\160\161\227\131\187\230\161\148\230\162\151\229\165\179\229\173\144\227\128\130\229\188\183\233\157\162\227\129\167\231\137\169\233\157\153\227\129\139\227\129\170\229\141\131\233\179\165\233\171\152\230\160\1612\229\185\180\227\131\187\231\180\172 \229\135\155\229\164\170\233\131\142\227\129\175\227\128\129\229\174\159\229\174\182\227\129\174\227\130\177\227\131\188\227\130\173\229\177\139\227\129\174\230\137\139\228\188\157\227\129\132\228\184\173\227\129\171\227\129\138\229\174\162\227\129\168\227\129\151\227\129\166\230\157\165\227\129\166\227\129\132\227\129\159\229\176\145\229\165\179\227\131\187\229\146\140\230\160\151\232\150\171\229\173\144\227\129\168\229\135\186\228\188\154\227\129\134\227\128\130\232\150\171\229\173\144\227\129\168\227\129\174\230\153\130\233\150\147\227\130\146\229\191\131\229\156\176\227\130\136\227\129\143\230\132\159\227\129\152\227\130\139\229\135\155\229\164\170\233\131\142\227\129\160\227\129\163\227\129\159\227\129\140\227\128\129\229\189\188\229\165\179\227\129\175\229\190\185\229\186\149\227\129\151\227\129\166\229\141\131\233\179\165\227\130\146\229\171\140\227\129\134\230\161\148\230\162\151\229\165\179\229\173\144\227\129\174\231\148\159\229\190\146\227\129\167\226\128\166\226\128\166!?\
              \n\
              \n___\
              \n- [Twitter](https://twitter.com/kaoruhana_mp)"))
            ((language es-la)
             (string
               "En cierto lugar, hay dos escuelas secundarias vecinas. El instituto Chidori, una escuela masculina de mala muerte en la que se re\195\186nen los idiotas, y el instituto femenino Kikyo, una escuela femenina bien establecida. Rintaro Tsumugi, un fuerte y tranquilo estudiante de segundo curso del instituto Chidori, conoce a Kaoruko Wakuri, una chica que llega como cliente mientras ayuda en la pasteler\195\173a de su familia. Rintaro se siente c\195\179modo pasando tiempo con Kaoruko, pero ella es alumna de las chicas de Kikyo, una escuela vecina a la que no le gusta nada el instituto Chidori. Esta es la historia de dos personas que est\195\161n tan cerca y a la vez tan lejos.\
              \n___\
              \n- [Twitter Oficial (JA)](https://twitter.com/kaoruhana_mp)"))
            ((language pt-br)
             (string
              "Em um lugar espec\195\173fico, existem duas escolas secund\195\161rias vizinhas. A Escola Secund\195\161ria Chidori, uma escola para rapazes considerada de n\195\173vel inferior, onde se re\195\186nem estudantes menos dedicados, e a Escola para Meninas Kikyo, uma institui\195\167\195\163o bem estabelecida. Rintaro Tsumugi, um estudante do segundo ano forte e tranquilo da Escola Secund\195\161ria Chidori, conhece Kaoruko Waguri, uma garota que aparece como cliente enquanto ajuda na confeitaria da sua fam\195\173lia. Rintaro se sente \195\160 vontade passando tempo com Kaoruko, mas ela \195\169 uma aluna da Escola para Meninas Kikyo, uma escola vizinha que tem avers\195\163o \195\160 Escola Secund\195\161ria Chidori. Esta \195\169 a hist\195\179ria de duas pessoas que est\195\163o t\195\163o pr\195\179ximas e, ao mesmo tempo, t\195\163o distantes."))))
          (is_locked false)
          (links
           (((provider al) (link 140475))
            ((provider ap) (link kaoru-hana-wa-rin-to-saku))
            ((provider bw) (link series/345527))
            ((provider kt) (link kaoru-hana-wa-rin-to-saku))
            ((provider mu) (link 191422))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B09YHGZTNQ))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2707387))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/685712))
            ((provider mal) (link 144267))
            ((provider raw)
             (link https://pocket.shonenmagazine.com/episode/3269754496548746310))
            ((provider engtl)
             (link
              https://kodansha.us/series/the-fragrant-flower-blooms-with-dignity/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-11-10T17:30:57+00:00)
          (updated_at 2024-06-28T11:16:12+00:00) (version 58)
          (available_translated_languages (pt-br ru en fr vi id es-la ar he))
          (latest_uploaded_chapter 6632082d-03ac-436f-92c0-271cb99cb803)))
        (relationships
         (((id 3d3ec54f-2eb7-4fb7-b2eb-0372c9f1b92e) (type_ author))
          ((id 3d3ec54f-2eb7-4fb7-b2eb-0372c9f1b92e) (type_ artist))
          ((id 59c6d9ae-ecf0-4a20-97c1-0505dd6ce9b9) (type_ cover_art))
          ((id 395fa758-f9b5-4dbd-ae30-69a1fe726841) (type_ creator)))))
       ((id 163306e6-1700-42a4-882f-26db124cbec2)
        (attributes
         ((title (((language en) (string "Hero Killer"))))
          (alt_titles
           ((((language ko)
              (string
               "\237\158\136\236\150\180\235\161\156 \237\130\172\235\159\172")))
            (((language de) (string "Heldent\195\182ter")))
            (((language fr) (string "La tueuse d'h\195\169ros")))
            (((language es) (string "La asesina de h\195\169roes")))
            (((language pl) (string "Zab\195\179jca bohater\195\179w")))
            (((language uk)
              (string
               "\208\146\208\177\208\184\208\178\209\134\209\143 \208\179\208\181\209\128\208\190\209\151\208\178")))
            (((language ru)
              (string
               "\208\163\208\177\208\184\208\185\209\134\208\176 \208\179\208\181\209\128\208\190\208\181\208\178")))
            (((language zh-hk)
              (string "\232\139\177\233\155\132\230\174\186\230\137\139")))
            (((language fr) (string "Tueur des h\195\169ros")))))
          (description
           (((language de)
             (string
               "Alle Schurken sind besiegt und die Helden haben die Welt gerettet. Das klingt erst einmal gut, doch sind wirklich alle Helden gut? Nicht alle, die sich \226\128\158Helden\226\128\156 nennen, verhalten sich auch so: Eine Frau, deren Schwester von einem dieser \226\128\158Helden\226\128\156 get\195\182tet wurde, begibt sich auf die Mission, den T\195\164ter zu finden, und wird zum \226\128\158Hero-Killer\226\128\156, der jede Nacht Jagd auf korrupte Helden macht. Kann sie es schaffen, ihre Schwester zu r\195\164chen und die Welt zu einem besseren Ort zu machen?\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [German / Deutsch](https://www.webtoons.com/de/action/hero-killer/list?title_no=3403)"))
            ((language en)
             (string
               "The world is in constant turmoil, with constant wars breaking out between Heroes and Villains.\
              \n\
              \nGifted with supernatural abilities, one lone girl sets out on a bloody path for revenge against the injustices of the world she lives in. With the constant clashes between titans, no one is safe.\
              \n\
              \nIf no one is willing to protect the innocent, who are the real heroes, and who are the real villains? What truly separates one from the other?"))
            ((language es)
             (string
               "El mundo est\195\161 en constante agitaci\195\179n, con guerras constantes desat\195\161ndose entre h\195\169roes y villanos. Dotada con habilidades extraordinarias, una chica solitaria recorre un camino sangriento de venganza contra las injusticias del mundo en el que vive. Con los enfrentamientos constantes entre los titanes, nadie est\195\161 a salvo. Si nadie est\195\161 dispuesto a proteger a los inocentes, \194\191qui\195\169nes son los verdaderos h\195\169roes? \194\191Qui\195\169nes son los verdaderos villanos? \194\191Qu\195\169 es lo que realmente separa a los unos de los otros?\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [Spanish / Espa\195\177ol](https://www.webtoons.com/es/action/hero-killer/list?title_no=3422)"))
            ((language fr)
             (string
               "Dot\195\169e de capacit\195\169s surnaturelles, Ehwa, une jeune fille solitaire, s'engage sur un chemin sanglant afin de se venger pour sa soeur qui a \195\169t\195\169 tu\195\169e par un \"h\195\169ros\". Elle ne sait toujours pas qui de ces \"h\195\169ros\" est responsable de sa mort, mais cela lui importe peu... car il suffit de les massacrer tous.\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/action/hero-killer/list?title_no=3151)"))
            ((language hu)
             (string
              "A vil\195\161g \195\161lland\195\179 kavarod\195\161sban van, \195\161lland\195\179 h\195\161bor\195\186k t\195\182rnek ki a H\197\145s\195\182k \195\169s a Gonoszok k\195\182z\195\182tt. Term\195\169szetf\195\182l\195\182tti k\195\169pess\195\169gekkel felruh\195\161zva egy mag\195\161nyos l\195\161ny v\195\169res \195\186tra indul, hogy bossz\195\186t \195\161lljon a vil\195\161g igazs\195\161gtalans\195\161gai ellen, amelyben \195\169l. Ha senki sem hajland\195\179 megv\195\169deni az \195\161rtatlanokat, kik az igazi h\197\145s\195\182k \195\169s kik az igazi gonosztev\197\145k? Mi v\195\161lasztja el igaz\195\161n a m\195\161sikat?"))
            ((language id)
             (string
               "Bertahun-tahun yang lalu, Ehwa kehilangan saudara perempuan karena seorang hero yang tidak dikenal. Sampai sekarang, tidak ada yang tahu siapa pembunuh saudara perempuan Ehwa. Tetapi hal itu tidak masalah baginya, karena dia akan menghabisi semua hero yang ada di dunia.\
              \n\
              \n---\
              \nPerang berakhir dengan kekalahan para villain. Sekarang dunia dikuasai oleh Hero yang korup. Dan Salah satu Hero tersebut membunuh saudara perempuan Ehwa. dia tidak tahu yang mana, tapi tidak masalah. Jika dia membunuh satu per satu, mereka akan ada di antara mereka. Ehwa menjadi Hero killer, Villain yang memburu para Hero setiap malam. \"Aku akan membunuh semua orang dan akan mengambil semuanya!\"\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [Indonesian / Bahasa Indonesia](https://www.webtoons.com/id/fantasy/hero-killer/list?title_no=3083)"))
            ((language it)
             (string
              "Il mondo \195\168 in costante fermento, con continue guerre scoppiate tra eroi e cattivi. Dotata di abilit\195\160 soprannaturali, una ragazza solitaria intraprende un percorso sanguinoso per vendicarsi contro le ingiustizie del mondo in cui vive. Con i continui scontri tra titani, nessuno \195\168 al sicuro. Se nessuno \195\168 disposto a proteggere gli innocenti, chi sono i veri eroi e chi sono i veri cattivi? Cosa separa veramente l'uno dall'altro?"))
            ((language ko)
             (string
               "\236\160\132\236\159\129\236\157\128 \235\185\140\235\159\176\235\147\164\236\157\152 \237\140\168\235\176\176\235\161\156 \235\167\137\236\157\132 \235\130\180\235\160\184\235\139\164.\
              \n\236\157\180\236\160\156 \236\132\184\236\131\129\236\157\128 \235\182\128\237\140\168\237\149\156 \237\158\136\236\150\180\235\161\156\235\147\164\236\157\180 \236\167\128\235\176\176\237\149\152\234\179\160 \236\158\136\235\139\164.\
              \n\234\183\184\235\166\172\234\179\160, \234\183\184\235\159\176 \237\158\136\236\150\180\235\161\156\235\147\164 \236\164\145 \237\149\152\235\130\152\234\176\128 \236\157\180\237\153\148\236\157\152 \236\150\184\235\139\136\235\165\188 \236\163\189\236\152\128\235\139\164.\
              \n\236\150\184\235\139\136\235\165\188 \236\163\189\236\157\184 \234\178\140 \235\136\132\234\181\172\236\157\184\236\167\128\235\138\148 \235\170\168\235\165\180\236\167\128\235\167\140 \236\131\129\234\180\128\236\151\134\235\139\164.\
              \n\237\149\156 \235\134\136\236\148\169 \236\163\189\236\157\180\235\139\164 \235\179\180\235\169\180 \234\183\184\236\164\145\236\151\144 \236\158\136\236\157\132 \237\133\140\235\139\136\234\185\140.\
              \n\236\157\180\237\153\148\235\138\148 \235\167\164\236\157\188 \235\176\164 \236\152\129\236\155\133\235\147\164\236\157\132 \236\130\172\235\131\165\237\149\152\235\138\148 \235\185\140\235\159\176, \237\158\136\236\150\180\235\161\156 \237\130\172\235\159\172\234\176\128 \235\144\156\235\139\164.\
              \n\226\128\139\
              \n\237\149\156 \236\149\133\235\139\185\236\157\152 \236\167\128\235\143\133\237\149\156 \236\149\161\236\133\152 \237\153\156\234\183\185.\
              \n\226\128\156\235\170\168\236\161\176\235\166\172 \236\163\189\236\157\180\234\179\160, \235\185\188\236\149\151\236\149\132 \236\163\188\235\167\136!\226\128\157"))
            ((language th)
             (string
               "\224\185\128\224\184\163\224\184\183\224\185\136\224\184\173\224\184\135\224\184\163\224\184\178\224\184\167\224\184\170\224\184\135\224\184\132\224\184\163\224\184\178\224\184\161\224\184\163\224\184\176\224\184\171\224\184\167\224\185\136\224\184\178\224\184\135\224\185\128\224\184\171\224\184\165\224\185\136\224\184\178\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\185\129\224\184\165\224\184\176\224\184\167\224\184\178\224\184\162\224\184\163\224\185\137\224\184\178\224\184\162\224\185\132\224\184\148\224\185\137\224\184\136\224\184\154\224\184\165\224\184\135\224\184\148\224\185\137\224\184\167\224\184\162\224\184\138\224\184\177\224\184\162\224\184\138\224\184\153\224\184\176\224\184\130\224\184\173\224\184\135\224\184\129\224\184\165\224\184\184\224\185\136\224\184\161\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136 \224\185\129\224\184\149\224\185\136\224\185\130\224\184\165\224\184\129\224\185\131\224\184\153\224\184\149\224\184\173\224\184\153\224\184\153\224\184\181\224\185\137\224\184\129\224\184\165\224\184\177\224\184\154\224\184\155\224\184\129\224\184\132\224\184\163\224\184\173\224\184\135\224\184\148\224\185\137\224\184\167\224\184\162\224\184\129\224\184\165\224\184\184\224\185\136\224\184\161\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\184\151\224\184\181\224\185\136\224\184\137\224\185\137\224\184\173\224\184\137\224\184\165 \224\185\129\224\184\165\224\184\176\224\184\171\224\184\153\224\184\182\224\185\136\224\184\135\224\185\131\224\184\153\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\184\129\224\184\165\224\184\184\224\185\136\224\184\161\224\184\153\224\184\177\224\185\137\224\184\153\224\185\132\224\184\148\224\185\137\224\184\134\224\184\178\224\184\149\224\184\129\224\184\163\224\184\163\224\184\161\224\184\158\224\184\181\224\185\136\224\184\170\224\184\178\224\184\167\224\184\130\224\184\173\224\184\135\224\184\173\224\184\181\224\184\174\224\184\167\224\184\178 \224\184\173\224\184\181\224\184\174\224\184\167\224\184\178\224\185\132\224\184\161\224\185\136\224\184\163\224\184\185\224\185\137\224\185\128\224\184\165\224\184\162\224\184\167\224\185\136\224\184\178\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\184\132\224\184\153\224\185\132\224\184\171\224\184\153\224\184\151\224\184\181\224\185\136\224\184\165\224\184\135\224\184\161\224\184\183\224\184\173\224\184\134\224\185\136\224\184\178\224\184\158\224\184\181\224\185\136\224\184\170\224\184\178\224\184\167\224\184\130\224\184\173\224\184\135\224\185\128\224\184\152\224\184\173 \224\185\128\224\184\152\224\184\173\224\185\128\224\184\165\224\184\162\224\184\149\224\184\177\224\184\148\224\184\170\224\184\180\224\184\153\224\185\131\224\184\136\224\185\132\224\184\165\224\185\136\224\184\134\224\185\136\224\184\178\224\184\158\224\184\167\224\184\129\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\185\132\224\184\155\224\184\151\224\184\181\224\184\165\224\184\176\224\184\132\224\184\153 \224\185\128\224\184\152\224\184\173\224\184\132\224\184\180\224\184\148\224\184\167\224\185\136\224\184\178\224\184\150\224\185\137\224\184\178\224\184\134\224\185\136\224\184\178\224\184\158\224\184\167\224\184\129\224\184\174\224\184\181\224\185\130\224\184\163\224\185\136\224\184\129\224\184\165\224\184\184\224\185\136\224\184\161\224\184\153\224\184\177\224\185\137\224\184\153\224\185\131\224\184\171\224\185\137\224\184\171\224\184\161\224\184\148 \224\185\129\224\184\165\224\185\137\224\184\167\224\184\161\224\184\177\224\184\153\224\184\136\224\184\176\224\184\153\224\184\179\224\185\132\224\184\155\224\184\170\224\184\185\224\185\137\224\184\129\224\184\178\224\184\163\224\184\165\224\185\137\224\184\178\224\184\135\224\185\129\224\184\132\224\185\137\224\184\153\224\185\131\224\184\171\224\185\137\224\184\158\224\184\181\224\185\136\224\184\170\224\184\178\224\184\167\224\185\128\224\184\152\224\184\173\224\185\132\224\184\148\224\185\137 \224\184\129\224\184\178\224\184\163\224\184\165\224\185\137\224\184\178\224\184\135\224\185\129\224\184\132\224\185\137\224\184\153\224\184\130\224\184\173\224\184\135\224\184\167\224\184\178\224\184\162\224\184\163\224\185\137\224\184\178\224\184\162\224\184\156\224\184\185\224\185\137\224\184\170\224\184\180\224\185\137\224\184\153\224\184\171\224\184\167\224\184\177\224\184\135\224\185\132\224\184\148\224\185\137\224\185\128\224\184\163\224\184\180\224\185\136\224\184\161\224\184\149\224\185\137\224\184\153\224\184\130\224\184\182\224\185\137\224\184\153 \226\128\156\224\184\137\224\184\177\224\184\153\224\184\136\224\184\176\224\184\134\224\185\136\224\184\178\224\184\158\224\184\167\224\184\129\224\185\129\224\184\129\224\184\151\224\184\184\224\184\129\224\184\132\224\184\153 \224\184\137\224\184\177\224\184\153\224\184\136\224\184\176\224\184\158\224\184\163\224\184\178\224\184\129\224\184\151\224\184\184\224\184\129\224\184\173\224\184\162\224\185\136\224\184\178\224\184\135\224\184\151\224\184\181\224\185\136\224\185\129\224\184\129\224\184\161\224\184\181\224\185\132\224\184\155\224\184\136\224\184\178\224\184\129\224\185\129\224\184\129\226\128\157\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/action/hero-killer/list?title_no=2840)"))
            ((language zh-hk)
             (string
               "\230\136\176\231\136\173\229\156\168\229\143\141\230\180\190\231\154\132\230\149\151\229\140\151\228\184\139\232\144\189\229\185\149\228\186\134\239\188\140\232\128\140\228\184\150\231\149\140\231\148\177\232\133\144\230\149\151\231\154\132\232\139\177\233\155\132\229\128\145\230\142\165\230\137\139\230\142\140\230\142\167\227\128\130 \231\132\182\232\128\140\239\188\140\229\133\182\228\184\173\228\184\128\229\128\139\232\139\177\233\155\132\230\174\186\228\186\134\232\139\161\231\166\190\231\154\132\229\167\144\229\167\144\227\128\130 \229\165\185\228\184\141\229\156\168\228\185\142\229\133\135\230\137\139\230\152\175\232\170\176\239\188\140\229\143\141\230\173\163\230\138\138\228\187\150\229\128\145\229\133\168\233\131\168\230\174\186\230\142\137\229\176\177\229\143\175\228\187\165\228\186\134\227\128\130 \232\139\161\231\166\190\230\175\143\230\153\154\233\131\189\230\156\131\232\161\140\229\139\149\239\188\140\230\136\144\231\130\186\228\186\134\232\139\177\233\155\132\230\174\186\230\137\139\231\154\132\229\143\141\230\180\190\232\167\146\232\137\178\227\128\130 \228\184\128\229\128\139\229\163\158\232\155\139\231\154\132\230\174\152\229\191\141\231\141\181\230\174\186\232\161\140\229\139\149\227\128\130\227\128\140\229\133\168\233\131\168\230\174\186\230\142\137\239\188\129\229\133\168\233\131\168\230\144\182\232\181\176\239\188\129\227\128\141\
              \n\
              \n---\
              \n**Official Translations:**\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/action/hero-killer/list?title_no=5647)"))))
          (is_locked false)
          (links
           (((provider al) (link 132093))
            ((provider ap) (link hero-killer-kkulbeol))
            ((provider kt) (link 60153)) ((provider mu) (link 178352))
            ((provider mal) (link 147290))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=766563))
            ((provider engtl)
             (link
              https://www.webtoons.com/en/action/hero-killer/list?title_no=2745))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5ca48985-9a9d-4bd8-be29-80dc0303db72)
             (attributes
              ((name (((language en) (string Crime)))) (group genre) (version 1))))
            ((id 7064a261-a137-4d3a-8848-2d385de3a99c)
             (attributes
              ((name (((language en) (string Superhero)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-03-04T00:06:04+00:00)
          (updated_at 2024-07-14T02:24:46+00:00) (version 20)
          (available_translated_languages (en pt-br it pl fr))
          (latest_uploaded_chapter 76548be6-a9bc-4be3-95f0-e02caf85b481)))
        (relationships
         (((id a5fc67b9-5af1-48f5-ba17-aa56f448a0ab) (type_ author))
          ((id a7984ee7-d798-4d98-8f97-f0ffd848d9cf) (type_ artist))
          ((id a94d36f9-0080-4f81-b163-f1d401e467aa) (type_ cover_art)))))
       ((id 1a91719c-1009-482a-9915-389a366505e7)
        (attributes
         ((title
           (((language en) (string "Osananajimi no Ijou Kawaii Imouto-chan"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\185\188\233\166\180\230\159\147\227\129\174\231\149\176\229\184\184\229\143\175\230\132\155\227\129\132\229\166\185\227\129\161\227\130\131\227\130\147")))
            (((language en) (string "My Friend's Abnormally Cute Sister")))
            (((language zh-hk)
              (string
               "\231\153\188\229\176\143\231\154\132\231\149\176\229\184\184\229\143\175\230\132\155\231\154\132\229\166\185\229\166\185")))
            (((language zh-hk)
              (string
               "\231\153\188\229\176\143\231\154\132\229\183\168\229\143\175\230\132\155\229\166\185\229\166\185")))
            (((language zh)
              (string
               "\229\143\145\229\176\143\231\154\132\229\188\130\229\184\184\229\143\175\231\136\177\231\154\132\229\166\185\229\166\185")))
            (((language zh)
              (string
               "\229\143\145\229\176\143\231\154\132\229\183\168\229\143\175\231\136\177\229\166\185\229\166\185")))
            (((language vi)
              (string
               "C\195\180 Em G\195\161i D\225\187\133 Th\198\176\198\161ng Nh\198\176ng L\225\186\161 Th\198\176\225\187\157ng C\225\187\167a B\225\186\161n T\195\180i")))))
          (description
           (((language en)
             (string
               "Yanagi, a second-year high school student, has a faint crush on Mizuki, the younger sister of her childhood friend Momo.\
              \n\
              \nOne day, while rummaging through Mizuki's personal belongings in her room, Yanagi discovers the truth about Mizuki...?"))))
          (is_locked false)
          (links
           (((provider al) (link 168398))
            ((provider ap) (link osananajimi-no-ijou-kawaii-imouto-chan))
            ((provider bw) (link de419eede4-62a4-4173-bf7e-cba38a31a059))
            ((provider mu) (link 31ihygw)) ((provider mal) (link 162646))
            ((provider raw)
             (link https://storia.takeshobo.co.jp/manga/ijou_kawaii/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2023))
          (content_rating erotica)
          (tags
           (((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5bd0e105-4481-44ca-b6e7-7544da56b1a3)
             (attributes
              ((name (((language en) (string Incest)))) (group theme)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id fad12b5e-68ba-460e-b933-9ae8318f5b65)
             (attributes
              ((name (((language en) (string Gyaru)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-08-18T20:42:34+00:00)
          (updated_at 2024-07-22T14:54:33+00:00) (version 18)
          (available_translated_languages (pt-br es-la id en))
          (latest_uploaded_chapter cade1d02-5923-4434-9cc6-501fecb9c7d7)))
        (relationships
         (((id 5baa3098-acb5-4434-9f40-8e4b83686281) (type_ author))
          ((id 5baa3098-acb5-4434-9f40-8e4b83686281) (type_ artist))
          ((id 04b63bfb-9229-47bd-848e-36f6fdfe351f) (type_ cover_art))
          ((id 13451a95-863c-4a8e-aca7-2c1cbb58c5ec) (type_ creator)))))
       ((id de491df4-153f-44e8-96d2-7c53d11c3dcf)
        (attributes
         ((title (((language en) (string "Hellper 2 <KillBeros>"))))
          (alt_titles
           ((((language en) (string Hellper)))
            (((language en) (string "Hellper season 2")))
            (((language en) (string Helper))) (((language en) (string KBRS)))
            (((language en) (string KillBeros)))))
          (description
           (((language en)
             (string
              "Jang Gwangnam's life as he grows the guard tribe that protects the Kana-Shi city."))))
          (is_locked false)
          (links
           (((provider mu) (link 131139))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list.nhn?titleId=670143))))
          (original_language ko) (last_volume ()) (last_chapter ())
          (publication_demographic ()) (status ongoing) (year ())
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-01-24T05:47:47+00:00)
          (updated_at 2023-07-15T08:02:42+00:00) (version 6)
          (available_translated_languages (en))
          (latest_uploaded_chapter fbec881b-f807-41da-863a-0cd6919e2ea9)))
        (relationships
         (((id c5df8b6f-6571-4c59-8289-3fb990aff2da) (type_ author))
          ((id c5df8b6f-6571-4c59-8289-3fb990aff2da) (type_ artist))
          ((id 5a9586a0-36fc-4f96-9ac9-72c324588be3) (type_ cover_art)))))
       ((id 3229b2db-0e84-497c-999b-aa50728d2371)
        (attributes
         ((title
           (((language en) (string "Anata-tachi Soredemo Sensei Desu ka!"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\130\227\129\170\227\129\159\233\129\148\227\129\157\227\130\140\227\129\167\227\130\130\229\133\136\231\148\159\227\129\167\227\129\153\227\129\139\227\129\163\239\188\129")))
            (((language en) (string "You Still Call Yourselves Teachers?!")))
            (((language pl)
              (string "Czy wy nadal jeste\197\155cie nauczycielami?")))))
          (description
           (((language en)
             (string
              "One day, school teachers come as freeloaders to the inn run by his parents!? Kazami Hiro, a high school boy, decides to take care of the inn and his future!? Under one roof, The forbidden harem romantic comedy begins!!"))
            ((language ja)
             (string
              "\232\166\170\227\129\140\231\181\140\229\150\182\227\129\153\227\130\139\230\151\133\233\164\168\227\129\171\227\129\130\227\130\139\230\151\165\227\128\129\229\177\133\229\128\153\227\129\168\227\129\151\227\129\166\227\130\132\227\129\163\227\129\166\227\129\141\227\129\159\227\129\174\227\129\175\229\173\166\230\160\161\227\129\174\229\133\136\231\148\159\227\129\159\227\129\161!? \231\148\183\229\173\144\233\171\152\230\160\161\231\148\159\227\131\187\233\162\168\232\166\139\227\131\146\227\131\173\227\129\175\230\151\133\233\164\168\227\129\174\227\129\159\227\130\129\227\128\129\232\135\170\229\136\134\227\129\174\230\156\170\230\157\165\227\129\174\227\129\159\227\130\129\227\129\171\227\129\138\228\184\150\232\169\177\227\130\146\227\129\153\227\130\139\227\129\147\227\129\168\227\129\171!? \228\184\128\227\129\164\229\177\139\230\160\185\227\129\174\228\184\139\227\128\129\231\166\129\230\150\173\227\129\174\227\131\143\227\131\188\227\131\172\227\131\160\227\131\169\227\131\150\227\130\179\227\131\161\227\129\140\233\150\139\229\185\149!!"))
            ((language pl)
             (string
              "Pewnego dnia nauczyciele przychodz\196\133 jako freeloaderzy do zajazdu prowadzonego przez jego rodzic\195\179w!? Kazami Hiro, ucze\197\132 szko\197\130y \197\155redniej, postanawia zadba\196\135 o zajazd i swoj\196\133 przysz\197\130o\197\155\196\135!? Pod jednym dachem rozpoczyna si\196\153 zakazana haremowa komedia romantyczna!!"))))
          (is_locked false)
          (links
           (((provider al) (link 174169))
            ((provider ap) (link anata-tachi-soredemo-sensei-desu-ka))
            ((provider bw) (link series/469441))
            ((provider kt) (link anatatachi-soredemo-sensei-desu-ka))
            ((provider mu) (link 2b7bdy1))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0D819QQ1K))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/835182/))
            ((provider mal) (link 166633))
            ((provider raw)
             (link https://tonarinoyj.jp/episode/10044607041236939652))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating erotica)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-01-27T00:45:13+00:00)
          (updated_at 2024-07-21T22:57:17+00:00) (version 31)
          (available_translated_languages (en pl es-la id pt-br ru))
          (latest_uploaded_chapter 414166b4-6f49-45fc-bf20-85de9cee17f4)))
        (relationships
         (((id 9f5d1a87-2e1f-4751-ab30-1930b0a644ac) (type_ author))
          ((id 9f5d1a87-2e1f-4751-ab30-1930b0a644ac) (type_ artist))
          ((id 77959fc9-cd58-4979-b9e7-3c8251d9c36d) (type_ cover_art))
          ((id c3a21d7c-5c46-4367-9895-b8b04d6912e6) (type_ creator)))))
       ((id 1064e8a5-0de9-401f-b674-b6178611305d)
        (attributes
         ((title
           (((language en)
             (string "The Secret Bedroom of the Forsaken Princess"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\178\132\235\166\188\235\176\155\236\157\128 \236\153\149\235\133\128\236\157\152 \236\157\128\235\176\128\237\149\156 \236\185\168\236\139\164")))
            (((language ko-ro)
              (string "Beorimbadeun Wangnyeoui Eunmilhan Chimsil")))
            (((language en)
              (string "The Secret Bedroom of a Dejected Royal Daughter")))
            (((language en) (string "The Abandoned Princess' Secret Room")))
            (((language fr) (string "The Abandoned Princess' Secret Bedroom")))
            (((language es)
              (string "El dormitorio secreto de la princesa abandonada")))
            (((language ru)
              (string
               "\208\162\208\176\208\185\208\189\209\139\208\181 \208\191\208\190\208\186\208\190\208\184 \208\191\208\190\208\186\208\184\208\189\209\131\209\130\208\190\208\185 \208\191\209\128\208\184\208\189\209\134\208\181\209\129\209\129\209\139")))
            (((language th)
              (string
               "\224\184\171\224\185\137\224\184\173\224\184\135\224\184\153\224\184\173\224\184\153\224\184\165\224\184\177\224\184\154\224\184\130\224\184\173\224\184\135\224\185\128\224\184\136\224\185\137\224\184\178\224\184\171\224\184\141\224\184\180\224\184\135\224\184\149\224\185\137\224\184\173\224\184\135\224\184\170\224\184\178\224\184\155")))
            (((language ja)
              (string
               "\230\141\168\227\129\166\227\130\137\227\130\140\227\129\159\231\142\139\229\165\179\227\129\174\231\167\152\229\175\134\227\129\174\229\175\157\229\174\164")))
            (((language zh)
              (string
               "\232\162\171\229\188\131\229\133\172\228\184\187\231\154\132\231\167\152\229\175\134\230\136\191\233\151\180")))
            (((language zh-hk)
              (string
               "\232\144\189\233\173\132\231\142\139\229\165\179\231\154\132\233\154\177\229\175\134\233\150\168\230\136\191")))
            (((language en)
              (string "The Secret Bedroom of the Abandoned Princess")))))
          (description
           (((language en)
             (string
               "Princess Llewelyn, who was once an outstanding princess but was now miserably abandoned. An ugly curse has been placed upon her with no one to protect her. It is a curse that makes her lust for men. In order to stop her curse, Llewelyn opens her bedroom... Four men are entangled with the abandoned princess. Will the truth of the curse be revealed? And who will be the man who will end up with her?\
              \n\
              \n---\
              \n**Notes:**\
              \n* *The Secret Bedroom of a Dejected Royal Daughter* is the official English title of the Korean novel.\
              \n* Naver changed the webtoon's rating from R15 to R19. The novel is still R15, it has never released as R19. Naver R19 rating for the webtoon is more of a mature R17.\
              \n\
              \n---\
              \n**Original Novel:** [Naver Series](https://series.naver.com/novel/detail.series?productNo=5575596), [Official English Translation](https://www.yonderstory.com/)\
              \n\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=8614959), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=796867)\
              \n\
              \n**Official Translations:**\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://www.dongmanmanhua.cn/LOVE/beiqigongzhudemimifangjian/list?title_no=2297)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/western-palace/secret-bedroom/list?title_no=4819)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/romance/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4773)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0002369)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/romantic-fantasy/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4786)"))
            ((language fr)
             (string
               "La princesse Lewellyn avait tout pour elle. Jusqu'au jour o\195\185 sa m\195\168re s'est fait ex\195\169cuter pour avoir tent\195\169 de maudire le prince h\195\169ritier. Depuis, elle vit ses jours d\195\169laiss\195\169e par les siens et harcel\195\169e par la reine douairi\195\168re. Elle ne r\195\170ve plus que de pouvoir entrer \195\160 l'abbaye pour s'\195\169chapper du palais et vivre une vie chaste. Mais le dieu d\195\169mon Asmodeus lui a inflig\195\169 la mal\195\169diction de la luxure, la faisant plonger dans le d\195\169sir. Parviendra-t-elle \195\160 cacher ses \195\169bats de princesse lubrique et \195\160 se rappeler de l'homme qui a pris sa virginit\195\169?\
              \n\
              \n---\
              \n**Original Novel:** [Naver Series](https://series.naver.com/novel/detail.series?productNo=5575596), [Official English Translation](https://www.yonderstory.com/)\
              \n\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=8614959), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=796867)\
              \n\
              \n**Official Translations:**\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://www.dongmanmanhua.cn/LOVE/beiqigongzhudemimifangjian/list?title_no=2297)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/western-palace/secret-bedroom/list?title_no=4819)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/romance/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4773)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0002369)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/romantic-fantasy/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4786)"))
            ((language th)
             (string
               "\224\185\128\224\184\158\224\184\183\224\185\136\224\184\173\224\184\165\224\184\154\224\184\165\224\185\137\224\184\178\224\184\135\224\184\132\224\184\179\224\184\170\224\184\178\224\184\155 \224\184\173\224\184\135\224\184\132\224\185\140\224\184\171\224\184\141\224\184\180\224\184\135\224\185\128\224\184\165\224\185\128\224\184\167\224\184\165\224\184\165\224\184\181\224\184\153\224\184\136\224\184\179\224\184\149\224\185\137\224\184\173\224\184\135\224\185\128\224\184\155\224\184\180\224\184\148\224\184\171\224\185\137\224\184\173\224\184\135\224\184\154\224\184\163\224\184\163\224\184\151\224\184\161\224\185\129\224\184\171\224\185\136\224\184\135\224\184\132\224\184\167\224\184\178\224\184\161\224\184\165\224\184\177\224\184\154 \224\185\129\224\184\165\224\185\137\224\184\167\224\184\155\224\184\165\224\184\148\224\185\128\224\184\155\224\184\165\224\184\183\224\185\137\224\184\173\224\184\135\224\184\163\224\184\178\224\184\132\224\184\176\224\184\151\224\184\181\224\185\136\224\184\165\224\184\184\224\184\129\224\185\130\224\184\138\224\184\153\224\185\131\224\184\153\224\184\130\224\184\177\224\185\137\224\184\167\224\184\136\224\184\180\224\184\149\224\184\130\224\184\177\224\185\137\224\184\167\224\185\131\224\184\136 \224\184\154\224\184\184\224\184\163\224\184\184\224\184\169\224\184\151\224\184\177\224\185\137\224\184\135 4 \224\184\132\224\184\153\224\184\151\224\184\181\224\185\136\224\184\149\224\184\129\224\184\129\224\184\163\224\184\176\224\185\132\224\184\148\224\184\158\224\184\165\224\184\173\224\184\162\224\185\130\224\184\136\224\184\153\224\185\128\224\184\130\224\185\137\224\184\178\224\184\161\224\184\178\224\184\170\224\184\184\224\184\161\224\184\173\224\184\162\224\184\185\224\185\136\224\185\131\224\184\153\224\184\129\224\184\173\224\184\135\224\185\132\224\184\159\224\184\129\224\184\178\224\184\161\224\184\173\224\184\178\224\184\163\224\184\161\224\184\147\224\185\140\224\184\173\224\184\177\224\184\153\224\184\163\224\185\137\224\184\173\224\184\153\224\184\163\224\184\184\224\185\136\224\184\161\224\184\153\224\184\181\224\185\137 \224\185\131\224\184\132\224\184\163\224\184\136\224\184\176\224\185\128\224\184\155\224\185\135\224\184\153\224\184\132\224\184\153\224\184\151\224\184\181\224\185\136\224\184\170\224\184\178\224\184\161\224\184\178\224\184\163\224\184\150\224\184\132\224\184\167\224\185\137\224\184\178\224\184\171\224\184\177\224\184\167\224\185\131\224\184\136\224\184\173\224\184\177\224\184\153\224\185\128\224\184\137\224\184\162\224\184\138\224\184\178\224\184\151\224\184\181\224\185\136\224\185\132\224\184\161\224\185\136\224\185\128\224\184\132\224\184\162\224\184\163\224\184\185\224\185\137\224\184\136\224\184\177\224\184\129\224\184\132\224\184\167\224\184\178\224\184\161\224\184\163\224\184\177\224\184\129\224\185\132\224\184\155\224\185\132\224\184\148\224\185\137 \224\185\129\224\184\165\224\184\176\224\184\136\224\184\176\224\185\128\224\184\129\224\184\180\224\184\148\224\184\173\224\184\176\224\185\132\224\184\163\224\184\130\224\184\182\224\185\137\224\184\153\224\184\129\224\184\177\224\184\154\224\184\132\224\184\179\224\184\170\224\184\178\224\184\155\224\184\151\224\184\181\224\185\136\224\184\156\224\184\185\224\184\129\224\184\161\224\184\177\224\184\148\224\184\173\224\184\135\224\184\132\224\185\140\224\184\171\224\184\141\224\184\180\224\184\135\224\184\149\224\184\163\224\184\178\224\184\154\224\184\170\224\184\180\224\185\137\224\184\153\224\184\165\224\184\161\224\184\171\224\184\178\224\184\162\224\185\131\224\184\136\224\184\153\224\184\181\224\185\137\224\184\129\224\184\177\224\184\153\224\185\129\224\184\153\224\185\136?\
              \n\
              \n---\
              \n**Original Novel:** [Naver Series](https://series.naver.com/novel/detail.series?productNo=5575596), [Official English Translation](https://www.yonderstory.com/)\
              \n\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=8614959), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=796867)\
              \n\
              \n**Official Translations:**\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://www.dongmanmanhua.cn/LOVE/beiqigongzhudemimifangjian/list?title_no=2297)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/western-palace/secret-bedroom/list?title_no=4819)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/romance/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4773)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0002369)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/romantic-fantasy/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4786)"))
            ((language zh)
             (string
               "\230\151\182\229\176\154\231\191\152\232\135\128\231\148\183\228\189\156\229\174\182\229\165\135\229\185\187\229\138\155\228\189\156\239\188\129\
              \n\232\176\129\230\137\141\230\152\175\232\175\133\229\146\146\229\133\172\228\184\187\231\154\132\231\156\159\231\136\177\239\188\159\
              \n\228\185\144\232\150\135\231\144\179\230\155\190\230\152\175\229\164\135\229\143\151\230\153\175\228\187\176\231\154\132\229\133\172\228\184\187\239\188\140\229\166\130\228\187\138\229\141\180\230\131\168\233\129\173\230\138\155\229\188\131\227\128\130\229\164\177\229\142\187\228\191\157\230\138\164\231\154\132\229\133\172\228\184\187\228\184\141\229\185\184\233\129\173\233\129\135\228\186\134\233\130\170\230\129\182\231\154\132\232\175\133\229\146\146\227\128\130\228\184\186\228\186\134\233\152\178\230\173\162\232\175\133\229\146\146\229\164\177\230\142\167\239\188\140\232\162\171\229\188\131\229\133\172\228\184\187\229\188\128\229\167\139\228\186\134\228\184\142\229\155\155\228\184\170\231\148\183\228\186\186\231\154\132\231\136\177\230\129\168\231\186\160\231\188\160\227\128\130\232\175\133\229\146\146\231\154\132\231\156\159\231\155\184\228\188\154\232\162\171\232\167\163\229\188\128\229\144\151\239\188\159\
              \n\
              \n---\
              \n**Original Novel:** [Naver Series](https://series.naver.com/novel/detail.series?productNo=5575596), [Official English Translation](https://www.yonderstory.com/)\
              \n\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=8614959), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=796867)\
              \n\
              \n**Official Translations:**\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://www.dongmanmanhua.cn/LOVE/beiqigongzhudemimifangjian/list?title_no=2297)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/western-palace/secret-bedroom/list?title_no=4819)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/romance/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4773)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0002369)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/romantic-fantasy/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4786)"))
            ((language zh-hk)
             (string
               "\230\155\190\231\182\147\229\130\153\229\143\151\230\142\168\229\180\135\239\188\140\231\143\190\229\156\168\229\141\187\230\130\178\230\133\152\229\156\176\232\162\171\230\139\139\230\163\132\231\154\132\231\142\139\229\165\179\232\144\138\231\182\173\231\144\179\227\128\130 \231\132\161\228\186\186\228\191\157\232\173\183\231\154\132\229\165\185\232\162\171\228\184\139\228\186\134\229\133\135\230\131\161\231\154\132\232\169\155\229\146\146\227\128\130 \233\130\163\229\176\177\230\152\175\232\174\147\228\186\186\229\176\141\231\148\183\228\186\186\231\148\162\231\148\159\230\133\190\230\156\155\231\154\132\232\169\155\229\146\146\227\128\130 \232\144\138\231\182\173\231\144\179\231\136\178\228\186\134\233\152\187\230\173\162\232\169\155\229\146\146\231\154\132\230\154\180\232\181\176\239\188\140\230\156\128\231\181\130\230\137\147\233\150\139\228\186\134\232\135\170\229\183\177\231\154\132\232\135\165\229\174\164... \232\162\171\230\139\139\230\163\132\231\154\132\231\142\139\229\165\179\232\136\135\231\179\190\231\186\143\228\184\141\230\184\133\231\154\132\229\155\155\229\144\141\231\148\183\229\173\144\227\128\130 \232\169\155\229\146\146\231\154\132\231\156\159\231\155\184\230\156\131\229\164\167\231\153\189\229\151\142\239\188\159 \230\156\128\229\190\140\229\165\185\230\156\131\229\146\140\229\147\170\229\128\139\231\148\183\228\186\186\229\156\168\228\184\128\232\181\183\229\145\162\239\188\159\
              \n\
              \n---\
              \n**Original Novel:** [Naver Series](https://series.naver.com/novel/detail.series?productNo=5575596), [Official English Translation](https://www.yonderstory.com/)\
              \n\
              \n**Original Webtoon:** [Naver Series](https://series.naver.com/comic/detail.series?productNo=8614959), [Naver Webtoon](https://comic.naver.com/webtoon/list?titleId=796867)\
              \n\
              \n**Official Translations:**\
              \n* [Chinese (Simplified) / \230\177\137\232\175\173](https://www.dongmanmanhua.cn/LOVE/beiqigongzhudemimifangjian/list?title_no=2297)\
              \n* [Chinese (Traditional) / \230\188\162\232\170\158](https://www.webtoons.com/zh-hant/western-palace/secret-bedroom/list?title_no=4819)\
              \n* [French / Fran\195\167ais](https://www.webtoons.com/fr/romance/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4773)\
              \n* [Japanese / \230\151\165\230\156\172\232\170\158](https://manga.line.me/product/periodic?id=Z0002369)\
              \n* [Thai / \224\184\160\224\184\178\224\184\169\224\184\178\224\185\132\224\184\151\224\184\162](https://www.webtoons.com/th/romantic-fantasy/the-secret-bedroom-of-the-abandoned-princess/list?title_no=4786)"))))
          (is_locked false)
          (links
           (((provider al) (link 152609))
            ((provider ap)
             (link the-secret-bedroom-of-a-dejected-royal-daughter))
            ((provider kt) (link beorimbadeun-wangnyeoui-eunmilhan-chimsil))
            ((provider mu) (link hzdmyn4))
            ((provider nu) (link the-abandoned-princess-secret-bedroom))
            ((provider mal) (link 152247))
            ((provider raw)
             (link https://comic.naver.com/webtoon/list?titleId=796867))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic (josei)) (status ongoing) (year (2022))
          (content_rating erotica)
          (tags
           (((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 65761a2a-415e-47f3-bef2-a9dababba7a6)
             (attributes
              ((name (((language en) (string "Reverse Harem")))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-07-04T04:58:42+00:00)
          (updated_at 2024-05-30T23:21:39+00:00) (version 18)
          (available_translated_languages (es-la pl en))
          (latest_uploaded_chapter 67656222-58e1-4c46-b2c3-09c7398b8498)))
        (relationships
         (((id 2a3e7c22-ae33-4837-8398-10c96b2a9b1d) (type_ author))
          ((id c37a4ebd-cc06-4968-9b7c-987abe7fb86f) (type_ author))
          ((id 3e2bde48-5624-4c6b-855d-cb754be40342) (type_ artist))
          ((id 93121b5e-8311-4346-8a86-706918d47269) (type_ cover_art))
          ((id 79795464-b432-4bed-a2fc-d2b0d48286c0) (type_ creator)))))
       ((id 008eecb3-1d79-40c0-aa4a-463347d83397)
        (attributes
         ((title (((language en) (string Spacedrum)))) (alt_titles ())
          (description
           (((language en)
             (string
               "RENAISSANCE, LIFE, DEATH, ASTRAL DISINTEGRATION.\
              \nRENAISSANCE, LIFE, DEATH, ASTRAL DISINTEGRATION.\
              \nRENAISSANCE, LIFE, DEATH, ASTRAL DISINTEGRATION.\
              \n\
              \nAll beings in the firmament live locked in this infinite cycle. Or so it was until the day they came down from the heavens.\
              \n\
              \nHumanity ceased to be human. Death is no longer the end. Enlightenment came to save her children and defeat the most powerful feeling that consciousness had been able to create.\
              \n\
              \n___\
              \n\
              \nSpaceDrum shows us a society that has evolved to a state of full well-being, freed from wars and conflicts, in search of Nirvana, thanks to the spiritual guidance of an alien race.\
              \nThe aryas are an elite group charged with the external security of the planet and the protection of the high priestess.\
              \n\
              \nThey are chosen because, thanks to their control over their Virya, they are able to control mysterious fragments, the shards. Reda is a student at one of the most distinctive military academies, but he has difficulty controlling his special shard due to constant visions of a strange young woman. And this will not be the biggest of your problems..."))))
          (is_locked false)
          (links
           (((provider amz) (link https://www.amazon.com/dp/8413426243))
            ((provider raw)
             (link https://www.buscalibre.pe/libros/search?q=spacedrum))))
          (original_language es) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b1e97889-25b4-4258-b28b-cd7f4d28ea9b)
             (attributes
              ((name (((language en) (string Philosophical)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e64f6742-c834-471d-8d72-dd51fc02b835)
             (attributes
              ((name (((language en) (string Aliens)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-10-28T18:18:34+00:00)
          (updated_at 2023-03-17T06:38:59+00:00) (version 6)
          (available_translated_languages (en es))
          (latest_uploaded_chapter b870a521-885a-48b8-9ba7-162a8a8415b0)))
        (relationships
         (((id 4d229aa9-b05d-453b-86a1-a133e2c69e3a) (type_ author))
          ((id ea5aeede-1192-41b2-8866-ddaf0aee5ae4) (type_ author))
          ((id 4d229aa9-b05d-453b-86a1-a133e2c69e3a) (type_ artist))
          ((id 00683ebd-8701-4af6-a061-a3df66dff57b) (type_ cover_art))
          ((id c7dcd7bf-7c74-4208-9f9b-a6a2b1c2d23c) (type_ creator)))))
       ((id 936f0ba5-ca65-4de4-99b1-528c02a4454d)
        (attributes
         ((title
           (((language en) (string "Hunter \195\151 Hunter (Official Colored)"))))
          (alt_titles
           ((((language en)
              (string "Hunter \195\151 Hunter - Digital Colored Comics")))
            (((language en) (string "Hunter \195\151 Hunter")))
            (((language ja)
              (string
               "\227\131\143\227\131\179\227\130\191\227\131\188\195\151\227\131\143\227\131\179\227\130\191\227\131\188")))
            (((language ja)
              (string
               "HUNTER\195\151HUNTER \227\130\171\227\131\169\227\131\188\231\137\136")))
            (((language en) (string "Hunter x Hunter (Official Colored)")))
            (((language en) (string "Hunter x Hunter - Digital Colored Comics")))))
          (description
           (((language en)
             (string
              "Hunters are a special breed, dedicated to tracking down treasures, magical beasts, and even other men. But such pursuits require a license, and less than one in a hundred thousand can pass the grueling qualification exam. Those who do pass gain access to restricted areas, amazing stores of information, and the right to call themselves Hunters."))
            ((language pt-br)
             (string
              "Vers\195\163o totalmente colorida do famoso mang\195\161 \"Hunter x Hunter\". Hunters s\195\163o uma ra\195\167a especial, dedicada a rastrear tesouros, animais m\195\161gicos, e at\195\169 mesmo outros homens. Mas tais atividades requerem uma licen\195\167a, e menos de um em cem mil pode passar no exame de qualifica\195\167\195\163o esgotante. Aqueles que n\195\163o passam tem acesso a \195\161reas restritas, lojas de incr\195\173veis informa\195\167\195\181es, bem como o direito de chamar-se de Hunters."))))
          (is_locked false)
          (links
           (((provider ap) (link hunter-x-hunter))
            ((provider bw) (link series/13153/list))
            ((provider amz) (link https://www.amazon.co.jp/dp/B075FTWTJH))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/146494/))
            ((provider mal) (link 26))
            ((provider raw)
             (link
              https://www.shueisha.co.jp/books/items/contents.html?jdcn=08872571872571325501))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2013))
          (content_rating safe)
          (tags
           (((id 320831a8-4026-470b-94f6-8353740e6f04)
             (attributes
              ((name (((language en) (string "Official Colored"))))
               (group format) (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 799c202e-7daa-44eb-9cf7-8a3c0441531e)
             (attributes
              ((name (((language en) (string "Martial Arts")))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-03-11T14:37:00+00:00)
          (updated_at 2024-07-09T02:46:27+00:00) (version 14)
          (available_translated_languages (en ru fr pt-br pl ar es-la vi))
          (latest_uploaded_chapter b7e443d0-3e6d-4d81-a273-061dacdb7e68)))
        (relationships
         (((id 00345ac8-e515-458d-a11d-56cfd1cb253b) (type_ author))
          ((id 00345ac8-e515-458d-a11d-56cfd1cb253b) (type_ artist))
          ((id 78c15b51-c52c-4033-a11c-df6ec395c6f3) (type_ cover_art))
          ((id db692d58-4b13-4174-ae8c-30c515c0689c) (type_ manga)))))
       ((id 7ae7067a-7e68-4bd2-a064-5e3e3c059078)
        (attributes
         ((title (((language en) (string "World Trigger"))))
          (alt_titles
           ((((language ru)
              (string
               "\208\152\208\188\208\191\209\131\208\187\209\140\209\129 \208\188\208\184\209\128\208\176")))
            (((language ja)
              (string
               "\227\131\175\227\131\188\227\131\171\227\131\137\227\131\136\227\131\170\227\130\172\227\131\188")))
            (((language ja)
              (string "\227\131\175\227\131\188\227\131\136\227\131\170")))
            (((language zh)
              (string
               "\229\162\131\231\149\140\232\167\166\229\143\145\232\128\133")))
            (((language zh-ro)
              (string "J\195\172ngji\195\168 ch\195\185f\196\129 zh\196\155")))
            (((language zh-hk)
              (string
               "\229\162\131\231\149\140\232\167\184\231\153\188\232\128\133")))
            (((language ar)
              (string
               "\217\136\217\136\216\177\217\132\216\175 \216\170\216\177\217\138\216\186\216\177")))
            (((language ja-ro) (string "W\196\129tori")))
            (((language en) (string "World Trigger")))))
          (description
           (((language en)
             (string
               "A gate to another dimension has burst open, and from it emerge gigantic invincible creatures that threaten all of humanity. Earth's only defense is a mysterious group of warriors who have co-opted the alien technology in order to fight back!  \
              \n  \
              \n**Please Note:** Chapters 111-114 are only available as licensed versions."))
            ((language pt-br)
             (string
              "Um port\195\163o para outra dimens\195\163o se abriu, e dele emergiu todo tipo de criatura poderosa e gigante que amea\195\167a toda a humanidade. A \195\186nica defesa da Terra \195\169 um misterioso grupo de guerreiros que faz uso da tecnologia alien\195\173gena a fim de lutar contra eles."))))
          (is_locked false)
          (links
           (((provider al) (link 78151)) ((provider ap) (link world-trigger))
            ((provider bw) (link series/13136/list)) ((provider kt) (link 5633))
            ((provider mu) (link 92323))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B074C6Q8GR))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/193760/))
            ((provider mal) (link 48151))
            ((provider raw)
             (link https://shonenjumpplus.com/episode/10833519556325021821))
            ((provider engtl)
             (link https://mangaplus.shueisha.co.jp/titles/100028))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2013))
          (content_rating safe)
          (tags
           (((id 256c8bd9-4904-4360-bf4f-508a76d67183)
             (attributes
              ((name (((language en) (string Sci-Fi)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-07-05T07:56:23+00:00)
          (updated_at 2024-05-01T19:55:35+00:00) (version 15)
          (available_translated_languages (en pt-br es pl de tr))
          (latest_uploaded_chapter 897f3b7a-a268-45dc-8ce2-dadb6e2aeb87)))
        (relationships
         (((id 57767ced-894c-4d46-a847-b2c2694392bb) (type_ author))
          ((id 57767ced-894c-4d46-a847-b2c2694392bb) (type_ artist))
          ((id d6fbf237-78b9-49c7-bb15-0e0a80a6c5df) (type_ cover_art))
          ((id 269cd730-ace9-4acd-bee6-d369d24f0a42) (type_ manga))
          ((id c29fb8fd-f053-4f33-90ee-331b3e112133) (type_ manga)))))
       ((id dcdcc8c7-932e-4f60-a900-5f19934eb6cf)
        (attributes
         ((title (((language en) (string "Dungeon Reset"))))
          (alt_titles
           ((((language ko)
              (string "\235\141\152\236\160\132 \235\166\172\236\133\139")))
            (((language fa)
              (string
               "\216\168\216\167\216\178\217\134\216\180\216\167\217\134\219\140 \216\175\216\167\217\134\216\172\217\134")))
            (((language zh)
              (string
               "\233\135\141\229\144\175\229\156\176\228\184\139\229\159\142")))
            (((language ja)
              (string
               "\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\227\131\170\227\130\187\227\131\131\227\131\136")))
            (((language ru)
              (string
               "\208\159\208\181\209\128\208\181\208\183\208\176\208\191\209\131\209\129\208\186 \208\191\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\209\143")))
            (((language zh-hk)
              (string "\229\137\175\230\156\172\233\135\141\231\189\174")))
            (((language es-la) (string "Reajuste de la mazmorra")))))
          (description
           (((language de)
             (string
               "Dawoons normales Leben wird auf den Kopf gestellt, als er in den Dungeon gerufen wird, wo er ein t\195\182dliches Spiel gegen gef\195\164hrliche Monster und lebensbedrohliche Fallen spielen muss. Was die Sache schlimmer macht, ist, er ist nur ein einfacher Handwerker mit null Kampff\195\164higkeiten. Aber nachdem Dawoon in eine Falle ger\195\164t und einen fehlerhaften Reset \195\188berlebt, hat er willk\195\188rliche und dennoch sehr hilfreiche F\195\164higkeiten. Zusammen mit einem blutr\195\188nstigen Gef\195\164hrten und einem niedlichen Eichh\195\182rnchen muss er sich etwas einfallen lassen, um das Spiel zu gewinnen und nach Hause zur\195\188ckzukehren. Welche Abenteuer erwarten ihn in den Tunneln \226\128\147 jetzt, wo die Regeln f\195\188r ihn scheinbar nicht mehr g\195\188ltig sind?\
              \n\
              \n---\
              \n- [Official German Translation](https://www.tappytoon.com/de/comics/dungeon-reset-de)"))
            ((language en)
             (string
              "Dawoon's ordinary life is turned upside down when he is summoned into the Dungeon, where he must play a deadly game, outlasting dangerous monsters and life-threatening traps. To make matters worse, he's only a mere crafter with zero combat abilities. But after Dawoon falls into a trap and survives after a glitched reset, he's gained random but oddly helpful skills. He'll need to get creative to clear the game and return home, with a bloodthirsty assistant and an adorable ground squirrel along for the ride. Now that the rules no longer apply to him, what possibilities await in the tunnels below."))
            ((language fa)
             (string
              "\226\129\167\226\129\167   \217\136\217\130\216\170\219\140 \218\169\217\135 \216\168\216\167\216\178\217\134\216\180\216\167\217\134\219\140 \216\180\216\177\217\136\216\185 \216\168\216\180\217\135\216\140 \217\135\217\133\217\135 \218\134\219\140\216\178 \216\168\217\135 \216\173\216\167\217\132\216\170 \217\130\216\168\217\132\216\180 \216\168\216\177\216\167\219\140 \216\180\216\177\218\169\216\170 \218\169\217\134\217\134\216\175\217\135 \217\135\216\167\219\140 \216\168\216\185\216\175\219\140 \216\168\216\177\217\133\219\140\218\175\216\177\216\175\217\135\216\140 \218\134\216\177\216\167 \216\168\216\167\216\178\217\134\216\180\216\167\217\134\219\140 \216\177\217\136\219\140 \217\133\217\134 \218\169\216\167\216\177 \217\134\217\133\219\140\218\169\217\134\217\135\216\159! \216\168\216\167 \219\140\218\169 \217\133\217\135\216\167\216\177\216\170 \216\179\216\167\216\175\217\135 \216\168\216\167\216\178\219\140 \216\168\216\177\216\167\219\140 \216\172\216\166\217\136\217\134\218\175 \216\175\216\167\217\136\217\136\217\134 \216\175\216\177\217\136\217\134 \216\175\216\167\217\134\216\172\217\134 \216\180\216\177\217\136\216\185 \217\133\219\140\216\180\217\135 ."))
            ((language fr)
             (string
               "La vie ordinaire de Dawoon bascule le jour o\195\185 il se retrouve invoqu\195\169 dans un monde parall\195\168re, dans lequel il va devoir jouer \195\160 un jeu mortel intitul\195\169 Dungeon Game. Il se retrouve ainsi oblig\195\169 \195\160 faire face \195\160 de dangereuses cr\195\169atures, ainsi qu'\195\160 de nombreux pi\195\168ges mettant constamment sa vie en p\195\169ril. Et comme si cette situation ne suffisait pas, il s'av\195\168re \195\169galement que l'abilit\195\169 dont il a \195\169t\195\169 dot\195\169 est totalement inutile en combat. N\195\169anmoins, apr\195\168s \195\170tre tomb\195\169 dans un pi\195\168ge et avoir myst\195\169rieusement surv\195\169cu, un \195\169trange bug va lui donner de nouvelles comp\195\169tences al\195\169atoires, mais \195\169trangement utiles. Il va devoir redoubler d'astuce pour finir le jeu et pouvoir enfin rentrer chez lui, tout en ayant \195\160 ses c\195\180t\195\169s un Assistant de jeu assoiff\195\169 de sang, et un adorable petit \195\169cureuil. Maintenant qu'il n'a plus aucune r\195\168gle \195\160 suivre avec assiduit\195\169, que va-t-il se passer pour lui dans cet \195\169trange univers ?\
              \n\
              \n---\
              \n- [Official French Translation](https://www.tappytoon.com/fr/comics/dungeon-reset-fr)"))
            ((language ja)
             (string
               "\239\189\162\227\129\147\227\129\174\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\227\129\175\227\131\170\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\129\190\227\129\153\239\189\163 \228\184\128\229\186\166\227\131\151\227\131\172\227\130\164\227\129\151\227\129\159\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\227\130\132\231\189\160\227\129\175\230\172\161\227\129\174\239\189\162\227\131\166\227\131\188\227\130\182\227\131\188\239\189\163\227\129\174\227\129\159\227\130\129\227\129\171\227\131\170\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\130\139\227\128\130 \227\129\151\227\129\139\227\129\151\227\129\157\227\129\174\239\189\162\227\131\170\227\130\187\227\131\131\227\131\136\239\189\163\227\129\140\228\191\186\227\129\171\227\129\175\233\129\169\229\191\156\227\129\149\227\130\140\227\129\170\227\129\132\239\188\129\239\188\159 \231\181\182\227\129\136\227\129\154\227\131\170\227\130\187\227\131\131\227\131\136\227\129\149\227\130\140\227\130\139\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\227\129\167\229\148\175\228\184\128\232\135\170\231\148\177\227\129\174\232\186\171\227\129\168\227\129\170\227\129\163\227\129\159\227\128\140\229\165\143\229\164\154\227\128\141\227\128\130 \227\129\157\227\129\174\229\160\180\227\129\151\227\129\174\227\129\142\227\129\167\230\173\166\232\163\133\227\129\151\227\129\159\239\189\162\227\131\144\227\130\176\239\189\163\228\186\186\233\150\147 \229\174\154\229\178\161\229\165\143\229\164\154\227\129\174\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\233\150\139\230\139\147\230\156\159\227\129\140\229\167\139\227\129\190\227\130\139\227\131\188\227\131\188\239\188\129\
              \n\
              \n---\
              \n- [Official Japanese Translation](https://piccoma.com/web/product/40532)"))
            ((language ko)
             (string
               "[\235\141\152\236\160\132\236\157\180 \235\166\172\236\133\139\235\144\169\235\139\136\235\139\164.]\
              \n\
              \n\237\149\156\235\178\136 \237\148\140\235\160\136\236\157\180\237\149\156 \235\141\152\236\160\132\236\157\180\235\130\152 \237\149\168\236\160\149\236\157\128 \235\139\164\236\157\140 '\236\156\160\236\160\128'\235\147\164\236\157\132 \236\156\132\237\149\180 '\235\166\172\236\133\139'\236\157\180\235\157\188\235\138\148 \234\179\188\236\160\149\236\157\132 \234\177\176\236\185\156\235\139\164.\
              \n\234\183\184 '\235\166\172\236\133\139'\236\157\180, '\235\130\152'\236\151\144\234\178\140\235\138\148 \236\160\129\236\154\169\235\144\152\236\167\128 \236\149\138\235\138\148\235\139\164?!\
              \n\
              \n\
              \n\235\129\138\236\158\132\236\151\134\236\157\180 \235\166\172\236\133\139\235\144\152\235\138\148 \235\141\152\236\160\132\236\151\144\236\132\156 \236\156\160\236\157\188\237\149\152\234\178\140 \236\158\144\236\156\160\235\161\156\236\155\140\236\167\132 \236\161\180\236\158\172.\
              \n\236\149\149\235\143\132\236\160\129\236\157\184 \235\133\184\234\176\128\235\139\164\235\161\156 \235\172\180\236\158\165\237\149\156 '\235\178\132\234\183\184 \236\162\133\236\158\144' \236\160\149\235\139\164\236\154\180\236\157\152 \235\141\152\236\160\132 \234\176\156\236\178\153\234\184\176\234\176\128 \236\139\156\236\158\145\235\144\156\235\139\164!\
              \n\
              \n---\
              \n- [Original Webtoon <Webtoon kakao>](https://webtoon.kakao.com/content/%EB%8D%98%EC%A0%84-%EB%A6%AC%EC%85%8B/2373)"))
            ((language ru)
             (string
              "[\208\152\208\180\208\181\209\130 \208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\176 \208\159\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\209\143.] \208\159\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\208\181 \208\184\208\187\208\184 \208\187\208\190\208\178\209\131\209\136\208\186\208\184, \208\178 \208\186\208\190\209\130\208\190\209\128\209\139\209\133 \208\177\209\139\208\187\208\176 \208\184\208\179\209\128\208\176, \208\191\209\128\208\190\209\133\208\190\208\180\209\143\209\130 \209\129\209\130\208\176\208\180\208\184\209\142 \208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\184 \208\180\208\187\209\143 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\184\209\133 \208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\208\181\208\185.\208\156\208\190\208\182\208\181\209\130, \209\141\209\130\208\176 \194\171\208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\176\194\187 \208\191\209\128\208\184\208\188\208\181\208\189\208\184\208\188\208\176 \208\184 \208\186\208\190 \208\188\208\189\208\181?! \208\149\208\180\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\208\190\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\208\190, \208\186\208\190\209\130\208\190\209\128\208\190\208\181 \209\129\208\178\208\190\208\177\208\190\208\180\208\189\208\190 \208\190\209\130 \208\191\208\190\209\129\209\130\208\190\209\143\208\189\208\189\208\190 \208\191\208\181\209\128\208\181\208\183\208\176\208\191\209\131\209\129\208\186\208\176\208\181\208\188\208\190\208\185 \208\159\208\181\209\137\208\181\209\128\209\139. \208\146\208\190\208\190\209\128\209\131\208\182\208\184\208\178\209\136\208\184\209\129\209\140 \208\179\209\128\208\176\208\189\208\180\208\184\208\190\208\183\208\189\208\190\208\185 \209\129\208\184\208\187\208\190\208\185, \208\167\208\190\208\189 \208\148\208\176 \208\163\208\189 \208\189\208\176\209\135\208\184\208\189\208\176\208\181\209\130 \208\190\209\129\208\178\208\190\208\181\208\189\208\184\208\181 \208\159\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\209\143!"))
            ((language th)
             (string
               "[\224\184\148\224\184\177\224\184\153\224\185\128\224\184\136\224\184\181\224\185\137\224\184\162\224\184\153\224\184\129\224\184\179\224\184\165\224\184\177\224\184\135\224\184\163\224\184\181\224\185\128\224\184\139\224\185\135\224\184\149]  \
              \n\224\185\128\224\184\161\224\184\183\224\185\136\224\184\173\224\184\161\224\184\181\224\184\129\224\184\178\224\184\163\224\185\128\224\184\148\224\184\180\224\184\153\224\184\170\224\184\179\224\184\163\224\184\167\224\184\136\224\184\148\224\184\177\224\184\153\224\185\128\224\184\136\224\184\181\224\185\137\224\184\162\224\184\153\224\185\128\224\184\129\224\184\180\224\184\148\224\184\130\224\184\182\224\185\137\224\184\153, \224\184\129\224\184\177\224\184\154\224\184\148\224\184\177\224\184\129\224\184\151\224\184\184\224\184\129\224\184\173\224\184\162\224\185\136\224\184\178\224\184\135\224\185\128\224\184\163\224\184\180\224\185\136\224\184\161\224\184\151\224\184\179\224\184\135\224\184\178\224\184\153, \224\184\161\224\184\177\224\184\153\224\184\129\224\185\135\224\184\136\224\184\176\224\185\128\224\184\163\224\184\180\224\185\136\224\184\161\224\184\151\224\184\179\224\184\129\224\184\178\224\184\163\224\184\163\224\184\181\224\185\128\224\184\139\224\185\135\224\184\149\224\184\149\224\184\177\224\184\167\224\185\128\224\184\173\224\184\135\224\185\128\224\184\158\224\184\183\224\185\136\224\184\173\224\184\170\224\184\179\224\184\171\224\184\163\224\184\177\224\184\154 \"\224\184\156\224\184\185\224\185\137\224\185\128\224\184\165\224\185\136\224\184\153\" \224\184\132\224\184\153\224\184\149\224\185\136\224\184\173\224\185\132\224\184\155  \
              \n\224\185\129\224\184\149\224\185\136\224\184\151\224\184\167\224\185\136\224\184\178\224\184\129\224\184\178\224\184\163\224\184\163\224\184\181\224\185\128\224\184\139\224\185\135\224\184\149\224\185\128\224\184\171\224\184\165\224\185\136\224\184\178\224\184\153\224\184\177\224\185\137\224\184\153\224\184\148\224\184\177\224\184\153\224\185\131\224\184\138\224\185\137\224\185\132\224\184\161\224\185\136\224\185\132\224\184\148\224\185\137\224\184\129\224\184\177\224\184\154\224\184\137\224\184\177\224\184\153! \224\184\137\224\184\177\224\184\153\224\184\136\224\184\176\224\184\149\224\185\137\224\184\173\224\184\135\224\184\173\224\184\162\224\184\185\224\185\136\224\184\173\224\184\162\224\185\136\224\184\178\224\184\135\224\185\132\224\184\163\224\185\137\224\184\136\224\184\184\224\184\148\224\184\171\224\184\161\224\184\178\224\184\162\224\185\131\224\184\153\224\184\148\224\184\177\224\184\153\224\185\128\224\184\136\224\184\181\224\185\137\224\184\162\224\184\153\224\185\129\224\184\171\224\185\136\224\184\135\224\184\153\224\184\181\224\185\137\224\184\173\224\184\162\224\185\136\224\184\178\224\184\135\224\185\132\224\184\163\224\185\137\224\184\129\224\184\179\224\184\171\224\184\153\224\184\148, \224\184\137\224\184\177\224\184\153, \224\184\136\224\184\177\224\184\135 \224\184\148\224\184\178\224\184\173\224\184\184\224\184\153  \
              \n\"\224\185\128\224\184\136\224\185\137\224\184\178\224\184\130\224\185\137\224\184\173\224\184\156\224\184\180\224\184\148\224\184\158\224\184\165\224\184\178\224\184\148\" \224\185\132\224\184\148\224\185\137\224\185\132\224\184\148\224\185\137\224\185\128\224\184\167\224\184\165\224\184\178\224\185\128\224\184\163\224\184\180\224\185\136\224\184\161\224\184\173\224\184\173\224\184\129\224\184\170\224\184\179\224\184\163\224\184\167\224\184\136\224\184\148\224\184\177\224\184\153\224\185\128\224\184\136\224\184\181\224\185\137\224\184\162\224\184\153\224\185\129\224\184\171\224\185\136\224\184\135\224\184\153\224\184\181\224\185\137\224\185\129\224\184\165\224\185\137\224\184\167!"))
            ((language zh-hk)
             (string
               "\239\188\187\229\137\175\230\156\172\229\141\179\229\176\135\233\135\141\231\189\174\227\128\130\239\188\189\
              \n\
              \n\231\130\186\230\143\144\228\190\155\228\184\139\228\184\128\230\137\185\227\128\140\231\142\169\229\174\182\227\128\141\233\171\148\233\169\151\239\188\140\
              \n\229\183\178\233\128\154\233\129\142\231\154\132\229\137\175\230\156\172\227\128\129\229\183\178\232\167\184\231\153\188\231\154\132\233\153\183\233\152\177\
              \n\233\131\189\230\156\131\231\182\147\233\129\142\229\144\141\231\130\186\233\135\141\231\189\174\231\154\132\233\129\142\231\168\139\227\128\130\
              \n\231\132\182\232\128\140\239\188\140\233\130\163\230\137\128\232\172\130\231\154\132\227\128\140\233\135\141\231\189\174\227\128\141\229\177\133\231\132\182\229\176\141\227\128\140\230\136\145\227\128\141\228\184\141\231\174\161\231\148\168?!\
              \n\
              \n\229\156\168\228\184\141\230\150\183\233\135\141\231\189\174\231\154\132\229\137\175\230\156\172\232\163\161\239\188\140\232\186\171\231\130\186\229\148\175\228\184\128\231\154\132\232\135\170\231\148\177\228\185\139\232\186\171\239\188\140\
              \n\229\143\170\232\131\189\230\138\138\232\139\166\229\138\155\230\180\187\229\129\154\229\165\189\229\129\154\230\187\191\239\188\140\227\128\140\232\190\178\232\181\183\228\190\134\227\128\141\230\173\166\232\163\157\232\135\170\229\183\177\239\188\140\
              \n\227\128\140Bug\228\187\148\227\128\141\233\132\173\229\164\154\233\129\139\231\154\132\229\137\175\230\156\172\233\150\139\229\162\190\232\168\152\229\176\177\230\173\164\229\177\149\233\150\139!\
              \n\
              \n---\
              \n- [Official Traditional Chinese Translation](https://tw.kakaowebtoon.com/content/%E5%89%AF%E6%9C%AC%E9%87%8D%E7%BD%AE/140)"))))
          (is_locked false)
          (links
           (((provider al) (link 116506)) ((provider ap) (link dungeon-reset))
            ((provider kt) (link 56028)) ((provider mu) (link 163555))
            ((provider nu) (link dungeon-reset)) ((provider mal) (link 147438))
            ((provider raw) (link https://page.kakao.com/content/54471153))
            ((provider engtl)
             (link https://www.tappytoon.com/comics/dungeon-reset))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id ea2bc92d-1c26-4930-9b7c-d5c0dc1b6869)
             (attributes
              ((name (((language en) (string Cooking)))) (group theme)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-05-23T20:51:21+00:00)
          (updated_at 2024-06-15T11:56:00+00:00) (version 25)
          (available_translated_languages (en it fa pl th es-la uk hu ar id))
          (latest_uploaded_chapter 34779a25-7428-46e5-8ef6-ae8a0d9412a8)))
        (relationships
         (((id 1c157033-eb0a-494e-95bc-6bf98ca466ca) (type_ author))
          ((id 376a4fbd-f696-495a-bc1f-d8b1b812793c) (type_ author))
          ((id 1c157033-eb0a-494e-95bc-6bf98ca466ca) (type_ artist))
          ((id 359c697e-39fe-4628-8128-f06a82afbabe) (type_ cover_art)))))
       ((id 562ebdf1-a7d3-4f11-9a25-4b90eb1a4542)
        (attributes
         ((title
           (((language en) (string "My love for my roommate is one-sided"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\144\140\229\177\133\228\186\186\227\129\171\231\137\135\230\128\157\227\129\132\227\129\151\227\129\166\227\130\139\231\153\190\229\144\136\230\188\171\231\148\187")))
            (((language ja-ro)
              (string "Doukyonin ni Kataomoi Shiteru Yuri Manga")))))
          (description ()) (is_locked false)
          (links
           (((provider raw)
             (link https://www.pixiv.net/user/8994933/series/126572))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status completed) (year ())
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-21T17:07:10+00:00)
          (updated_at 2024-07-22T14:02:25+00:00) (version 5)
          (available_translated_languages (en))
          (latest_uploaded_chapter de8056c9-4986-481a-a187-7d3be128ec04)))
        (relationships
         (((id 7dcd1fda-4979-4e41-9bb5-46f28911ecab) (type_ author))
          ((id 7dcd1fda-4979-4e41-9bb5-46f28911ecab) (type_ artist))
          ((id a0440614-555e-4c24-8e83-2b831b4cb218) (type_ cover_art))
          ((id 225dc03c-dee8-4e05-a2b4-62337c1e8bd9) (type_ creator)))))
       ((id 540f5728-6521-4a93-8eb1-059c1a6585e1)
        (attributes
         ((title
           (((language en) (string "The Shikisaki Sisters Want to Be Exposed"))))
          (alt_titles
           ((((language ja-ro) (string "Shikisaki Shimai wa Abakaretai")))
            (((language ja)
              (string
               "\229\155\155\229\173\163\229\180\142\229\167\137\229\166\185\227\129\175\227\129\130\227\129\176\227\129\139\227\130\140\227\129\159\227\129\132")))))
          (description
           (((language en)
             (string
              "One day, Tarou Yamada, who runs a detective business, slips on a banana peel and reincarnates into Tsukushi Shikisaki, the younger brother of three beautiful big-breasted sisters who will all die on the same day. As he spends time surrounded by the three beautiful sisters, he finds out that the boy he is reincarnated as will be killed by one of the three sisters ...!?"))
            ((language ja)
             (string
              "\230\142\162\229\129\181\230\165\173\227\130\146\229\150\182\227\130\128\229\177\177\231\148\176\229\164\170\233\131\142\227\129\175\227\129\130\227\130\139\230\151\165\227\128\129\227\131\144\227\131\138\227\131\138\227\129\174\231\154\174\227\129\171\232\182\179\227\130\146\230\187\145\227\130\137\227\129\155\227\129\166\227\129\151\227\129\190\227\129\132\227\128\129\229\144\140\230\151\165\227\129\171\229\145\189\227\130\146\232\144\189\227\129\168\227\129\151\227\129\159\231\190\142\233\186\151\228\184\137\229\167\137\229\166\185\227\129\174\229\188\159\227\131\187\229\155\155\229\173\163\229\180\142\227\129\164\227\129\143\227\129\151\227\129\171\232\187\162\231\148\159\227\130\146\227\129\151\227\129\166\227\129\151\227\129\190\227\129\134\227\128\130\231\190\142\228\186\186\228\184\137\229\167\137\229\166\185\227\129\171\229\155\178\227\129\190\227\130\140\227\129\166\233\129\142\227\129\148\227\129\153\227\129\147\227\129\168\227\129\171\227\129\170\227\130\139\227\129\140\227\128\129\229\155\155\229\173\163\229\180\142\227\129\164\227\129\143\227\129\151\227\129\140\228\184\137\229\167\137\229\166\185\227\129\174\232\170\176\227\129\139\227\129\171\230\174\186\227\129\149\227\130\140\227\129\159\227\129\147\227\129\168\227\129\171\230\176\151\227\129\140\227\129\164\227\129\132\227\129\166\227\129\151\227\129\190\227\129\132\226\128\166!?"))))
          (is_locked false)
          (links
           (((provider al) (link 139961))
            ((provider ap) (link shikizaki-shimai-wa-abakaretai))
            ((provider bw) (link series/346649/list))
            ((provider mu) (link 192445))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0B28TPTQW))
            ((provider cdj)
             (link
              https://www.cdjapan.co.jp/searchuni?fq.category=UD%3A14&q=%E5%9B%9B%E5%AD%A3%E5%B4%8E%E5%A7%89%E5%A6%B9%E3%81%AF%E3%81%82%E3%81%B0%E3%81%8B%E3%82%8C%E3%81%9F%E3%81%84&order=reldesc&opt.exclude_prx=on))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/696297/))
            ((provider mal) (link 144063))
            ((provider raw) (link https://youngjump.jp/manga/shikizaki/))))
          (original_language ja) (last_volume (5)) (last_chapter (62))
          (publication_demographic (seinen)) (status completed) (year (2021))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id aafb99c1-7f60-43fa-b75f-fc9502ce29c7)
             (attributes
              ((name (((language en) (string Harem)))) (group theme) (version 1))))
            ((id ddefd648-5140-4e5f-ba18-4eca4071d19b)
             (attributes
              ((name (((language en) (string Shota)))) (group theme) (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-12-11T22:33:49+00:00)
          (updated_at 2024-04-29T06:22:37+00:00) (version 15)
          (available_translated_languages (en pt-br))
          (latest_uploaded_chapter 1fbb37b6-994b-4dc8-ba93-9af4f623aa83)))
        (relationships
         (((id 86de657e-feb4-4f74-8669-fb2a48101799) (type_ author))
          ((id 86de657e-feb4-4f74-8669-fb2a48101799) (type_ artist))
          ((id 084a89c9-d91a-4551-97bb-a8480f90fab0) (type_ cover_art))
          ((id ac898618-3611-4a5d-9e6c-c64da342a8b9) (type_ creator)))))
       ((id b64cdcc2-b4e9-48f7-b45e-7f6e80aabd3a)
        (attributes
         ((title (((language en) (string "Yowa Yowa Sensei"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\130\136\227\130\143\227\130\136\227\130\143\229\133\136\231\148\159")))
            (((language en) (string "Weak-kneed Teacher")))
            (((language ru)
              (string
               "\208\163\209\135\208\184\209\130\208\181\208\187\209\140 \208\129\208\178\208\176\209\145\208\178\208\176")))
            (((language ja-ro) (string "Yowayowa Sensei")))))
          (description
           (((language en)
             (string
              "It's the start of a new school year. The new homeroom teacher for Abikura-kun, a second-year high school boy, is Hiyori Hiwamura, who is known as a \"Scary Teacher\", rumored to curse you if she gets offended! One day after school, Abikura-kun witnessed the other side of \"YowaYowa-sensei\"... and he is shocked by the gap between reputation and reality! The opening of a romantic comedy that will stir up your protective instincts!!"))
            ((language ja)
             (string
              "\230\150\176\229\173\166\230\156\159\227\128\1302\229\185\180\231\148\159\227\129\171\233\128\178\231\180\154\227\129\151\227\129\159\231\148\183\229\173\144\233\171\152\230\160\161\231\148\159\227\131\187\233\152\191\230\175\148\229\128\137\227\129\143\227\130\147\233\129\148\227\129\174\227\130\175\227\131\169\227\130\185\230\139\133\228\187\187\227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\175\227\128\129\230\169\159\229\171\140\227\130\146\230\144\141\227\129\173\227\130\140\227\129\176\229\145\170\227\130\143\227\130\140\227\130\139\227\129\168\229\153\130\227\129\174\233\128\154\231\167\176\227\128\142\227\129\147\227\130\143\227\129\147\227\130\143\229\133\136\231\148\159\227\128\143\227\129\147\227\129\168\227\128\129\233\182\184\230\157\145\227\129\178\227\130\136\227\130\138\229\133\136\231\148\159\227\129\160\227\129\163\227\129\159\239\188\129 \227\129\157\227\130\147\227\129\170\227\128\129\227\128\142\227\129\147\227\130\143\227\129\147\227\130\143\229\133\136\231\148\159\227\128\143\227\129\174\232\163\143\227\129\174\228\184\128\233\157\162\227\130\146\227\128\129\227\129\130\227\130\139\230\151\165\227\129\174\230\148\190\232\170\178\229\190\140\227\128\129\231\155\174\230\146\131\227\129\151\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159\233\152\191\230\175\148\229\128\137\227\129\143\227\130\147\227\129\175\226\128\166\226\128\166\227\128\130\227\129\190\227\129\149\227\129\139\227\129\174\227\130\174\227\131\163\227\131\131\227\131\151\227\129\171\230\130\182\231\181\182\229\191\133\232\135\179\239\188\129 \227\129\130\227\129\170\227\129\159\227\129\174\229\186\135\232\173\183\230\172\178\227\130\146\230\142\187\227\129\141\231\171\139\227\129\166\227\130\139\227\128\129\227\130\136\227\130\143\227\130\136\227\130\143\227\131\169\227\131\150\227\130\179\227\131\161\233\150\139\229\185\149!!"))))
          (is_locked false)
          (links
           (((provider al) (link 157128)) ((provider ap) (link yowa-yowa-sensei))
            ((provider bw) (link series/403854))
            ((provider kt) (link yowa-yowa-sensei))
            ((provider mu) (link v0r04db))
            ((provider amz) (link https://www.amazon.co.jp/dp/B0BZSLSMZD))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-2829792))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/749896/))
            ((provider mal) (link 154376))
            ((provider raw)
             (link https://pocket.shonenmagazine.com/episode/316190246961478008))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2022))
          (content_rating erotica)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-11-16T20:53:33+00:00)
          (updated_at 2024-07-05T21:37:26+00:00) (version 31)
          (available_translated_languages (fr es-la en vi id))
          (latest_uploaded_chapter 03976226-2935-4136-9081-fd8edc08a66f)))
        (relationships
         (((id f9a2f107-5a50-4a06-849d-233260819a8c) (type_ author))
          ((id f9a2f107-5a50-4a06-849d-233260819a8c) (type_ artist))
          ((id 6cee65c8-eabd-4a40-8543-97a1da4c54b1) (type_ cover_art))
          ((id 0218ac4d-c69e-4670-8ea0-3bb161a3ef8d) (type_ creator)))))
       ((id cb945ce8-b7a8-4e84-bd06-bbe0d2b170f9)
        (attributes
         ((title
           (((language en)
             (string
              "Watashi wa Gotsugou Shugi na Kaiketsu Tantou no Oujo de Aru"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\167\129\227\129\175\227\129\148\233\131\189\229\144\136\228\184\187\231\190\169\227\129\170\232\167\163\230\177\186\230\139\133\229\189\147\227\129\174\231\142\139\229\165\179\227\129\167\227\129\130\227\130\139")))
            (((language en) (string "The Princess of Convenient Plot Devices")))
            (((language es)
              (string "Soy una princesa oportunista encargada de resolver cosas")))
            (((language ru)
              (string
               "\208\175 \208\191\209\128\208\184\208\189\209\134\208\181\209\129\209\129\208\176, \208\190\209\130\208\178\208\181\209\130\209\129\209\130\208\178\208\181\208\189\208\189\208\176\209\143 \208\183\208\176 \209\131\209\128\208\181\208\179\209\131\208\187\208\184\209\128\208\190\208\178\208\176\208\189\208\184\208\181 \208\190\208\177\209\129\209\130\208\190\209\143\209\130\208\181\208\187\209\140\209\129\209\130\208\178")))
            (((language ru)
              (string
               "\208\156\208\181\209\128\208\186\208\176\208\189\209\130\208\184\208\187\209\140\208\189\208\176\209\143 \208\191\209\128\208\184\208\189\209\134\208\181\209\129\209\129\208\176 \208\190\209\130\208\178\208\181\209\135\208\176\208\181\209\130 \208\183\208\176 \209\128\208\181\209\136\208\181\208\189\208\184\208\181 \208\191\209\128\208\190\208\177\208\187\208\181\208\188")))
            (((language ko)
              (string
               "\235\130\152\235\138\148 \237\142\184\236\157\152\236\163\188\236\157\152\236\160\129 \237\149\180\234\178\176 \235\139\180\235\139\185 \236\153\149\235\133\128\235\161\156\236\134\140\236\157\180\235\139\164")))
            (((language zh)
              (string
               "\230\136\145\230\136\144\228\184\186\228\186\134\232\167\163\229\134\179\229\137\167\230\131\133\233\156\128\230\177\130\231\154\132\231\154\135\229\165\179\232\167\146\232\137\178")))
            (((language en)
              (string
               "I'm an Opportunistic Princess in Charge of Solving Things")))))
          (description
           (((language en)
             (string
              "After reincarnating into her favorite BL novel, Maki (now Octavia) has the perfect opportunity to fangirl over her favorite fictional couple, Sil and Prince Sirius, in real life\226\128\148except she\226\128\153s Sirius\226\128\153s sister?! If that isn\226\128\153t awkward enough, she\226\128\153s expected to give up her firstborn child to be their heir! But the new Octavia won\226\128\153t settle for a political marriage just to produce a baby. Her brother overcame many obstacles to be with the man of his dreams, and Octavia is prepared to do the same! Of course, she actually has to find a guy first\226\128\166"))))
          (is_locked false)
          (links
           (((provider al) (link 113588)) ((provider bw) (link series/235281))
            ((provider kt) (link 55898)) ((provider mu) (link 158658))
            ((provider nu)
             (link i-am-a-princess-responsible-for-settling-circumstances))
            ((provider amz)
             (link
              "https://www.amazon.co.jp/\231\167\129\227\129\175\227\129\148\233\131\189\229\144\136\228\184\187\231\190\169\227\129\170\232\167\163\230\177\186\230\139\133\229\189\147\227\129\174\231\142\139\229\165\179\227\129\167\227\129\130\227\130\139-\227\131\149\227\131\173\227\131\188\227\130\185-\227\130\179\227\131\159\227\131\131\227\130\175-\231\177\179\231\148\176-\229\146\140\228\189\144/dp/4040643089/ref=pd_bxgy_img_2/355-3610460-9918963?_encoding=UTF8&pd_rd_i=4040643089&pd_rd_r=9861b42a-0036-4b7d-9cc7-a2276bd3ef2f&pd_rd_w=N6Cit&pd_rd_wg=6RLtR&pf_rd_p=587b16be-0f5e-4017-ba4e-8771a0be2909&pf_rd_r=58N7HX7VN622CSSQZCNV&psc=1&refRID=58N7HX7VN622CSSQZCNV"))
            ((provider mal) (link 123797))
            ((provider raw)
             (link
              https://comic-walker.com/contents/detail/KDCW_FL00201307010000_68/))
            ((provider engtl)
             (link
              https://yenpress.com/titles/9781975348748-the-princess-of-convenient-plot-devices-vol-1-manga))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shoujo)) (status ongoing) (year (2019))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-04-09T16:12:48+00:00)
          (updated_at 2023-10-29T21:59:39+00:00) (version 18)
          (available_translated_languages (en es-la pt-br th))
          (latest_uploaded_chapter 12d5a6a3-d8e6-4438-ba24-4d4b5a957793)))
        (relationships
         (((id e86a0b11-3596-4342-9233-3520f895d43b) (type_ author))
          ((id 905dea3e-e77c-4b12-833a-c5ebcadd5736) (type_ artist))
          ((id c4d0a326-afa7-4abd-8455-fe19752e2f88) (type_ cover_art)))))
       ((id afa40bc8-34fa-4b03-a1e1-50f4eb79f9da)
        (attributes
         ((title
           (((language en)
             (string
              "My Father Has Become a Beautiful Girl and It's a Lot of Pain"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\136\182\232\166\170\227\129\140\231\190\142\229\176\145\229\165\179\227\129\171\227\129\170\227\129\163\227\129\166\227\129\151\227\129\190\227\129\163\227\129\166\232\137\178\227\128\133\227\129\164\227\130\137\227\129\132")))
            (((language ja-ro)
              (string "Chichioya ga Bishoujo ni Natte Shimatte Iroiro Tsurai")))
            (((language en)
              (string
               "My Father Turned into a Beautiful Girl and It's a Lot of Trouble.")))
            (((language ru)
              (string
               "\208\156\208\190\208\185 \208\190\209\130\208\181\209\134 \208\191\209\128\208\181\208\178\209\128\208\176\209\130\208\184\208\187\209\129\209\143 \208\178 \208\186\209\128\208\176\209\129\208\184\208\178\209\131\209\142 \208\180\208\181\208\178\209\131\209\136\208\186\209\131 \208\184 \209\141\209\130\208\190 \208\180\208\190\209\129\209\130\208\176\208\178\208\187\209\143\208\181\209\130 \208\188\208\189\208\190\208\179\208\190 \209\133\208\187\208\190\208\191\208\190\209\130.")))))
          (description
           (((language en)
             (string
              "A successful but annoying dad got gender-swapped and became a beautiful girl. Now he has lost his job and has to depend on his son while slowly starting anew."))
            ((language ru)
             (string
               "\208\158\208\180\208\189\208\176\208\182\208\180\209\139 \208\178 \208\186\208\190\208\188\208\189\208\176\209\130\209\131 \208\162\208\176\209\134\209\131\208\184 \208\183\208\176\209\133\208\190\208\180\208\184\209\130 \208\186\209\128\208\176\209\129\208\184\208\178\208\176\209\143 \208\180\208\181\208\178\209\131\209\136\208\186\208\176... \208\184, \208\186 \208\181\208\179\208\190 \209\131\208\180\208\184\208\178\208\187\208\181\208\189\208\184\209\142 \208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143 \208\181\208\179\208\190 \208\190\209\130\209\134\208\190\208\188, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\191\208\190\208\187\208\189\208\190\209\129\209\130\209\140\209\142 \208\184\208\183\208\188\208\181\208\189\208\184\208\187\209\129\209\143 \208\184\208\183-\208\183\208\176 \209\136\208\190\208\186\208\176 \208\190\209\130 \209\131\208\178\208\190\208\187\209\140\208\189\208\181\208\189\208\184\209\143 \209\129 \209\128\208\176\208\177\208\190\209\130\209\139! !\
              \n\208\165\208\190\209\130\209\143 \208\190\208\189 \208\184 \209\128\208\176\209\129\209\130\208\181\209\128\209\143\208\189 \208\191\208\181\209\128\208\181\208\180 \209\129\208\178\208\190\208\184\208\188 \208\190\209\130\209\134\208\190\208\188, \208\191\208\190\209\130\208\181\209\128\209\143\208\178\209\136\208\184\208\188 \208\178\209\129\208\181 (?), \208\188\208\181\208\189\209\143\209\142\209\130\209\129\209\143 \208\187\208\184 \208\188\208\176\208\187\208\190-\208\191\208\190\208\188\208\176\208\187\209\131 \208\190\209\130\208\189\208\190\209\136\208\181\208\189\208\184\209\143 \208\188\208\181\208\182\208\180\209\131 \209\128\208\190\208\180\208\184\209\130\208\181\208\187\208\181\208\188 \208\184 \209\128\208\181\208\177\208\181\208\189\208\186\208\190\208\188, \208\186\208\190\209\130\208\190\209\128\209\139\208\181 \209\128\208\176\208\189\209\140\209\136\208\181 \208\177\209\139\208\187\208\184 \208\180\208\176\208\187\208\181\208\186\208\184\208\188\208\184? ? ?\
              \n\208\158\209\130\208\181\209\134 \208\162\208\176\209\134\209\131\208\184 \208\191\208\190\209\130\208\181\209\128\209\143\208\187 \208\178\209\129\208\181. \208\162\208\176\209\134\209\131\209\143 \209\129 \208\189\208\181\208\180\208\190\209\131\208\188\208\181\208\189\208\184\208\181\208\188 \209\129\208\188\208\190\209\130\209\128\208\184\209\130 \208\189\208\176 \208\190\209\130\209\134\208\176, \208\189\208\190 \209\128\208\176\209\129\209\129\209\130\208\190\209\143\208\189\208\184\208\181 \208\188\208\181\208\182\208\180\209\131 \208\190\209\130\209\134\208\190\208\188 \208\184 \209\129\209\139\208\189\208\190\208\188 \208\191\208\190\209\129\209\130\208\181\208\191\208\181\208\189\208\189\208\190 \209\129\208\190\208\186\209\128\208\176\209\137\208\176\208\181\209\130\209\129\209\143...?\
              \n\208\158\209\130\208\181\209\134 \226\128\147 \209\141\209\130\208\190 \208\188\208\176\209\130\209\140, \208\176 \209\129\209\139\208\189 \226\128\147 \209\141\209\130\208\190 \208\190\209\130\208\181\209\134? \208\157\208\181\209\130, \208\188\208\190\208\185 \208\187\209\131\209\135\209\136\208\184\208\185 \208\180\209\128\209\131\208\179 \226\128\148 \208\188\208\190\208\185 \208\190\209\130\208\181\209\134, \208\176 \208\188\208\190\208\185 \208\190\209\130\208\181\209\134 \226\128\148 \208\188\208\190\208\185 \208\187\209\131\209\135\209\136\208\184\208\185 \208\180\209\128\209\131\208\179...?\
              \n\208\157\208\190\208\178\208\176\209\143 \208\186\208\190\208\188\208\181\208\180\208\184\209\143 TS, \208\186\208\190\209\130\208\190\209\128\208\176\209\143, \208\189\208\181\209\129\208\188\208\190\209\130\209\128\209\143 \208\189\208\176 \209\130\208\190, \209\135\209\130\208\190 \208\178 \209\129\208\190\209\134\208\184\208\176\208\187\209\140\208\189\209\139\209\133 \209\129\208\181\209\130\209\143\209\133 \208\181\208\181 \208\189\208\176\208\183\209\139\208\178\208\176\209\142\209\130 \"\209\132\208\184\208\183\208\184\208\190\208\187\208\190\208\179\208\184\209\135\208\181\209\129\208\186\208\184 \208\189\208\181\208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190\208\185\", \208\189\208\176 \209\129\208\176\208\188\208\190\208\188 \208\180\208\181\208\187\208\181 \209\143\208\178\208\187\209\143\208\181\209\130\209\129\209\143 \209\131\208\180\208\184\208\178\208\184\209\130\208\181\208\187\209\140\208\189\208\190\208\185 \208\184\209\129\209\130\208\190\209\128\208\184\208\181\208\185 \208\190\209\130\209\134\208\176 \208\184 \209\129\209\139\208\189\208\176, \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \209\129\208\190\208\179\209\128\208\181\208\181\209\130 \208\178\208\176\209\136\208\181 \209\129\208\181\209\128\208\180\209\134\208\181!!!"))))
          (is_locked false)
          (links
           (((provider amz)
             (link
              "https://www.amazon.co.jp/-/en/\230\160\185\231\148\176\229\149\147\229\143\178-ebook/dp/B0CLZ4WV6S"))
            ((provider raw)
             (link https://twitter.com/dorori_k/status/1698894705554235640))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 2bd2e8d0-f146-434a-9b51-fc9ff2c5fe6a)
             (attributes
              ((name (((language en) (string Genderswap)))) (group theme)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 92d6d951-ca5e-429c-ac78-451071cbf064)
             (attributes
              ((name (((language en) (string "Office Workers")))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2023-12-04T10:36:47+00:00)
          (updated_at 2024-06-07T19:52:54+00:00) (version 9)
          (available_translated_languages (ru es en))
          (latest_uploaded_chapter 1ead4f09-9921-4d89-a772-1513010a92da)))
        (relationships
         (((id 784da853-ef1d-4e17-904c-fcecfd31c27c) (type_ author))
          ((id 784da853-ef1d-4e17-904c-fcecfd31c27c) (type_ artist))
          ((id 9600e408-27e6-44e2-8fee-247b676a733b) (type_ cover_art))
          ((id 15c716cd-9423-46a5-83b1-67905b3b6695) (type_ creator)))))
       ((id 88fe360b-68dc-4438-a506-12f6cdf46733)
        (attributes
         ((title (((language en) (string "Kiichi!! VS"))))
          (alt_titles
           ((((language fr) (string "Ki-itchi VS")))
            (((language ja) (string "\227\130\173\227\131\188\227\131\129VS")))))
          (description
           (((language en)
             (string
               "*Second arc of Kiichi!!, taking place 10 years after the events of volume 9.*\
              \n\
              \nEver more uncompromising in the face of injustice, Kiichi has become a star. Known around the world for shaking the Japanese establishment, he doesn't intend to stop there. Now at the head of a big company, between school of thought and mafia, whose members number in the thousands, he wants once again to get the population moving, even if it means provoking the powerful of the country!"))
            ((language pt-br)
             (string
              "Abandonado a si mesmo em tenra idade nas partes mais pobres do Jap\195\163o de hoje, Kiichi aprende como sobreviver por conta pr\195\179pria. Como um adolescente, como ele pode se adaptar a uma sociedade cujas regras ele rejeita? A menos que ele crie suas pr\195\179prias regras ... Kiichi, um \195\173cone bruto de for\195\167a e integridade, fica sozinho contra a injusti\195\167a do mundo e se torna um personagem inesquec\195\173vel."))))
          (is_locked false)
          (links
           (((provider al) (link 45547)) ((provider ap) (link kiichi-vs))
            ((provider bw) (link series/56296/list))
            ((provider kt) (link kiichi-vs)) ((provider mu) (link 26575))
            ((provider amz)
             (link https://www.amazon.co.jp/gp/product/B074CGYZWK))
            ((provider mal) (link 15547))
            ((provider raw) (link https://manga-zero.com/product/1196))))
          (original_language ja) (last_volume (11)) (last_chapter (111))
          (publication_demographic (seinen)) (status completed) (year (2007))
          (content_rating suggestive)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 5ca48985-9a9d-4bd8-be29-80dc0303db72)
             (attributes
              ((name (((language en) (string Crime)))) (group genre) (version 1))))
            ((id 97893a4c-12af-4dac-b6be-0dffb353568e)
             (attributes
              ((name (((language en) (string "Sexual Violence"))))
               (group content) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id df33b754-73a3-4c54-80e6-1a74a8058539)
             (attributes
              ((name (((language en) (string Police)))) (group theme)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-12-25T06:32:47+00:00)
          (updated_at 2024-01-22T06:15:55+00:00) (version 17)
          (available_translated_languages (en vi pt-br))
          (latest_uploaded_chapter 8d374981-6179-473a-a1ed-fc1e06fb4b33)))
        (relationships
         (((id 96eb3d6a-c20c-42b2-97ee-cfd6074e1773) (type_ author))
          ((id 96eb3d6a-c20c-42b2-97ee-cfd6074e1773) (type_ artist))
          ((id 3b5fd1f0-999f-43a4-a832-4b499e3e0c55) (type_ cover_art))
          ((id 8576a58c-a3ee-4206-beb9-b371169f8d8c) (type_ manga))
          ((id d46b1308-0be6-41a5-8ce2-f043ef00d051) (type_ creator)))))
       ((id f6871b16-412c-40a5-94c2-7a70d76d9620)
        (attributes
         ((title (((language en) (string "The Anti-Destiny Girl"))))
          (alt_titles
           ((((language zh)
              (string
               "\233\128\134\229\164\169\229\171\161\229\165\179\239\188\154\228\187\153\229\176\138\239\188\140\229\174\160\228\184\138\229\164\169\239\188\129")))))
          (description
           (((language en)
             (string
              "Zhao Menglin was reborn as a wimpy daughter of an aristocratic family with inferior body constitution which can't cultivate immortal. She was framed by her stepmother, detested by her younger brother, and looked down upon by all the others! Through all the adversities, she met a mysterious celestial master who took her to the higher stage of cultivation and counterattacked all the humiliations. Eh? Why does the celestial master look her... in such a spoiled way?"))
            ((language fr)
             (string
               "Zhao Menglin rena\195\174t en tant que fille d'une famille aristocratique avec une constitution corporelle inf\195\169rieure qui ne peut pas cultiver l'immortalit\195\169.   \
              \nElle est pi\195\169g\195\169e par sa belle-m\195\168re, d\195\169test\195\169e par son jeune fr\195\168re, et m\195\169pris\195\169e par tous les autres !   \
              \n\195\128 travers toutes les adversit\195\169s, elle va rencontrer un myst\195\169rieux ma\195\174tre c\195\169leste qui l'am\195\168neau stade sup\195\169rieur de la culture et a contre-attaque toutes les humiliations.   \
              \nHein ? Pourquoi le ma\195\174tre c\195\169leste la regarde-t-il\226\128\166 d'une mani\195\168re si perverse ?"))))
          (is_locked false)
          (links
           (((provider mu) (link k3hfq5c))
            ((provider raw) (link https://ac.qq.com/Comic/comicInfo/id/643900))))
          (original_language zh) (last_volume ()) (last_chapter (89))
          (publication_demographic (shoujo)) (status completed) (year (2019))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 292e862b-2d17-4062-90a2-0356caa4ae27)
             (attributes
              ((name (((language en) (string "Time Travel")))) (group theme)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-11-27T22:07:38+00:00)
          (updated_at 2024-06-19T20:10:22+00:00) (version 3)
          (available_translated_languages (fr))
          (latest_uploaded_chapter c28cf7ed-8be5-4629-927b-dd92ca28a8a9)))
        (relationships
         (((id d5038d9e-0f0e-40e8-bcf3-aeb1d429f346) (type_ author))
          ((id a8546f48-49c6-4d53-b90e-de4d5ce8b1c9) (type_ artist))
          ((id ff7b29ef-a0c9-46b1-976e-65803bfda37c) (type_ cover_art)))))
       ((id a8b65a50-70e7-4f4f-93c0-9b5494b2b4bf)
        (attributes
         ((title (((language en) (string "Brother's Sick Love"))))
          (alt_titles
           ((((language zh)
              (string
               "\229\191\189\229\166\130\228\184\128\229\164\156\231\151\133\229\168\135\230\157\165")))
            (((language zh-ro) (string "Hu Ru Yi Ye Bing Jiao")))))
          (description
           (((language en)
             (string
              "Yu Xiang unfortunately transmigrates into a merchant's daughter, who was mistakenly taken to the marquis manor at birth. She is immediately disabled, and carries the nickname of 'disaster star'. Helplessly, she can only cling to her older brother, the marquis, in hopes of surviving, and wait for the true master to return so she can give way. Years later, when the true master returns to the manor, Yu Xiang prepares to leave. however, she finds out her clinging technique is too good, that her marquis brother won't let her leave!"))
            ((language fr)
             (string
               "Yu Xiang donne, handicap\195\169e, \195\169change son coeur avec celui de son fr\195\168re. \
              \nApr\195\168s sa mort, elle se r\195\169incarne dans le corps d'une fille qui porte le m\195\170me nom, est paralys\195\169e comme elle et qui est surnomm\195\169e l'\195\169toile malchanceuse. \
              \nYu Xiang r\195\169alise alors qu'elle est dans le roman qu'elle lisait avant de mourir. Synopsis du roman en question : Yu Xiang, fille de marchand a \195\169t\195\169 \195\169chang\195\169e \195\160 la naissance avec la fille d'un Seigneur."))
            ((language zh)
             (string
              "\232\153\158\232\165\132\229\190\136\228\184\141\229\185\184\231\169\191\230\136\144\228\186\134\232\162\171\230\138\177\229\136\176\228\190\175\229\186\156\231\154\132\229\149\134\229\174\182\229\165\179\239\188\140\228\184\128\230\157\165\229\176\177\229\143\140\232\133\191\230\174\139\229\186\159\239\188\140\232\132\145\232\162\139\228\184\138\232\191\152\233\161\182\231\157\128\228\184\170\226\128\152\228\184\167\233\151\168\230\152\159\226\128\153\231\154\132\231\167\176\229\143\183\227\128\130 \230\151\160\229\165\136\228\185\139\228\184\139\229\143\170\229\190\151\231\137\162\231\137\162\230\138\177\228\189\143\228\190\175\231\136\183\229\147\165\229\147\165\231\154\132\229\164\167\232\133\191\239\188\140\229\133\136\230\138\138\230\151\165\229\173\144\230\183\183\228\184\139\229\142\187\239\188\140\231\173\137\230\173\163\228\184\187\229\132\191\229\155\158\230\157\165\229\176\177\233\186\187\230\186\156\231\154\132\232\174\169\228\189\141\227\128\130 \229\135\160\229\185\180\228\185\139\229\144\142\230\173\163\228\184\187\229\132\191\229\155\158\229\189\146\239\188\140\232\153\158\232\165\132\229\140\133\232\162\177\230\172\190\230\172\190\229\135\134\229\164\135\232\181\176\228\186\186\239\188\140\229\141\180\229\143\145\231\142\176\230\138\177\229\164\167\232\133\191\231\154\132\230\138\128\230\156\175\229\164\170\228\184\147\228\184\154\239\188\140\228\190\175\231\136\183\229\147\165\229\147\165\228\184\141\232\174\169\232\181\176\228\186\134\239\188\129"))))
          (is_locked false)
          (links
           (((provider ap) (link brothers-sick-love))
            ((provider mu) (link 188626))
            ((provider nu) (link the-yandere-came-during-the-night))
            ((provider raw)
             (link https://www.kuaikanmanhua.com/web/topic/11989/))))
          (original_language zh) (last_volume ("")) (last_chapter (150))
          (publication_demographic ()) (status completed) (year (2021))
          (content_rating safe)
          (tags
           (((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id d14322ac-4d6f-4e9b-afd9-629d5f4d8a41)
             (attributes
              ((name (((language en) (string Villainess)))) (group theme)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-10-16T04:18:23+00:00)
          (updated_at 2024-07-27T18:51:04+00:00) (version 8)
          (available_translated_languages (en fr))
          (latest_uploaded_chapter 22ecd044-4466-4a4d-b21f-73e1576039bf)))
        (relationships
         (((id 8e9c75c2-e967-4fb9-a803-d8462b53a068) (type_ author))
          ((id 9512b9ac-c1e2-4b81-8d43-be6b5116e3c9) (type_ author))
          ((id 43bb8e22-7e23-4805-a47e-e66fdab05eff) (type_ artist))
          ((id 9512b9ac-c1e2-4b81-8d43-be6b5116e3c9) (type_ artist))
          ((id a9f45409-b624-4feb-835a-07eebb679b77) (type_ cover_art))
          ((id 1d40559c-0ba9-459c-b7e9-2607ca037753) (type_ creator)))))
       ((id edaae213-67c7-4a6c-ad5f-141001891741)
        (attributes
         ((title (((language en) (string Yu-Gi-Oh!))))
          (alt_titles
           ((((language ja-ro) (string "Yu\226\152\134Gi\226\152\134Oh")))
            (((language ru)
              (string
               "\208\154\208\190\209\128\208\190\208\187\209\140 \208\184\208\179\209\128")))
            (((language ja)
              (string
               "\233\129\138\226\152\134\230\136\175\226\152\134\231\142\139")))
            (((language ja) (string "\233\129\138\230\136\175\231\142\139")))
            (((language ko) (string "\236\156\160\237\157\172\236\153\149")))
            (((language en) (string "The King of Games")))
            (((language th)
              (string
               "\224\185\128\224\184\129\224\184\161\224\184\129\224\184\165\224\184\132\224\184\153\224\184\173\224\184\177\224\184\136\224\184\137\224\184\163\224\184\180\224\184\162\224\184\176")))
            (((language sv) (string spelkungen)))
            (((language ru) (string "\208\174:-\208\179\208\184-\208\190:")))
            (((language fi) (string "Pelien kuningas")))
            (((language de) (string "K\195\182nig der Spiele")))
            (((language vi) (string "Vua Tr\195\178 Ch\198\161i")))
            (((language pt) (string "rei dos jogos")))
            (((language fr) (string "Le Roi des jeux")))
            (((language es) (string "El rey de los juegos")))
            (((language sr) (string "\208\136\209\131\208\179\208\184\208\190")))
            (((language bg) (string "\208\174-\208\147\208\184-\208\158!")))
            (((language bg)
              (string
               "\209\134\208\176\209\128 \208\189\208\176 \208\184\208\179\209\128\208\184\209\130\208\181")))
            (((language da) (string "Spillenes Konge")))
            (((language ro) (string "Game King")))
            (((language nl) (string "Koning der Spellen")))
            (((language el) (string "Game King")))
            (((language hu) (string "A J\195\161t\195\169kok Kir\195\161lya")))
            (((language fa)
              (string "\219\140\217\136-\218\175\219\140-\216\167\217\136")))
            (((language ar)
              (string
               "\217\138\217\136\216\186\217\138 \217\133\217\132\217\131 \216\167\217\132\217\132\216\185\216\168\216\169")))
            (((language zh-hk) (string "\233\129\138\230\136\178\231\142\139")))
            (((language zh) (string "\233\129\138\230\136\178\231\142\139")))
            (((language zh-ro) (string "I\195\187-h\195\172-\195\180ng")))
            (((language id) (string "Raja Permainan")))
            (((language ms) (string "raja permainan")))
            (((language ko-ro) (string yuhuiwang)))
            (((language pt-br) (string "O Rei dos Jogos")))
            (((language ja-ro) (string "Yu\226\152\134Gi\226\152\134Oh!")))))
          (description
           (((language en)
             (string
              "Sitting by himself in the back of the class, 10th-grader Yugi always had his head in some game\226\128\147until he solved the Millennium Puzzle, an Egyptian artifact containing the spirit of a master gambler from the age of the pharaohs! Awakened after three thousand years, the King of Games possesses Yugi, recklessly challenging bullies and evil-doers to the Shadow Games, where the stakes are high, and even the most ordinary bet may result in weirdness and danger beyond belief! Let the games\226\128\166 begin!"))
            ((language pt-br)
             (string
              "O estudante Yugi Mutou passou a maior parte de seu tempo sozinho jogando jogos - at\195\169 que ele resolveu o Enigma do Mil\195\170nio, um artefato eg\195\173pcio misterioso! Possu\195\173da pelo quebra-cabe\195\167a, Yugi se torna o Yu-Gi-Oh(O Rei dos Jogos), e ir\195\161 enfrentar os desafios dos Jogos das Sombras - Jogos mortais com grandes apostas e altos riscos, como apostar a sua alma e a alma de seus queridos amigos! O mang\195\161 cont\195\169m novas hist\195\179rias n\195\163o vistas no anime, incluindo a origem de Yugi e seus amigos!"))))
          (is_locked false)
          (links
           (((provider al) (link 30054)) ((provider ap) (link yu-gi-oh))
            ((provider bw) (link series/13090/list)) ((provider kt) (link 140))
            ((provider mu) (link 2691))
            ((provider amz)
             (link
              https://www.amazon.co.jp/-/zh/dp/B075717P1Z?binding=kindle_edition&ref_=dbs_s_ks_series_rwt_tkin&qid=1657296918&sr=1-2))
            ((provider cdj)
             (link https://www.cdjapan.co.jp/product/NEOBK-405892))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/147587/))
            ((provider mal) (link 54))
            ((provider engtl)
             (link https://www.viz.com/read/manga/yu-gi-oh-3-in-1-edition/all))))
          (original_language ja) (last_volume (38)) (last_chapter (343))
          (publication_demographic (shounen)) (status completed) (year (1996))
          (content_rating safe)
          (tags
           (((id 07251805-a27e-4d59-b488-f0bfbec15168)
             (attributes
              ((name (((language en) (string Thriller)))) (group genre)
               (version 1))))
            ((id 31932a7e-5b8e-49a6-9f12-2afa39dc544c)
             (attributes
              ((name (((language en) (string "Traditional Games"))))
               (group theme) (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
               (version 1))))
            ((id 3de8c75d-8ee3-48ff-98ee-e20a65c86451)
             (attributes
              ((name (((language en) (string Animals)))) (group theme)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id 92d6d951-ca5e-429c-ac78-451071cbf064)
             (attributes
              ((name (((language en) (string "Office Workers")))) (group theme)
               (version 1))))
            ((id a1f53773-c69a-4ce5-8cab-fffcd90b1565)
             (attributes
              ((name (((language en) (string Magic)))) (group theme) (version 1))))
            ((id b29d6a3d-1569-4e7a-8caf-7557bc92cd5d)
             (attributes
              ((name (((language en) (string Gore)))) (group content)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id da2d50ca-3018-4cc0-ac7a-6b7d472a29ea)
             (attributes
              ((name (((language en) (string Delinquents)))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-06-29T18:26:10+00:00)
          (updated_at 2024-02-25T23:06:16+00:00) (version 23)
          (available_translated_languages (ru pt-br pl en))
          (latest_uploaded_chapter 8dfd5af7-d88b-494a-8f03-17c6bf75ecd8)))
        (relationships
         (((id 3510d7c1-4252-409e-aefb-b1e1ab27368c) (type_ author))
          ((id 3510d7c1-4252-409e-aefb-b1e1ab27368c) (type_ artist))
          ((id 43d47943-607b-4f7a-809c-690e6341e3fb) (type_ cover_art))
          ((id 0b651e63-d2c9-422d-98ad-ca20cdc91edc) (type_ manga))
          ((id 18c2d6e8-9504-487b-8d13-1c7f8656b19c) (type_ manga))
          ((id 18d4293c-bd6a-4d60-9178-9888e4cd7cbe) (type_ manga))
          ((id 1c258c7a-5529-4fde-b6c0-f8028223993b) (type_ manga))
          ((id 1d8e66b6-eb63-431c-b32f-ca0c31ef0d4e) (type_ manga))
          ((id 234e6099-fc16-409e-a74a-3088a277b1c9) (type_ manga))
          ((id 238db660-8302-4d59-935f-64f0c0fd973f) (type_ manga))
          ((id 2b80b4c8-e585-459c-b283-ff0aa448e528) (type_ manga))
          ((id 3e3604cc-97b5-43f0-ab2c-c144debcae87) (type_ manga))
          ((id 3e3604cc-97b5-43f0-ab2c-c144debcae87) (type_ manga))
          ((id 48263de6-0f6e-4e62-96d0-345d12058d87) (type_ manga))
          ((id 59c55a7a-382b-4eaf-ac29-790f9d7861ab) (type_ manga))
          ((id 5a96c030-82b6-40f4-aa0f-c590b6f69f03) (type_ manga))
          ((id 5c390728-963c-41f1-b4a1-43a3f7e510a8) (type_ manga))
          ((id 68824871-4838-4683-a1ca-4b86ff2a6638) (type_ manga))
          ((id 6c743221-b3e6-4065-9006-cd46a6449a82) (type_ manga))
          ((id 77709908-3a92-40db-ab45-2223f1959dea) (type_ manga))
          ((id 779661d7-6745-4a04-a783-5264bd146661) (type_ manga))
          ((id 779661d7-6745-4a04-a783-5264bd146661) (type_ manga))
          ((id 779661d7-6745-4a04-a783-5264bd146661) (type_ manga))
          ((id 86a87e05-2dbb-4bd6-81e8-28c9cf018bf6) (type_ manga))
          ((id 8f82ff7a-8f9f-40e6-a18c-c7d5c39b878e) (type_ manga))
          ((id 8f82ff7a-8f9f-40e6-a18c-c7d5c39b878e) (type_ manga))
          ((id 8f8c4f0e-93f5-433e-ba13-017746b485ec) (type_ manga))
          ((id 91138703-90bc-4a5c-94b2-32f5f0012aee) (type_ manga))
          ((id 96d86c83-d030-4cbb-9647-ffb252adecc7) (type_ manga))
          ((id 9a7110a4-3610-4646-bbe5-716e2d0a0082) (type_ manga))
          ((id 9bda6328-f42c-4f46-a173-80382932a201) (type_ manga))
          ((id 9f9e86ca-3611-4c2d-9573-ee1538513c00) (type_ manga))
          ((id bd40d291-b66e-4d4c-b02f-d47555d8bd6d) (type_ manga))
          ((id e055e867-8120-47bc-8b46-b1a94870e7f1) (type_ manga))
          ((id f4948dbc-2eea-4e44-9c13-df815b984159) (type_ manga))
          ((id f9b649bd-e98e-455a-a2ce-92f07aa780f7) (type_ manga)))))
       ((id 5998f257-e518-496f-92ed-d3a2391ff31e)
        (attributes
         ((title
           (((language en) (string "Heaven's Son in the Land of the Rising Sun"))))
          (alt_titles
           ((((language en) (string "Emperor of the Land of the Rising Sun")))
            (((language ja-ro) (string "Hi Izuru Tokoro no Tenshi")))
            (((language ja)
              (string
               "\230\151\165\229\135\186\229\135\166\227\129\174\229\164\169\229\173\144")))
            (((language zh)
              (string
               "\230\151\165\229\135\186\229\164\132\229\164\169\229\173\144")))
            (((language zh-hk)
              (string
               "\230\151\165\229\135\186\232\153\149\229\164\169\229\173\144")))
            (((language en)
              (string "Scion of Heaven in the Land Where the Sun Rises")))))
          (description
           (((language en)
             (string
               "(from ebookjapan):\
              \n\
              \nIt is the eve of the Asuka Period, and Emishi, the heir to the powerful Soga clan, is 14 years old. His father takes him to the Imperial Court, where he meets a 10-year-old boy, Prince Umayado.\
              \n\
              \nThe turbulent story of Emishi and Umayado begins now. \
              \n\
              \nMany rare color manuscripts, chapter covers, preview cuts, etc. are fully reproduced. This is the \"complete version\" of Ryoko Yamagishi's masterpiece, a representative of the Japanese manga world!\
              \n\
              \n---\
              \n- **Won the Kodansha Manga Award for Shojo in 1983**"))))
          (is_locked false)
          (links
           (((provider al) (link 42843))
            ((provider ap) (link hi-izuru-tokoro-no-tenshi))
            ((provider bw) (link series/318092)) ((provider kt) (link 23327))
            ((provider mu) (link 43137))
            ((provider amz) (link https://www.amazon.co.jp/dp/B09GMZQW5V))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/658233/))
            ((provider mal) (link 12843))
            ((provider raw)
             (link https://www.kadokawa.co.jp/product/301602000651/))))
          (original_language ja) (last_volume (11)) (last_chapter (50))
          (publication_demographic (shoujo)) (status completed) (year (1980))
          (content_rating safe)
          (tags
           (((id 0a39b5a1-b235-4886-a747-1d05d216532d)
             (attributes
              ((name (((language en) (string "Award Winning")))) (group format)
               (version 1))))
            ((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 5920b825-4181-4a17-beeb-9918b0ff7a30)
             (attributes
              ((name (((language en) (string "Boys' Love")))) (group genre)
               (version 1))))
            ((id 9ab53f92-3eed-4e9b-903a-917c86035ee3)
             (attributes
              ((name (((language en) (string Crossdressing)))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-06-19T06:47:39+00:00)
          (updated_at 2024-08-02T18:06:19+00:00) (version 7)
          (available_translated_languages (en))
          (latest_uploaded_chapter 00bb2a44-7df9-4800-9b88-927dc83cea22)))
        (relationships
         (((id 3e726f5a-fd4e-4e7e-ab43-3f58deee8230) (type_ author))
          ((id 3e726f5a-fd4e-4e7e-ab43-3f58deee8230) (type_ artist))
          ((id fcbbdd8e-f0c0-4a12-a4fd-a0588e513d31) (type_ cover_art)))))
       ((id ade0306c-f4b6-4890-9edb-1ddf04df2039)
        (attributes
         ((title (((language en) (string "Solo Leveling: Ragnarok"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\130\152 \237\152\188\236\158\144\235\167\140 \235\160\136\235\178\168\236\151\133 : \235\157\188\234\183\184\235\130\152\235\161\156\237\129\172")))
            (((language ko-ro) (string "Na Honjaman Level Up: Ragnarok")))))
          (description
           (((language en)
             (string
               "The Earth's existence is under threat once more as Itarim, the gods of other universes, seek to fill the void left by the Absolute Being. \
              \n\
              \nSung Jinwoo has no choice but to send Beru, the shadow ant king, to awaken his son's powers and start him on the journey he once took. \
              \n\
              \nSuho must conquer the shadow dungeon and earn his place in the world of hunters as he navigates through a new world against a new evil looking to swallow the world whole."))
            ((language ko)
             (string
               "\236\164\132\234\177\176\235\166\172\
              \n\
              \n\237\143\137\235\178\148\237\149\156 \235\140\128\237\149\153\236\131\157\236\156\188\235\161\156 \236\130\180\236\149\132\234\176\128\235\141\152 \236\132\177\236\136\152\237\152\184 \236\163\189\236\157\140\236\157\132 \236\149\158\235\145\148 \236\136\156\234\176\132, \236\158\160\235\147\164\236\150\180 \236\158\136\235\141\152 \234\183\184\236\157\152 \237\138\185\235\179\132\237\149\156 \237\152\136\237\134\181\236\157\180 \234\185\168\236\150\180\235\130\156\235\139\164!\
              \n\
              \n\226\128\156\236\157\188\236\150\180\235\130\152\235\157\188.\226\128\157\
              \n\
              \n\236\163\189\236\157\140\236\157\132 \234\177\176\236\138\164\235\165\180\234\179\160 \236\167\128\235\176\176\237\149\152\235\138\148 \237\151\140\237\132\176, \234\183\184\234\176\128 \236\132\160\235\179\180\236\157\180\235\138\148 \236\131\136\235\161\156\236\154\180 \235\160\136\235\178\168\236\151\133\236\157\132 \236\163\188\235\170\169\237\149\152\235\157\188!\
              \n\
              \n* \236\157\180 \236\158\145\237\146\136\236\157\128 \236\155\185\237\136\176 <\235\130\152 \237\152\188\236\158\144\235\167\140 \235\160\136\235\178\168\236\151\133>\236\157\152 \236\132\184\234\179\132\234\180\128\236\157\132 \236\157\180\236\150\180\235\176\155\236\157\128 \236\158\145\237\146\136\236\158\133\235\139\136\235\139\164."))))
          (is_locked false)
          (links
           (((provider al) (link 179445)) ((provider mu) (link m13i58t))
            ((provider raw) (link https://page.kakao.com/content/64612703))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2024))
          (content_rating safe)
          (tags
           (((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 87cc87cd-a395-47af-b27a-93258283bbc6)
             (attributes
              ((name (((language en) (string Adventure)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id f5ba408b-0e7a-484d-8d49-4e9125ac96de)
             (attributes
              ((name (((language en) (string "Full Color")))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-20T14:07:44+00:00)
          (updated_at 2024-08-01T02:28:39+00:00) (version 10)
          (available_translated_languages (en pl pt-br))
          (latest_uploaded_chapter 20d03b90-2499-4ebd-a1ab-868b35aafdcf)))
        (relationships
         (((id 376a4fbd-f696-495a-bc1f-d8b1b812793c) (type_ author))
          ((id 50200613-ef62-4ec8-b879-6d9ecd022e66) (type_ artist))
          ((id c49bd157-88b6-4286-97b6-6529d7392d7f) (type_ cover_art))
          ((id 32d76d19-8a05-4db0-9fc2-e0b0648fe9d0) (type_ manga))
          ((id c3ea5ce6-f659-4fe9-95b6-520cec9fcb13) (type_ manga))
          ((id f319d314-4310-4610-bcea-98c0128def1d) (type_ creator)))))
       ((id 5b947fed-957b-44e1-8889-d998b95ba3e4)
        (attributes
         ((title
           (((language en)
             (string "Kanojo ga Onii-chan ni Nattara Shitai 10 no Koto"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\189\188\229\165\179\227\129\140\227\129\138\229\133\132\227\129\161\227\130\131\227\130\147\227\129\171\227\129\170\227\129\163\227\129\159\227\130\137\227\129\151\227\129\159\227\129\13210\227\129\174\227\129\147\227\129\168")))
            (((language en)
              (string
               "10 Things I\226\128\153d Want to Do if She Becomes My Big Brother")))))
          (description
           (((language en)
             (string
              "As a result of entering high school, Nanase moves into a sharehome. Only, there is a special rule that states \"all the residents must be assigned a family role\"!! What will happen of Nanase's life as she starts living with her pretend family...!?"))))
          (is_locked false)
          (links
           (((provider al) (link 168990))
            ((provider ap)
             (link kanojo-ga-onii-chan-ni-nattara-shitai-10-no-koto))
            ((provider bw) (link series/161525)) ((provider mu) (link 90k7ex2))
            ((provider amz)
             (link
              "https://www.amazon.co.jp/\229\189\188\229\165\179\227\129\140\227\129\138\229\133\132\227\129\161\227\130\131\227\130\147\227\129\171\227\129\170\227\129\163\227\129\159\227\130\137\227\129\151\227\129\159\227\129\13210\227\129\174\227\129\147\227\129\168-1-\227\129\190\227\130\147\227\129\140\227\130\191\227\130\164\227\131\160KR\227\130\179\227\131\159\227\131\131\227\130\175\227\130\185-\227\130\162\227\130\171\227\130\179\227\131\131\227\130\179/dp/4832249509"))
            ((provider mal) (link 110540))))
          (original_language ja) (last_volume (2)) (last_chapter (26))
          (publication_demographic (seinen)) (status completed) (year (2017))
          (content_rating suggestive)
          (tags
           (((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id a3c67850-4684-404e-9b7f-c69850ee5da6)
             (attributes
              ((name (((language en) (string "Girls' Love")))) (group genre)
               (version 1))))
            ((id b11fda93-8f1d-4bef-b2ed-8803d3733170)
             (attributes
              ((name (((language en) (string 4-Koma)))) (group format)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-06-06T18:55:54+00:00)
          (updated_at 2024-07-03T17:15:49+00:00) (version 9)
          (available_translated_languages (en))
          (latest_uploaded_chapter b7934afd-f067-4609-a22e-b95f2a3b215a)))
        (relationships
         (((id 5982fcd2-3cae-4392-b586-d3a6422df375) (type_ author))
          ((id 5982fcd2-3cae-4392-b586-d3a6422df375) (type_ artist))
          ((id 1deff30d-bf75-4e83-a792-4f388f37556c) (type_ cover_art))
          ((id 4550150d-31ea-444e-a822-dbdd14702c7a) (type_ creator)))))
       ((id 85ce7857-3d01-4b0a-adff-7a4cba347ced)
        (attributes
         ((title
           (((language en)
             (string
              "Honzuki no Gekokujou ~Shisho ni Naru Tame ni wa Shudan wo Erandeiraremasen~ Dai 4-bu \227\128\140 Kizokuin no Toshokan wo Sukuitai!\227\128\141"))))
          (alt_titles
           ((((language en)
              (string
               "Ascendance of a Bookworm ~I'll do anything to become a librarian~ Part 4 \227\128\140Let's Save the Royal Academy Library!\227\128\141")))
            (((language ja-ro) (string "Honzuki no Gekokujou: Part 4")))
            (((language ja)
              (string
               "\230\156\172\229\165\189\227\129\141\227\129\174\228\184\139\229\137\139\228\184\138\239\189\158\229\143\184\230\155\184\227\129\171\227\129\170\227\130\139\227\129\159\227\130\129\227\129\171\227\129\175\230\137\139\230\174\181\227\130\146\233\129\184\227\130\147\227\129\167\227\129\132\227\130\137\227\130\140\227\129\190\227\129\155\227\130\147\239\189\158\231\172\172\229\155\155\233\131\168 \232\178\180\230\151\143\233\153\162\227\129\174\229\155\179\230\155\184\233\164\168\227\130\146\230\149\145\227\129\132\227\129\159\227\129\132!")))
            (((language ja-ro)
              (string
               "Honzuki no Gekokujou ~Shisho ni Naru Tame ni wa Shudan wo Erandeiraremasen~ Dai 4-bu \227\128\140 Kizokuin no Toshokan wo Sukuitai!\227\128\141")))
            (((language en) (string "Ascendance of a Bookworm: Part 4")))))
          (description
           (((language en)
             (string
               "As Rozemyne wakes up after almost two years she finds out that the world around her has undergone great change causing her to feel like Urashima Tar\197\141 from the Japanese fairy tale. However, there is no time for her to get acclimate to the new world as she is quickly sent off to the Royal Academy to become a true noble.   \
              \nShe is presented with the difficult task of raising Ehrenfest's ranking while being surrounded by eccentric teachers and children from other duchies however she is motivated by the Royal Academy's giant library. While there are no other Archduke Candidates or members of royalty around Rozemyne commandeers the library!  \
              \nHere begins Part 4 of this biblio-fantasy as we enter the Royal Academy!"))))
          (is_locked false)
          (links
           (((provider al) (link 127249)) ((provider bw) (link series/310137))
            ((provider nu) (link ascendance-of-a-bookworm))
            ((provider amz) (link https://www.amazon.co.jp/dp/B093CY7R3N))
            ((provider cdj)
             (link
              https://www.cdjapan.co.jp/searchuni?fq.category=UD%3A14&order=reldesc&q=%E6%9C%AC%E5%A5%BD%E3%81%8D%E3%81%AE%E4%B8%8B%E5%89%8B%E4%B8%8A%E3%80%80%E7%AC%AC%E5%9B%9B%E9%83%A8&wide=1&opt.exclude_prx=on))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/628759/))
            ((provider mal) (link 134812))
            ((provider raw) (link https://seiga.nicovideo.jp/comic/51070))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2020))
          (content_rating safe)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id ace04997-f6bd-436e-b261-779182193d3d)
             (attributes
              ((name (((language en) (string Isekai)))) (group genre)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-01-15T02:16:49+00:00)
          (updated_at 2024-05-09T17:42:40+00:00) (version 16)
          (available_translated_languages (id th en ru es-la))
          (latest_uploaded_chapter 3b7b1a88-940b-46df-960c-727249b43b55)))
        (relationships
         (((id 27569e2d-2b27-44c4-9ee6-4d25449c7b17) (type_ author))
          ((id 6dc3b150-b84e-47fd-8e3d-44ef5c5f7668) (type_ artist))
          ((id 6516c8c9-f398-4ead-b699-0f09bc91706b) (type_ cover_art))
          ((id 0c3b8f0e-7bef-4b04-be2a-75641936d3d3) (type_ manga))
          ((id 111cf88b-8c92-4075-8927-21b62b9ac5d8) (type_ manga))
          ((id 1c2a3fd6-0846-4b57-8fe9-5aa07a457559) (type_ manga))
          ((id 316d3d09-bb83-49da-9d90-11dc7ce40967) (type_ manga))
          ((id 3574e587-2d98-42f0-a6c1-ed4f10674aed) (type_ manga))
          ((id 5262ae1c-b1e3-4d4e-b42f-b439fd03ce68) (type_ manga))
          ((id 9057b11b-ae4b-4143-b93e-f17a2abc798e) (type_ manga))
          ((id bc1f7b65-b9a1-464c-b308-1fc246a327e0) (type_ manga))
          ((id cd51bb77-afa8-475a-b5b7-39caa200759b) (type_ manga))
          ((id d185f1f0-cd3b-4130-bd0f-9ae1796cac7b) (type_ manga))
          ((id f01459fc-19a1-4c60-ad7b-44031b5d942b) (type_ manga)))))
       ((id f17a64c1-5582-48fa-a8f2-ed3e3158a3a6)
        (attributes
         ((title
           (((language en)
             (string
              "Shitennou Sai Jakudatta Ore. Tensei Shitanode Heionna Seikatsu wo Nozomu"))))
          (alt_titles
           ((((language ja)
              (string
               "\229\155\155\229\164\169\231\142\139\230\156\128\229\188\177\227\129\160\227\129\163\227\129\159\228\191\186\227\128\130\232\187\162\231\148\159\227\129\151\227\129\159\227\129\174\227\129\167\229\185\179\231\169\143\227\129\170\231\148\159\230\180\187\227\130\146\230\156\155\227\130\128")))
            (((language ko)
              (string
               "\236\130\172\236\178\156\236\153\149 \236\181\156\236\149\189\236\157\180\236\151\136\235\141\152 \235\130\152, \236\160\132\236\131\157\237\150\136\236\156\188\235\175\128\235\161\156 \237\143\137\236\152\168\237\149\156 \236\131\157\237\153\156\236\157\132 \235\176\148\235\158\128\235\139\164")))
            (((language en)
              (string
               "I Was the Weakest of the Four Heavenly Kings. Since I Have Reincarnated, I Want to Lead a Peaceful Life")))))
          (description
           (((language en)
             (string
               "Ranga was an ogre. However, he was also a strong ogre. Strong enough that he became one of the four most elite demons in the whole land. And, as with many other stories, his comrades betray him. Upon his death, he reincarnates as a normal human. Now, with all of the knowledge and strength of his former life, what do you think he\226\128\153ll do with this new opportunity?\
              \n\
              \na) Live a peaceful life\
              \nb) Live a slow life\
              \nc) Do whatever he wants\
              \n\
              \n\
              \n---\
              \n\
              \n**Links:**\
              \n- [Original Webnovel](https://ncode.syosetu.com/n9030ey)"))))
          (is_locked false)
          (links
           (((provider al) (link 128165))
            ((provider ap)
             (link
              shitennou-sai-jakudatta-ore-tensei-shitanode-heionna-seikatsu-wo-nozomu))
            ((provider bw) (link series/268730)) ((provider mu) (link 170057))
            ((provider amz) (link https://www.amazon.co.jp/dp/B09KV3R9JF))
            ((provider mal) (link 134505))))
          (original_language ja) (last_volume (3)) (last_chapter (21))
          (publication_demographic ()) (status completed) (year (2020))
          (content_rating suggestive)
          (tags
           (((id 0bc90acb-ccc1-44ca-a34a-b9f3a73259d0)
             (attributes
              ((name (((language en) (string Reincarnation)))) (group theme)
               (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 391b0423-d847-456f-aff0-8b0cfc03066b)
             (attributes
              ((name (((language en) (string Action)))) (group genre)
               (version 1))))
            ((id 39730448-9a5f-48a2-85b0-a70db87b1233)
             (attributes
              ((name (((language en) (string Demons)))) (group theme)
               (version 1))))
            ((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id cdc58593-87dd-415e-bbc0-2ec27bf404cc)
             (attributes
              ((name (((language en) (string Fantasy)))) (group genre)
               (version 1))))
            ((id f4122d1c-3b44-44d0-9936-ff7502c39ad3)
             (attributes
              ((name (((language en) (string Adaptation)))) (group format)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2020-08-31T01:13:59+00:00)
          (updated_at 2024-05-12T07:55:24+00:00) (version 13)
          (available_translated_languages (en id es-la))
          (latest_uploaded_chapter 177d3e54-f7ff-4162-b69b-00ebd01e949c)))
        (relationships
         (((id 35772c2a-279b-4dcb-b206-59d1672c8068) (type_ author))
          ((id 2132109c-ea85-4472-b5c8-16a1d45b2c19) (type_ artist))
          ((id 08e6d54c-31e8-4fe4-a2cf-191a15225d2c) (type_ cover_art)))))
       ((id 334b3730-21a7-4293-af2f-4875abd08ed1)
        (attributes
         ((title (((language en) (string "Chanto Suenai Kyuuketsuki-chan"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\129\161\227\130\131\227\130\147\227\129\168\229\144\184\227\129\136\227\129\170\227\129\132\229\144\184\232\161\128\233\172\188\227\129\161\227\130\131\227\130\147")))
            (((language ja-ro) (string "Chanto Suenai Kyuuketsuki-chan")))
            (((language en) (string "Vampire-chan Can't Suck Properly")))))
          (description
           (((language en)
             (string
              "The overwhelming preciousness that captivates all those whose blood she sucks! A new kind of pampering and feeding comedy!"))
            ((language pt-br)
             (string
              "A preciosidade esmagadora que cativa todos aqueles cujo sangue ela suga! Um novo tipo de com\195\169dia de mimos e alimenta\195\167\195\163o!"))))
          (is_locked false)
          (links
           (((provider al) (link 132180))
            ((provider ap) (link chanto-suenai-kyuuketsuki-chan))
            ((provider bw) (link series/321063))
            ((provider kt) (link chanto-suenai-kyuuketsuki-chan))
            ((provider mu) (link 181070))
            ((provider amz) (link https://www.amazon.co.jp/dp/B09TD9SB17))
            ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/658726/))
            ((provider mal) (link 136467))
            ((provider raw)
             (link
              https://comic-walker.com/contents/detail/KDCW_FS01202222010000_68/))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2021))
          (content_rating safe)
          (tags
           (((id 423e2eae-a7a2-4a8b-ac03-a8351462d71d)
             (attributes
              ((name (((language en) (string Romance)))) (group genre)
               (version 1))))
            ((id 4d32cc48-9f00-4cca-9b5a-a839f0764984)
             (attributes
              ((name (((language en) (string Comedy)))) (group genre)
               (version 1))))
            ((id caaa44eb-cd40-4177-b930-79d3ef2afe87)
             (attributes
              ((name (((language en) (string "School Life")))) (group theme)
               (version 1))))
            ((id d7d1730f-6eb0-4ba6-9437-602cac38664c)
             (attributes
              ((name (((language en) (string Vampires)))) (group theme)
               (version 1))))
            ((id dd1f77c5-dea9-4e2b-97ae-224af09caf99)
             (attributes
              ((name (((language en) (string "Monster Girls")))) (group theme)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-02-11T11:37:05+00:00)
          (updated_at 2024-01-31T22:30:59+00:00) (version 23)
          (available_translated_languages (pt-br en))
          (latest_uploaded_chapter d274b1e3-9d5a-4cc9-83f0-1a0634d125ac)))
        (relationships
         (((id 9a1f4548-9773-4011-9b3b-97ab71746b13) (type_ author))
          ((id 9a1f4548-9773-4011-9b3b-97ab71746b13) (type_ artist))
          ((id 6ac3bf1d-3d50-403f-9d05-46d2654b1cd3) (type_ cover_art))
          ((id 23ebf5ec-719c-4f96-9a53-be0cea15ff90) (type_ manga))
          ((id d5a06942-1433-4ce5-97f5-d234fa1db4a5) (type_ creator)))))))
     (limit 100) (offset 0) (total 77858))
    |}]
;;
