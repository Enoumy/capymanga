open! Core
open Mangadex_api.Types

let%expect_test "parsing a collection" =
  (* This test just showcases that we are able to parse the json of a
     request... *)
  let collection =
    Collection.t_of_yojson
      Manga.t_of_yojson
      (Yojson.Safe.from_string Embedded_files.dummy_search_response_dot_json)
  in
  print_s [%sexp (collection : Manga.t Collection.t)];
  [%expect
    {|
    ((data
      (((id 21199d83-83b0-49a3-a402-97147973d4eb)
        (attributes
         ((title (((language en) (string "Can I Borrow the Fire?"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\182\136 \235\185\140\235\160\164\235\147\156\235\166\180\234\185\140\236\154\148?")))
            (((language en) (string "Do You Want Me to Lend You a Lighter?")))
            (((language en) (string "Can I Borrow the Lighter?")))
            (((language en) (string "Would You Like Me to Lend You a Fire?")))))
          (description
           (((language en)
             (string
              "In truth, I never wanted to become a teacher. In a moment when I was fulfilling my own responsibilities on the path I chose after giving up my dream, 'Do you want me to lend you a lighter?' A cheeky male student offered. It feels like my life as a teacher is at odds with this cheeky kid, who comes with genius talent, overflowing wealth, and fame as a bonus. A story of school life entwined with dreams, talent, and love."))))
          (is_locked false)
          (links
           ((((provider mu) (link 45aeoda))
             ((provider raw)
              (link https://comic.naver.com/webtoon/list?titleId=822931)))))
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
          (created_at 2024-07-30T00:43:33+00:00)
          (updated_at 2024-07-30T00:44:29+00:00) (version 4)
          (available_translated_languages (en))
          (latest_uploaded_chapter (e566506e-35a4-4b48-8780-664f29943455))))
        (relationships
         (((id 3e0899f2-ac89-4ebb-963a-80118e3f5b3a) (type_ author))
          ((id 3e0899f2-ac89-4ebb-963a-80118e3f5b3a) (type_ artist))
          ((id f752b4f5-1feb-439d-9c0a-b4abe1f21cce) (type_ cover_art))
          ((id c55f8354-ec7c-4543-afaf-71a5e7088124) (type_ creator)))))
       ((id d993f789-e7e5-4832-92fd-37614220b427)
        (attributes
         ((title
           (((language en)
             (string "The Skeleton Soldier Failed to Defend the Dungeon"))))
          (alt_titles
           ((((language ko)
              (string
               "\237\149\180\234\179\168\235\179\145\236\130\172\235\138\148 \235\141\152\236\160\132\236\157\132 \236\167\128\237\130\164\236\167\128 \235\170\187\237\150\136\235\139\164")))
            (((language en)
              (string "Skeleton Soldier Couldn't Protect the Dungeon")))
            (((language en) (string "Skeleton Soldier")))
            (((language ru)
              (string
               "\208\146\208\190\208\184\208\189-\209\129\208\186\208\181\208\187\208\181\209\130 \208\189\208\181 \209\129\208\188\208\190\208\179 \209\131\208\180\208\181\209\128\208\182\208\176\209\130\209\140 \208\191\208\190\208\180\208\183\208\181\208\188\208\181\208\187\209\140\208\181")))
            (((language pt-br)
              (string
               "O Soldado Esqueleto Que N\195\163o Conseguia Proteger a Dungeon")))
            (((language ja)
              (string
               "\233\170\184\233\170\168\229\133\181\229\163\171\227\129\175\227\131\128\227\131\179\227\130\184\227\131\167\227\131\179\227\130\146\229\174\136\227\130\140\227\129\170\227\129\139\227\129\163\227\129\159")))
            (((language zh)
              (string
               "\233\170\183\233\171\133\233\170\145\229\163\171\230\178\161\232\131\189\229\174\136\228\189\143\229\137\175\230\156\172")))
            (((language zh-hk)
              (string
               "\233\170\183\233\171\143\229\163\171\229\133\181\229\141\183\229\156\159\233\135\141\228\190\134")))))
          (description
           (((language de)
             (string
              "Die Abenteuer eines scheinbar schwachen Skelettsoldaten, dessen einziges Ziel es ist, seine Herrin, Lady Sukkubus, zu besch\195\188tzen und ihr zu dienen. Sein Traum eines friedlichen Lebens mit ihr findet ein j\195\164hes Ende, als die beiden von einer Gruppe Krieger brutal ermordet wird. Aber aus einem kl\195\164glichen Ende wird ein hoffnungsvoller Neuanfang, als der Skelettsoldat sich 20 Jahre in der Vergangenheit wiederfindet! \226\128\158Ich muss Lady Sukkubus vor all dem warnen!\226\128\156 Aber ohne besondere Kampff\195\164higkeiten und einer Geschichte voller Fehlschl\195\164ge und Verluste, wie kann er diese grauenvolle Zukunft abwenden? Folge dem Skelettsoldaten in seiner bisher wichtigsten Mission: Seine eigene Geschichte neu zu schreiben."))
            ((language en)
             (string
               "The Skeleton Soldier, a meager but fiercely loyal fighter who serves to protect its master, Lady Succubus. Its dream of a peaceful life with her is shattered when they're both brutally murdered by a group of warriors one day.\
              \n\
              \nBut what would\226\128\153ve been a pathetic end to an unremarkable soul sparks a new beginning: when the Skeleton Soldier opens its eyes again, it has traveled back 20 years in time!\
              \n\
              \n\226\128\156I must warn Lady Succubus of all the things to come!\226\128\157\
              \n\
              \nBut with no special combat skills and a history of failure and defeat, how can it stop the horrible events from unfolding again?\
              \n\
              \nFollow the Skeleton Soldier as it faces the most challenging quest of all \226\128\148 rewriting the ending to its own story."))
            ((language fr)
             (string
              "D\195\169couvrez le Soldat Squelette, le fr\195\170le mais loyal combattant, se battant pour prot\195\169ger sa ma\195\174tresse, Dame Succube. Son r\195\170ve d'une vie paisible \195\160 ses c\195\180t\195\169s est r\195\169duit \195\160 n\195\169ant le jour o\195\185 ils sont tous les deux brutalement assassin\195\169s par un groupe de guerriers. Mais ce qui allait \195\170tre une fin tragique se r\195\169v\195\168le \195\170tre en fait un nouveau commencement : le Soldat Squelette se r\195\169veille de nouveau... 20 ans plus t\195\180t ! Il doit pr\195\169venir sa Dame du danger qui les guette, mais sans comp\195\169tences au combat, et un large historique de d\195\169faites, sera-t-il capable de sauver leur avenir ? Suivez ce courageux squelette dans sa qu\195\170te pour changer le cours du temps et son tragique destin !"))
            ((language ja)
             (string
              "\227\128\140\227\129\138\229\174\136\227\130\138\227\129\167\227\129\141\227\129\154\227\128\129\231\148\179\227\129\151\232\168\179\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147\226\128\166\227\128\141\227\128\128\229\144\141\227\130\130\227\129\170\227\129\141\227\131\162\227\131\179\227\130\185\227\130\191\227\131\188\227\128\140\233\170\184\233\170\168\229\133\181\229\163\171\227\128\141\227\129\175\227\128\129\228\184\187\227\129\174\227\130\181\227\130\173\227\131\165\227\131\144\227\130\185\227\130\146\229\174\136\227\130\140\227\129\172\227\129\190\227\129\190\227\128\129\232\135\170\229\136\134\227\129\174\229\188\177\227\129\149\227\130\146\229\152\134\227\129\141\227\129\164\227\129\164\229\191\131\229\141\138\227\129\176\227\129\167\230\156\189\227\129\161\230\158\156\227\129\166\227\130\139\226\128\166\227\129\140\227\128\129\227\129\132\227\129\141\227\129\170\227\130\13820\229\185\180\229\137\141\227\129\171\232\152\135\227\130\139\239\188\129\228\189\149\229\186\166\230\173\187\227\130\147\227\129\167\227\130\130\232\152\135\227\130\138\227\128\129\232\152\135\227\130\139\227\129\159\227\129\179\227\129\171\231\181\140\233\168\147\229\128\164\227\130\130\232\147\132\231\169\141\227\129\149\227\130\140\227\129\166\227\129\132\227\129\143\232\172\142\227\129\174\227\130\183\227\130\185\227\131\134\227\131\160\227\129\190\227\129\167\228\187\152\229\138\160\227\129\149\227\130\140\227\129\159\227\128\130\227\128\140\227\129\147\227\129\174\227\131\129\227\131\163\227\131\179\227\130\185\227\128\129\233\128\131\227\129\149\227\129\170\227\129\132\227\129\167\227\129\138\227\129\143\227\129\185\227\129\141\227\129\139\227\128\141\227\129\132\227\129\164\227\129\139\229\134\141\228\188\154\227\129\153\227\130\139\227\129\167\227\129\130\227\130\141\227\129\134\227\130\181\227\130\173\227\131\165\227\131\144\227\130\185\230\167\152\227\130\146\229\174\136\227\130\139\227\129\159\227\130\129\227\128\129\233\170\184\233\170\168\229\133\181\229\163\171\227\129\175\229\188\183\227\129\143\227\129\170\227\130\139\227\129\147\227\129\168\227\130\146\232\170\147\227\129\134"))
            ((language ko)
             (string
               "\"\236\167\128\237\130\164\234\184\176 \236\156\132\237\149\180\236\132\156 \235\130\152\235\138\148 \234\176\149\237\149\180\236\167\132\235\139\164!\"\
              \n\
              \n\
              \n\236\157\180\235\166\132 \236\151\134\235\138\148 \236\157\188\234\176\156 \235\170\172\236\138\164\237\132\176 '\237\149\180\234\179\168\235\179\145\236\130\172'.\
              \n\
              \n\236\158\144\236\139\160\236\157\152 \236\163\188\236\157\184\236\157\184 \236\132\156\237\129\144\235\178\132\236\138\164\235\165\188 \236\167\128\237\130\164\236\167\128 \235\170\187\237\149\156\236\177\132 \236\163\189\236\158\132\236\157\132 \235\139\185\237\149\156\235\139\164.\
              \n\
              \n\234\183\184\235\159\172\235\130\152,\
              \n\
              \n\234\176\145\236\158\144\234\184\176 20\235\133\132 \236\160\132\236\156\188\235\161\156 \235\143\140\236\149\132\234\176\132\235\139\164?!\
              \n\
              \n\236\157\188\236\131\157\236\157\188\235\140\128\236\157\152 \236\181\156\235\140\128\236\157\152 \234\184\176\237\154\140!\
              \n\
              \n\
              \n\236\158\144\236\139\160\236\157\180 \236\167\128\237\130\164\234\184\176 \235\170\187\237\149\156 \236\132\156\237\129\144\235\178\132\236\138\164\235\165\188 \236\156\132\237\149\180\236\132\156\
              \n\
              \n\237\149\180\234\179\168\236\157\128 \236\132\177\236\158\165\237\149\180 \235\130\152\234\176\132\235\139\164!"))
            ((language ru)
             (string
              "\208\151\208\176\209\137\208\184\209\130\208\184\209\130\209\140 \209\133\208\190\208\183\209\143\208\185\208\186\209\131 \208\177\209\139\208\187\208\190 \208\181\208\179\208\190 \208\181\208\180\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\188 \208\191\209\128\208\181\208\180\208\189\208\176\208\183\208\189\208\176\209\135\208\181\208\189\208\184\208\181\208\188, \208\189\208\190 \208\190\208\189 \208\189\208\181 \209\129\208\188\208\190\208\179 \208\184\209\129\208\191\208\190\208\187\208\189\208\184\209\130\209\140 \208\181\208\179\208\190. \208\158\208\180\208\189\208\176\208\186\208\190 \209\129\209\131\208\180\209\140\208\177\208\176 \208\180\208\176\209\128\209\131\208\181\209\130 \208\181\208\188\209\131 \208\189\208\190\208\178\209\139\208\185 \209\136\208\176\208\189\209\129. \208\168\208\176\208\189\209\129 \209\129\209\130\208\176\209\130\209\140 \209\129\208\184\208\187\209\140\208\189\208\181\208\181 \208\184 \209\129\208\191\208\176\209\129\209\130\208\184 \209\129\208\178\208\190\209\142 \208\179\208\190\209\129\208\191\208\190\208\182\209\131. \208\168\208\176\208\189\209\129 \208\191\208\181\209\128\208\181\208\191\208\184\209\129\208\176\209\130\209\140 \208\184\209\129\209\130\208\190\209\128\208\184\209\142."))
            ((language zh)
             (string
              "\233\170\183\233\171\133\233\170\145\229\163\171\229\143\145\231\142\176\232\135\170\229\183\177\229\155\158\229\136\176\228\186\13420\229\185\180\229\137\141\239\188\140\232\191\153\228\184\128\228\184\150\233\170\183\233\171\133\233\170\145\229\163\171\231\171\139\229\191\151\232\166\129\229\165\189\229\165\189\229\174\136\230\138\164\228\184\187\228\186\186\227\128\130\231\132\182\232\128\140...\233\131\189\230\173\187\228\186\134\233\130\163\228\185\136\229\164\154\230\172\161\239\188\140\230\128\142\228\185\136\232\191\152\230\178\161\230\137\190\229\136\176\229\174\136\230\138\164\228\184\187\228\186\186\231\154\132\230\173\163\231\161\174\230\137\147\229\188\128\230\150\185\229\188\143\239\188\129\228\184\128\230\172\161\228\184\141\232\161\140\233\130\163\229\176\177\229\134\141\230\157\165\231\172\172\228\186\140\230\172\161\239\188\140\231\172\172\228\186\140\230\172\161\228\184\141\232\161\140\233\130\163\229\176\177\230\157\165\231\172\172\228\184\137\230\172\161\226\128\166\232\191\153\230\152\175\228\184\128\228\184\170\229\143\175\228\187\165\230\151\160\233\153\144\230\172\161\233\135\141\231\148\159\231\154\132\233\170\183\233\171\133\233\170\145\229\163\171\231\154\132\229\165\135\229\185\187\229\142\134\233\153\169\230\149\133\228\186\139\227\128\130"))
            ((language pt-br)
             (string
              "Seu \195\186nico prop\195\179sito era proteger sua mestra. Mesmo assim ele foi incapaz. Mas o destino tinha mais reservado a ele j\195\161 que conseguiu uma nova chance para proteger sua mestra e mudar seu destino."))
            ((language zh-hk)
             (string
               "\227\128\140\231\130\186\228\186\134\229\174\136\232\173\183\231\143\141\230\132\155\231\154\132\228\184\128\229\136\135\239\188\140\230\136\145\229\191\133\233\160\136\232\174\138\229\188\183!\227\128\141\
              \n\231\132\161\229\144\141\230\128\170\231\137\169\227\128\140\233\170\183\233\171\143\229\163\171\229\133\181\227\128\141\230\178\146\232\131\189\229\174\136\232\173\183\232\135\170\229\183\177\231\154\132\228\184\187\228\186\186\233\173\133\233\173\148\239\188\140\
              \n\228\190\191\230\133\152\233\129\173\230\174\186\229\174\179\227\128\130\
              \n\
              \n\231\132\182\232\128\140\239\188\140\228\187\150\229\141\187\231\170\129\231\132\182\229\155\158\229\136\176\228\186\13420\229\185\180\229\137\141?!\
              \n\233\128\153\230\152\175\229\141\131\232\188\137\233\155\163\233\128\162\231\154\132\231\181\149\228\189\179\230\169\159\230\156\131!\
              \n\
              \n\231\130\186\228\186\134\232\135\170\229\183\177\228\184\138\230\172\161\229\174\136\232\173\183\228\184\141\228\186\134\231\154\132\233\173\133\233\173\148\239\188\140\
              \n\233\170\183\233\171\143\229\176\135\230\156\131\229\138\170\229\138\155\230\136\144\233\149\183!"))))
          (is_locked false)
          (links
           ((((provider al) (link 103156))
             ((provider ap)
              (link the-skeleton-soldier-failed-to-defend-the-dungeon))
             ((provider bw) (link dedc1a5869-fbc9-43dc-abdc-bf03ec3902be))
             ((provider kt) (link 41301)) ((provider mu) (link 149218))
             ((provider amz) (link https://www.amazon.co.jp/dp/B09NKKFX5K/))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/672038/))
             ((provider mal) (link 146761))
             ((provider raw) (link https://page.kakao.com/content/51328791))
             ((provider engtl)
              (link
               https://www.tappytoon.com/comics/skeleton-soldier-failed-defend-dungeon)))))
          (original_language ko) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status hiatus) (year (2018))
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
          (created_at 2019-07-03T12:12:18+00:00)
          (updated_at 2024-07-04T06:26:36+00:00) (version 30)
          (available_translated_languages (pt-br es-la it en pl ru fa cs fr id))
          (latest_uploaded_chapter (dc6d19cb-309c-4aa8-8145-e599183c5a7f))))
        (relationships
         (((id b0cbb5da-37d9-4b38-b41b-2ee56ef0fae3) (type_ author))
          ((id 1c157033-eb0a-494e-95bc-6bf98ca466ca) (type_ artist))
          ((id 3232e83f-4980-4ff9-aac4-961bef9a3e5c) (type_ cover_art)))))
       ((id 261004f5-c18d-4dc8-a7af-bd83fa3d833e)
        (attributes
         ((title
           (((language en)
             (string
              "Heroine na no ni, Ikemen Idol ni \226\153\130 Narimashita!?"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\146\227\131\173\227\130\164\227\131\179\227\129\170\227\129\174\227\129\171\227\128\129\227\130\164\227\130\177\227\131\161\227\131\179\227\130\162\227\130\164\227\131\137\227\131\171\226\153\130\227\129\171\227\129\170\227\130\138\227\129\190\227\129\151\227\129\159!?")))
            (((language en)
              (string
               "Why Did I Transform Into a Handsome Idol \226\153\130 Even Though I\226\128\153m the Heroine?!")))))
          (description
           (((language en)
             (string
               "\226\128\156Even if it\226\128\153s just a little bit, I want to change.\226\128\157\
              \n\
              \nRion is a timid girl who has always followed the herd, caring about other people\226\128\153s opinions to the point where she couldn\226\128\153t speak her own thoughts out loud. One day, sick of it all, she forces herself to attend the idol group \226\128\156PRINCE\227\131\187Kiss\226\128\157 handshake event, where she meets Kanata, whom she admires and whose words give Rion even more courage to change her timid self.\
              \n\
              \nDetermined to change and get closer to Kanata, she decides to pursue her dream of becoming an idol. However, on the day of the audition, Rion encounters Sakyo, a member of Kanata\226\128\153s group, and due to an unexpected incident between them, her body transforms into that of a male?!\
              \n\
              \nTo make matters even more complicated, Rion ends up participating in a boys' idol audition instead\226\128\166?\
              \nA new type of idol love story begins with this unique twist!"))))
          (is_locked false)
          (links
           ((((provider bw) (link de02fec963-26c8-4ef6-bb6a-4724adf81f55))
             ((provider mu) (link cm225yz))
             ((provider amz)
              (link
               "https://www.amazon.co.jp/\227\131\146\227\131\173\227\130\164\227\131\179\227\129\170\227\129\174\227\129\171\227\128\129\227\130\164\227\130\177\227\131\161\227\131\179\227\130\162\227\130\164\227\131\137\227\131\171\226\153\130\227\129\171\227\129\170\227\130\138\227\129\190\227\129\151\227\129\159-1-\227\131\149\227\131\169\227\131\175\227\131\188\227\130\179\227\131\159\227\131\131\227\130\175\227\130\185-\230\132\155\230\159\147-\227\131\158\227\131\138/dp/4098727595"))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/832742/))
             ((provider raw)
              (link
               https://flowercomics.jp/chapter/20962/viewer?utm_source=cheese&utm_medium=link&utm_campaign=tameshiyomi_vol1)))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (josei)) (status ongoing) (year (2023))
          (content_rating safe)
          (tags
           (((id 2bd2e8d0-f146-434a-9b51-fc9ff2c5fe6a)
             (attributes
              ((name (((language en) (string Genderswap)))) (group theme)
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
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))
            ((id eabc5b4c-6aff-42f3-b657-3e90cbd00b75)
             (attributes
              ((name (((language en) (string Supernatural)))) (group theme)
               (version 1))))
            ((id f42fbf9e-188a-447b-9fdc-f19dc1e4d685)
             (attributes
              ((name (((language en) (string Music)))) (group theme) (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2024-07-29T11:37:13+00:00)
          (updated_at 2024-07-29T17:15:31+00:00) (version 4)
          (available_translated_languages (en))
          (latest_uploaded_chapter (71f08be8-feeb-4afc-b516-1f31bd481ab9))))
        (relationships
         (((id ad4d444a-77ff-4fe0-be2e-6c43d4ce16c7) (type_ author))
          ((id ad4d444a-77ff-4fe0-be2e-6c43d4ce16c7) (type_ artist))
          ((id 057fe209-d211-40db-b886-020c4f1e416f) (type_ cover_art))
          ((id 92f1689d-35c0-4fa3-ad0a-ef01bd16032e) (type_ creator)))))
       ((id f43aab98-8bfe-4275-97cc-9a7b7635eb80)
        (attributes
         ((title
           (((language en)
             (string "Rikei ga Koi ni Ochita no de Shoumei shitemita"))))
          (alt_titles
           ((((language ja)
              (string
               "\231\144\134\231\179\187\227\129\140\230\129\139\227\129\171\232\144\189\227\129\161\227\129\159\227\129\174\227\129\167\232\168\188\230\152\142\227\129\151\227\129\166\227\129\191\227\129\159\227\128\130")))
            (((language ja) (string "\227\131\170\227\130\177\230\129\139")))
            (((language ja-ro)
              (string "Rikei ga Koi ni Ochita no de Shoumei Shite Mita")))
            (((language ja-ro) (string RikeKoi)))
            (((language en)
              (string "Science Fell in Love, so I Tried to Prove It")))
            (((language en)
              (string "I Tried to Prove That Science Fell in Love")))
            (((language en)
              (string "Science Has Fallen in Love, so We Tried to Prove It")))
            (((language fr)
              (string
               "J'ai essay\195\169 de prouver que la science \195\169tait tomb\195\169e amoureuse")))
            (((language ru)
              (string
               "\208\157\208\176\209\131\208\186\208\176 \208\178\208\187\209\142\208\177\208\187\208\181\208\189\208\176 \208\184 \208\188\209\139 \208\180\208\190\208\186\208\176\208\182\208\181\208\188 \209\141\209\130\208\190")))
            (((language ru)
              (string
               "\208\163\209\135\209\145\208\189\209\139\208\181 \208\178\208\187\209\142\208\177\208\187\208\181\208\189\209\139 \208\184 \208\189\208\176\208\188\208\181\209\128\208\181\208\189\209\139 \208\180\208\190\208\186\208\176\208\183\208\176\209\130\209\140 \209\141\209\130\208\190 \208\189\208\176\209\131\209\135\208\189\208\190")))
            (((language ru)
              (string
               "\208\175 \208\191\209\139\209\130\208\176\208\187\209\129\209\143 \208\180\208\190\208\186\208\176\208\183\208\176\209\130\209\140, \209\135\209\130\208\190 \208\189\208\176\209\131\208\186\208\176 \208\178\208\187\209\142\208\177\208\184\208\187\208\176\209\129\209\140")))
            (((language th)
              (string
               "\224\184\158\224\184\180\224\184\170\224\184\185\224\184\136\224\184\153\224\185\140\224\184\153\224\184\180\224\184\162\224\184\178\224\184\161\224\184\132\224\184\167\224\184\178\224\184\161\224\184\163\224\184\177\224\184\129\224\184\148\224\185\137\224\184\167\224\184\162\224\184\171\224\184\165\224\184\177\224\184\129\224\184\167\224\184\180\224\184\138\224\184\178\224\184\170\224\184\178\224\184\162\224\184\167\224\184\180\224\184\151\224\184\162\224\185\140")))
            (((language zh)
              (string
               "\231\144\134\231\167\145\231\148\159\229\157\160\229\133\165\230\131\133\231\189\145\239\188\140\230\149\133\229\176\157\232\175\149\232\175\129\230\152\142\227\128\130")))
            (((language zh)
              (string
               "\232\175\149\232\175\129\230\152\142\231\144\134\231\167\145\231\148\159\229\183\178\229\157\160\229\133\165\230\131\133\231\189\145\227\128\130")))
            (((language zh-hk)
              (string
               "\231\144\134\231\167\145\231\148\159\229\162\156\229\133\165\230\131\133\231\182\178\239\188\140\230\149\133\229\152\151\232\169\166\232\173\137\230\152\142\227\128\130")))
            (((language zh-hk)
              (string
               "\232\169\166\232\173\137\230\152\142\231\144\134\231\167\145\231\148\159\229\183\178\229\162\156\229\133\165\230\131\133\231\182\178\227\128\130")))
            (((language ko)
              (string
               "\236\157\180\234\179\188\234\176\128 \236\130\172\235\158\145\236\151\144 \235\185\160\236\161\140\234\184\176\236\151\144 \236\166\157\235\170\133\237\149\180 \235\179\180\236\149\152\235\139\164")))))
          (description
           (((language en)
             (string
              "Yukimura Shinya and Himuro Ayame are two scientists that want to find out if love can be solved by a scientific theory. These two scientists also have feelings for each other and want to be able to solve their true feelings through similar theoretical facts. With this perfect opportunity, these scientists will attempt to solve the theory of the love they express for each other."))
            ((language ru)
             (string
              "\208\165\208\184\208\188\209\131\209\128\208\190 \208\144\209\143\208\188\209\141 \208\184 \208\174\208\186\208\184\208\188\209\131\209\128\208\176 \208\168\208\184\208\189\209\140\209\143 \208\189\209\131 \208\191\209\128\208\190\209\129\209\130\208\190 \208\190\208\177\208\190\208\182\208\176\209\142\209\130 \209\130\208\190\209\135\208\189\209\139\208\181 \208\189\208\176\209\131\208\186\208\184. \208\152\208\188 \208\189\208\176\208\180\208\190, \209\135\209\130\208\190\208\177\209\139 \208\178\209\129\209\145 \208\184\208\188\208\181\208\187\208\190 \208\189\208\176\209\131\209\135\208\189\208\190\208\181 \208\190\208\177\208\190\209\129\208\189\208\190\208\178\208\176\208\189\208\184\208\181, \208\178\208\181\208\180\209\140 \208\177\208\181\208\183 \209\141\209\130\208\190\208\179\208\190 \208\189\208\181\208\187\209\140\208\183\209\143 \208\177\209\139\209\130\209\140 \209\131\208\178\208\181\209\128\208\181\208\189\208\189\209\139\208\188 \208\189\208\184 \208\178 \209\135\209\145\208\188. \208\158\209\133 \209\131\208\182 \209\141\209\130\208\184 \209\131\209\135\208\181\208\189\209\139\208\181, \208\186\208\176\208\186\208\184\208\181 \209\130\208\190\208\187\209\140\208\186\208\190 \209\141\208\186\209\129\208\191\208\181\209\128\208\184\208\188\208\181\208\189\209\130\209\139 \208\189\208\181 \208\191\209\128\208\184\208\180\209\131\209\130 \208\178 \209\141\209\130\208\184 \208\179\208\190\208\187\208\190\208\178\209\139, \209\135\209\130\208\190\208\177\209\139 \208\180\208\190\208\186\208\176\208\183\208\176\209\130\209\140 \"\208\187\209\142\208\177\208\190\208\178\209\140\"."))))
          (is_locked false)
          (links
           ((((provider al) (link 87377))
             ((provider ap)
              (link rikei-ga-koi-ni-ochita-no-de-shoumei-shitemita))
             ((provider bw) (link series/108592)) ((provider kt) (link 38032))
             ((provider mu) (link 133866))
             ((provider amz) (link https://www.amazon.co.jp/dp/B074CJPHSZ))
             ((provider cdj)
              (link https://www.cdjapan.co.jp/product/NEOBK-2206951))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/401393/))
             ((provider mal) (link 99528))
             ((provider raw) (link https://comic-meteor.jp/rikekoi/))
             ((provider engtl)
              (link
               https://inkr.com/title/1078-science-fell-in-love-so-i-tried-to-prove-it)))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic ()) (status ongoing) (year (2016))
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
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
               (version 1))))
            ((id e5301a23-ebd9-49dd-a0cb-2add944c7fe9)
             (attributes
              ((name (((language en) (string "Slice of Life")))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-01-05T22:53:34+00:00)
          (updated_at 2024-07-13T15:50:09+00:00) (version 26)
          (available_translated_languages (en es-la ru pt-br es fr))
          (latest_uploaded_chapter (01f9026e-95de-4f96-bfc5-3d4aba301884))))
        (relationships
         (((id ab3269ab-8ac1-439f-b87e-a9870ef6d0a9) (type_ author))
          ((id ab3269ab-8ac1-439f-b87e-a9870ef6d0a9) (type_ artist))
          ((id 80105513-6ad0-485f-a2ff-5335b26a05cc) (type_ cover_art)))))
       ((id 733fc3ac-deca-444e-bb79-14186e00ccf1)
        (attributes
         ((title (((language en) (string "Shadows House (Official Colored)"))))
          (alt_titles
           ((((language en) (string "Shadows House - Digital Colored Comics")))
            (((language ja-ro) (string "Shad\197\141hausu")))
            (((language id) (string "Keluarga Shadow")))
            (((language ru)
              (string
               "\208\148\208\190\208\188 \209\130\208\181\208\189\208\181\208\185")))
            (((language ru)
              (string
               "\208\156\209\128\208\176\209\135\208\189\209\139\208\185 \208\180\208\190\208\188")))
            (((language ja)
              (string
               "\227\130\183\227\131\163\227\131\137\227\131\188\227\131\143\227\130\166\227\130\185")))
            (((language zh) (string "\229\189\177\229\174\133")))
            (((language pt-br) (string "Casa das Sombras")))
            (((language ja)
              (string
               "\227\130\183\227\131\163\227\131\137\227\131\188\227\131\143\227\130\166\227\130\185 \227\130\171\227\131\169\227\131\188\231\137\136")))
            (((language id) (string "Rumah Shadow")))
            (((language es) (string "Casa de Sombras")))))
          (description
           (((language en)
             (string
               "Faceless shadow nobles living in a vast mansion, attended by living dolls who spend much of their time cleaning up the soot endlessly emitted by their mysterious masters.  \r\
              \n  \r\
              \nFollow the story of Emilyko, a young and cheerful living doll, as she learns her duties serving as the attendant for Kate Shadow-sama. What dangers and dark secrets will she and Kate encounter, as they become more deeply involved in the inner workings of the shadows' society?"))
            ((language es)
             (string
               "Nobles sombras sin rostro que viven en una vasta mansi\195\179n, atendidos por mu\195\177ecos vivientes que pasan gran parte de su tiempo limpiando el holl\195\173n emitido por sus misteriosos maestros.  \
              \n  \
              \nSigue la historia de Emilyko, una joven y alegre mu\195\177eca viviente, mientras aprende sus deberes como asistente de Kate Shadow-sama."))
            ((language ja)
             (string
              "\228\184\141\230\128\157\232\173\176\227\129\170\230\180\139\233\164\168\227\129\171\228\189\143\227\130\128\227\128\129 \233\161\148\227\129\174\227\129\170\227\129\132\227\130\183\227\131\163\227\131\137\227\131\188\228\184\128\230\151\143\227\129\168\227\128\129 \228\184\150\232\169\177\228\191\130\227\129\174\226\128\156\231\148\159\227\129\141\228\186\186\229\189\162\226\128\157\227\129\159\227\129\161\227\128\130 \229\189\188\227\130\137\227\129\140\231\185\148\227\130\138\227\129\170\227\129\153\227\128\129 \230\145\169\232\168\182\228\184\141\230\128\157\232\173\176\227\129\170\230\151\165\229\184\184\227\129\168\227\129\175\226\128\166\239\188\159"))
            ((language ru)
             (string
              "\208\145\208\181\208\183\208\187\208\184\208\186\208\184\208\181 \209\130\208\181\208\189\208\181\208\178\209\139\208\181 \208\180\208\178\208\190\209\128\209\143\208\189\208\181, \208\182\208\184\208\178\209\131\209\137\208\184\208\181 \208\178 \208\190\208\179\209\128\208\190\208\188\208\189\208\190\208\188 \208\190\209\129\208\190\208\177\208\189\209\143\208\186\208\181, \209\129\208\190\208\191\209\128\208\190\208\178\208\190\208\182\208\180\208\176\208\181\208\188\209\139\208\181 \208\182\208\184\208\178\209\139\208\188\208\184 \208\186\209\131\208\186\208\187\208\176\208\188\208\184, \208\186\208\190\209\130\208\190\209\128\209\139\208\181 \208\191\209\128\208\190\208\178\208\190\208\180\209\143\209\130 \208\177\208\190\208\187\209\140\209\136\209\131\209\142 \209\135\208\176\209\129\209\130\209\140 \209\129\208\178\208\190\208\181\208\179\208\190 \208\178\209\128\208\181\208\188\208\181\208\189\208\184, \208\190\209\135\208\184\209\137\208\176\209\143 \209\129\208\176\208\182\209\131, \208\177\208\181\209\129\208\186\208\190\208\189\208\181\209\135\208\189\208\190 \208\184\209\129\208\191\209\131\209\129\208\186\208\176\208\181\208\188\209\131\209\142 \208\184\209\133 \209\130\208\176\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\188\208\184 \209\133\208\190\208\183\209\143\208\181\208\178\208\176\208\188\208\184."))
            ((language es-la)
             (string
              "Sombras nobres vivem em uma imensa mans\195\163o e s\195\163o servidos por bonecas vivas que passam a maior parte do tempo limpando a fuligem solta pelos misteriosos mestres. Siga a hist\195\179ria de Emilyko, uma boneca viva jovem e animada, enquanto ela aprende seus deveres como serva de Kate Shadow-sama."))
            ((language pt-br)
             (string
              "Sombras nobres vivem em uma imensa mans\195\163o e s\195\163o servidos por bonecas vivas que passam a maior parte do tempo limpando a fuligem solta pelos misteriosos mestres. Siga a hist\195\179ria de Emilyko, uma boneca viva jovem e animada, enquanto ela aprende seus deveres como serva de Kate Shadow-sama."))))
          (is_locked false)
          (links
           ((((provider al) (link 104063)) ((provider ap) (link shadow-house))
             ((provider bw) (link series/190337/list))
             ((provider kt) (link 54545)) ((provider mu) (link 150388))
             ((provider amz)
              (link https://www.amazon.co.jp/gp/product/B0835ZGKNL))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/521592))
             ((provider mal) (link 115730))
             ((provider raw)
              (link
               https://www.shueisha.co.jp/books/items/contents.html?jdcn=08891184891184325501))
             ((provider engtl)
              (link https://yenpress.com/9781975345938/shadows-house-vol-1/)))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (seinen)) (status ongoing) (year (2019))
          (content_rating safe)
          (tags
           (((id 320831a8-4026-470b-94f6-8353740e6f04)
             (attributes
              ((name (((language en) (string "Official Colored"))))
               (group format) (version 1))))
            ((id 36fd93ea-e8b8-445e-b836-358f02b3d33d)
             (attributes
              ((name (((language en) (string Monsters)))) (group theme)
               (version 1))))
            ((id 3b60b75c-a2d7-4860-ab56-05f391bb889c)
             (attributes
              ((name (((language en) (string Psychological)))) (group genre)
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
            ((id e197df38-d0e7-43b5-9b09-2842d0c326dd)
             (attributes
              ((name (((language en) (string "Web Comic")))) (group format)
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
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2019-09-23T05:04:28+00:00)
          (updated_at 2024-07-09T02:42:17+00:00) (version 79)
          (available_translated_languages (pt-br en vi ru es id tr fr es-la it))
          (latest_uploaded_chapter (dfc9eff7-5926-4770-984a-2e8da97e0e26))))
        (relationships
         (((id 5e6ad669-80d4-4818-bb8c-dfad9464b32a) (type_ author))
          ((id 5e6ad669-80d4-4818-bb8c-dfad9464b32a) (type_ artist))
          ((id 3663b13f-98e2-4907-8175-8ceceeebe365) (type_ cover_art))
          ((id 3924f8d0-dc26-43ff-ac9e-6573d33181ec) (type_ manga))
          ((id 74c21a60-ac49-42ce-8441-f4ed9d7b380a) (type_ manga))
          ((id 8c697de6-a142-4cec-ae1f-9b31a07f04cb) (type_ manga))
          ((id e9e7af1c-6b46-43f1-957a-890040d207c9) (type_ manga)))))
       ((id df600a28-6807-4aba-9777-c54f32ee9cab)
        (attributes
         ((title (((language en) (string "Non Non Biyori Remember"))))
          (alt_titles
           ((((language ja-ro) (string "Non Non Biyori Rimenba")))
            (((language ja)
              (string
               "\227\129\174\227\130\147\227\129\174\227\130\147\227\129\179\227\130\136\227\130\138 \227\130\138\227\130\129\227\130\147\227\129\176\227\131\188")))))
          (description
           (((language en)
             (string
              "A short term serialization of extra Non Non Biyori stories published in Comic Alive (Media Factory)"))))
          (is_locked false)
          (links
           ((((provider al) (link 134719))
             ((provider ap) (link non-non-biyori-remember))
             ((provider bw) (link dec4d7f76d-fb65-430e-8730-da17e44f54a8))
             ((provider kt) (link non-non-biyori-remember))
             ((provider mu) (link 182828))
             ((provider amz) (link https://www.amazon.co.jp/dp/4046811617))
             ((provider cdj)
              (link https://www.cdjapan.co.jp/product/NEOBK-2707335))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/690368/))
             ((provider mal) (link 139166))
             ((provider raw)
              (link
               https://comic-alive.jp/product/non-non-biyori/nonnonremember/)))))
          (original_language ja) (last_volume (1)) (last_chapter (7))
          (publication_demographic (seinen)) (status completed) (year (2021))
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
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2021-12-25T06:24:38+00:00)
          (updated_at 2024-07-30T00:58:35+00:00) (version 17)
          (available_translated_languages (id en))
          (latest_uploaded_chapter (191111c8-bc94-4548-9842-9a24326046bd))))
        (relationships
         (((id 074f389a-7f7c-49d2-aa5c-a140379ba91c) (type_ author))
          ((id 074f389a-7f7c-49d2-aa5c-a140379ba91c) (type_ artist))
          ((id 38def6b0-c0f9-4cc2-a9c1-611973e91ce9) (type_ cover_art))
          ((id 74502f72-ad26-4af1-846c-de18061107a0) (type_ manga))
          ((id d4d4c903-b418-4dd5-8c39-987f63a9ba89) (type_ creator)))))
       ((id ac72a16f-1bd7-4118-883f-5ac7c1e67fd7)
        (attributes
         ((title
           (((language en)
             (string "Mobile Suit Gundam: Battle Operation Code Fairy"))))
          (alt_titles
           ((((language ja)
              (string
               "\230\169\159\229\139\149\230\136\166\229\163\171\227\130\172\227\131\179\227\131\128\227\131\160 \227\131\144\227\131\136\227\131\171\227\130\170\227\131\154\227\131\172\227\131\188\227\130\183\227\131\167\227\131\179 \227\130\179\227\131\188\227\131\137\227\131\187\227\131\149\227\130\167\227\130\162\227\131\170\227\131\188")))
            (((language ja-ro)
              (string "Kidou Senshi Gundam: Battle Operation Code Fairy")))))
          (description
           (((language en)
             (string
              "The \"Noisy Fairy Squadron, a secret unit under the direct control of Kycilia Zabi of the Principality of Zeon, is deployed somewhere in the North American continent. With only female members, they fight in the One Year War against the Earth Federation Forces. They are forced to face the unreasonableness of war and the bonds with their comrades..."))))
          (is_locked false)
          (links
           ((((provider al) (link 143002)) ((provider bw) (link series/367146))
             ((provider mu) (link 17gl79b))
             ((provider amz) (link https://www.amazon.co.jp/dp/B0B8B483NK))
             ((provider cdj)
              (link
               https://www.cdjapan.co.jp/searchuni?fq.category=UD%3A14&q=%E6%A9%9F%E5%8B%95%E6%88%A6%E5%A3%AB%E3%82%AC%E3%83%B3%E3%83%80%E3%83%A0+%E3%83%90%E3%83%88%E3%83%AB%E3%82%AA%E3%83%9A%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3+%E3%82%B3%E3%83%BC%E3%83%89%E3%83%BB%E3%83%95%E3%82%A7%E3%82%A2%E3%83%AA%E3%83%BC&order=reldesc&opt.exclude_prx=on))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/711248/))
             ((provider mal) (link 166075))
             ((provider raw)
              (link https://www.kadokawa.co.jp/product/322204000461/)))))
          (original_language ja) (last_volume ("")) (last_chapter (""))
          (publication_demographic (shounen)) (status ongoing) (year (2021))
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
            ((id 50880a9d-5440-4732-9afb-8f457127e836)
             (attributes
              ((name (((language en) (string Mecha)))) (group genre) (version 1))))
            ((id 5fff9cde-849c-4d78-aab0-0d52b2ee1d25)
             (attributes
              ((name (((language en) (string Survival)))) (group theme)
               (version 1))))
            ((id ac72833b-c4e9-4878-b9db-6c8a4a99444a)
             (attributes
              ((name (((language en) (string Military)))) (group theme)
               (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-12-03T16:02:37+00:00)
          (updated_at 2024-02-25T01:04:19+00:00) (version 7)
          (available_translated_languages (en))
          (latest_uploaded_chapter (2f9cfed3-6c7c-4ff1-bb35-e9b1e3355590))))
        (relationships
         (((id ef03e12d-8ada-490e-86bd-a4f1a2277aa2) (type_ author))
          ((id ef03e12d-8ada-490e-86bd-a4f1a2277aa2) (type_ artist))
          ((id c1cb3307-0f90-474b-b6dd-2fb89cf6f3fd) (type_ cover_art))
          ((id 756685f0-b5e4-48c5-b154-56c7e5578b14) (type_ manga))
          ((id f36895e4-5045-4a5c-a8ec-c073d8958433) (type_ manga))
          ((id 9dd000b6-7147-4cff-a6a7-cb3544378d29) (type_ creator)))))
       ((id b440e0ce-2167-462f-b1c8-e4288fbd6d08)
        (attributes
         ((title (((language en) (string "Lunatic Circus"))))
          (alt_titles
           ((((language ja)
              (string
               "\227\131\171\227\131\138\227\131\134\227\130\163\227\131\131\227\130\175\227\130\181\227\131\188\227\130\171\227\130\185")))))
          (description
           (((language en)
             (string
              "\"Lunatic Circus\" is a story about the circus called \"Lunatic Circus\", which is said to be the best in post WWII Japan, which has achieved an incredibly rapid economic growth. The star of the circus, Ryunosuke, and all the other trapeze artists, are the protagonists of this manga. This is the story of their dreams, their fears, their struggles and their hopes."))))
          (is_locked false)
          (links
           ((((provider mu) (link 37a30k5))
             ((provider amz) (link https://www.amazon.co.jp/dp/4107723739/))
             ((provider cdj)
              (link
               "https://www.cdjapan.co.jp/searchuni?term.media_format=&q=\227\131\171\227\131\138\227\131\134\227\130\163\227\131\131\227\130\175\227\130\181\227\131\188\227\130\171\227\130\185"))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/632727/))
             ((provider mal) (link 129410))
             ((provider raw) (link https://www.cmoa.jp/title/219459/)))))
          (original_language ja) (last_volume (3)) (last_chapter (20))
          (publication_demographic (seinen)) (status cancelled) (year (2020))
          (content_rating safe)
          (tags
           (((id 33771934-028e-4cb3-8744-691e866a923e)
             (attributes
              ((name (((language en) (string Historical)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2022-08-17T21:10:18+00:00)
          (updated_at 2024-06-21T14:58:32+00:00) (version 5)
          (available_translated_languages (en))
          (latest_uploaded_chapter (43d028ab-c23e-4572-8324-d8d643db710b))))
        (relationships
         (((id caaeb4af-791e-43c0-8931-4f33be1001ab) (type_ author))
          ((id caaeb4af-791e-43c0-8931-4f33be1001ab) (type_ artist))
          ((id 842e34e0-1e0b-409f-8e6f-d412ccbdfd30) (type_ cover_art))
          ((id a87dbcb6-c056-4ce7-86bc-b735205e0258) (type_ creator)))))
       ((id 31be4cc4-d7c8-47d7-9d80-4f1b2db7979e)
        (attributes
         ((title (((language en) (string "Angel Heart"))))
          (alt_titles
           ((((language ja-ro) (string "Angel Heart - 1st Season")))
            (((language ja)
              (string
               "\227\130\168\227\131\179\227\130\184\227\130\167\227\131\171\227\131\187\227\131\143\227\131\188\227\131\136")))
            (((language ja)
              (string
               "\227\130\168\227\131\179\227\130\184\227\130\167\227\131\171\227\131\187\227\131\143\227\131\188\227\131\136 1st\227\130\183\227\131\188\227\130\186\227\131\179")))
            (((language zh)
              (string "\229\164\169\228\189\191\228\185\139\229\191\131")))
            (((language zh) (string "\229\164\169\228\189\191\229\191\131")))
            (((language es-la) (string "Coraz\195\179n de \195\129ngel")))
            (((language uk)
              (string
               "\208\161\208\181\209\128\209\134\208\181 \208\175\208\189\208\179\208\190\208\187\208\176")))))
          (description
           (((language en)
             (string
               "A young Taiwanese assassin codenamed \"Glass Heart\" committed suicide by jumping off a building, and her heart was pierced by a metal fence. Miraculously, her life was saved by heart transplantation. During her recovery she began to experience strange dreams, which led her to Japan looking for the donor of her heart, who happens to be Kaori Makimura, former partner of City Hunter.\
              \n\
              \n---\
              \nOfficial Release:\
              \n- Indonesian release by Level Comics"))
            ((language ja)
             (string
              "\229\143\176\230\185\190\227\129\174\233\187\146\231\164\190\228\188\154\231\181\132\231\185\148\227\129\174\230\174\186\228\186\186\229\133\181\229\153\168\227\129\168\227\129\151\227\129\166\233\164\138\230\136\144\227\129\149\227\130\140\227\129\159\229\176\145\229\165\179\227\130\176\227\131\169\227\130\185\227\131\187\227\131\143\227\131\188\227\131\136\227\128\130\229\189\188\229\165\179\227\129\175\232\135\170\230\174\186\227\130\146\229\155\179\227\130\139\227\129\140\227\128\129\227\130\183\227\131\134\227\130\163\227\131\188\227\131\143\227\131\179\227\130\191\227\131\188\227\129\174\227\131\145\227\131\188\227\131\136\227\131\138\227\131\188\230\167\135\230\157\145\233\166\153\227\129\174\229\191\131\232\135\147\227\130\146\231\167\187\230\164\141\227\129\149\227\130\140\228\184\128\229\145\189\227\130\146\227\129\168\227\130\138\227\129\168\227\130\129\227\130\139\227\128\130\232\152\135\227\129\163\227\129\159\227\130\176\227\131\169\227\130\185\227\131\187\227\131\143\227\131\188\227\131\136\227\129\175\231\181\132\231\185\148\227\130\146\230\138\156\227\129\145\229\135\186\227\129\151\227\128\129\233\166\153\227\129\174\232\168\152\230\134\182\227\129\171\229\176\142\227\129\139\227\130\140\227\130\139\227\130\136\227\129\134\227\129\171\230\150\176\229\174\191\227\131\187\227\131\170\227\131\167\227\130\166\227\129\174\229\133\131\227\129\184\227\128\130\227\130\132\227\129\140\227\129\166\228\186\140\228\186\186\227\129\175\233\166\153\227\129\174\229\191\131\232\135\147\227\129\168\227\129\132\227\129\134\231\181\134\227\129\167\227\128\129\229\134\141\228\188\154\227\130\146\227\129\175\227\129\159\227\129\153\227\129\174\227\129\160\227\129\140\226\128\166\226\128\166!?"))
            ((language es-la)
             (string
              "Una joven asesina taiwanesa con el nombre clave de \"Coraz\195\179n de Cristal\" se suicid\195\179 saltando desde un edificio, y su coraz\195\179n fue atravesado por una valla met\195\161lica. Milagrosamente, su vida se salv\195\179 gracias a un trasplante de coraz\195\179n. Durante su recuperaci\195\179n comenz\195\179 a experimentar extra\195\177os sue\195\177os, que la llevaron a Jap\195\179n en busca del donante de su coraz\195\179n, que resulta ser Kaori Makimura, antigua compa\195\177era de City Hunter."))))
          (is_locked false)
          (links
           ((((provider al) (link 31512)) ((provider ap) (link angel-heart))
             ((provider bw) (link series/18281)) ((provider kt) (link 3219))
             ((provider mu) (link 1839))
             ((provider amz) (link https://www.amazon.co.jp/dp/B074CDM8TW))
             ((provider ebj) (link https://ebookjapan.yahoo.co.jp/books/405431/))
             ((provider mal) (link 1512))
             ((provider raw) (link https://mangahot.jp/site/works/b_R0001)))))
          (original_language ja) (last_volume (33)) (last_chapter (363))
          (publication_demographic (seinen)) (status completed) (year (2001))
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
            ((id 5ca48985-9a9d-4bd8-be29-80dc0303db72)
             (attributes
              ((name (((language en) (string Crime)))) (group genre) (version 1))))
            ((id 85daba54-a71c-4554-8a28-9901a8b0afad)
             (attributes
              ((name (((language en) (string Mafia)))) (group theme) (version 1))))
            ((id b9af3a63-f058-46de-a9a0-e0c13906197a)
             (attributes
              ((name (((language en) (string Drama)))) (group genre) (version 1))))
            ((id ee968100-4191-4968-93d3-f82d72be7e46)
             (attributes
              ((name (((language en) (string Mystery)))) (group genre)
               (version 1))))
            ((id f8f62932-27da-4fe4-8ee1-6779a8c5edba)
             (attributes
              ((name (((language en) (string Tragedy)))) (group genre)
               (version 1))))))
          (state published) (chapter_numbers_reset_on_new_volume false)
          (created_at 2018-01-25T16:09:41+00:00)
          (updated_at 2024-07-08T23:41:47+00:00) (version 22)
          (available_translated_languages (en es-la))
          (latest_uploaded_chapter (dd71d129-994d-4c5e-abdd-ec4d1371e655))))
        (relationships
         (((id bdd3b599-48be-49d2-8bea-877e38704ad6) (type_ author))
          ((id bdd3b599-48be-49d2-8bea-877e38704ad6) (type_ artist))
          ((id 08df4cac-e347-4538-9310-a14a575e15b6) (type_ cover_art))
          ((id 88784b0a-208b-4528-801b-379a0777de44) (type_ manga))
          ((id f1c716b5-e82f-4625-a646-280cfa66abad) (type_ manga)))))
       ((id c8793445-dd5a-4569-8ede-d5b4476bc11a)
        (attributes
         ((title (((language en) (string "The Essence"))))
          (alt_titles
           ((((language ko)
              (string
               "\235\148\148 \236\151\144\236\132\188\236\138\164 (The Essence)")))))
          (description
           (((language en)
             (string
              "The dominant omega \226\128\152Rael\226\128\153, who lived in the dark, plans to take the opportunity to take over the house of the Count when his brother gets into an accident. Rael secretly visits a perfumer named \226\128\152Hyde\226\128\153 to obtain an alpha pheromone perfume in order to mask his true scent. Rael pretends to be an Alpha in public, and all of this is thanks to Hyde\226\128\153s special perfume. But, Rael doesn\226\128\153t know the true identity of \226\128\152Hyde\226\128\153, a perfumer hidden behind a veil, even rumored to be hideous. But every time he comes into close contact with him, Rael feels something different\226\128\166 Then one day, the Count declares that if Rael cannot give birth to an Alpha within two years, the Count will hand over the position to someone else. So, Rael asks Hyde, the only person who knows his identity, for help."))))
          (is_locked false) (links (())) (original_language ko)
          (last_volume ("")) (last_chapter ("")) (publication_demographic ())
          (status ongoing) (year ()) (content_rating erotica)
          (tags
           (((id 3e2b8dae-350e-4ab8-a8ce-016e844b9f0d)
             (attributes
              ((name (((language en) (string "Long Strip")))) (group format)
               (version 1))))
            ((id 5920b825-4181-4a17-beeb-9918b0ff7a30)
             (attributes
              ((name (((language en) (string "Boys' Love")))) (group genre)
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
          (created_at 2022-09-30T05:20:59+00:00)
          (updated_at 2023-04-17T01:25:33+00:00) (version 6)
          (available_translated_languages (pl))
          (latest_uploaded_chapter (753c309d-ca36-440c-b7f9-c1ab72c6943e))))
        (relationships
         (((id 8dd49acf-6a2e-449e-ac3c-166669616292) (type_ author))
          ((id 3377cbdf-18b6-42f7-b904-9a5323b6eb17) (type_ artist))
          ((id 86a7db61-0733-4f1c-9ad9-d91c3a8d7637) (type_ cover_art))
          ((id 1c6f9c2d-0322-4c4b-a629-1bc941045650) (type_ creator)))))))
     (limit 10) (offset 0) (total 77769))
    |}]
;;
