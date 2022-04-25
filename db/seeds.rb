# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS']
)

# 15.times do |n|
#   Customer.create!(
#     name: "テストユーザー#{n + 1}",
#     gender: "man",
#     age: 27,
#     email: "test#{n + 1}@test.com",
#     password: "000000",
#     biography: "東京に上京してきて5年になります。まだまだ知らない場所が沢山ありますが、
#     この５年間で発見した告白スポットを定番から穴場まで紹介していきたいと思います！",
#     is_deleted: false
#   )
# end

Customer.create!([
  {name: "makoto",
   gender: "man",
   age: 27,
   email: "makoto123@gmail.com",
   password: 123456,
   biography: "東京に上京してきて5年になります。まだまだ知らない場所が沢山ありますが、
   この５年間で発見した告白スポットを定番から穴場まで紹介していきたいと思います！",
   is_deleted: "false"
  },
  {name: "shun",
   gender: "man",
   age: 31,
   email: "shun123@gmail.com",
   password: 123456,
   biography: "みなさんの恋が叶うように思い出に残る素敵な告白場所を紹介してきたいと思います！",
   is_deleted: "false"
  },
  {name: "yuta",
   gender: "man",
   age: 23,
   email: "yuta123@gmail.com",
   password: 123456,
   biography: "今年東京の大学へ進学の為、上京してきました！",
   is_deleted: "false"
  },
  {name: "megu",
   gender: "woman",
   age: 25,
   email: "megu123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "natsumi",
   gender: "woman",
   age: 29,
   email: "natsumi123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "yuuki",
   gender: "nother",
   age: 29,
   email: "yuuki123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "kizima",
   gender: "no_answer",
   age: 20,
   email: "kizima123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "taiki",
   gender: "man",
   age: 18,
   email: "taiki123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "hikaru",
   gender: "woman",
   age: 18,
   email: "hikaru123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "false"
  },
  {name: "jotaro",
   gender: "man",
   age: 18,
   email: "jotaro123@gmail.com",
   password: 123456,
   biography: "こんにちは！よろしくお願いします。",
   is_deleted: "true"
  },
])

Tag.create!([
  {name: "夜景"},
  {name: "海"},
  {name: "公園"},
  {name: "遊園地"},
  {name: "映画館"},
  {name: "美術館"},
  {name: "レストラン"},
  {name: "カフェ"},
  {name: "イルミネーション"},
  {name: "ドライブ"},
  {name: "大人"},
  {name: "学生"}
])

Area.create!([
  {name: "西麻布・六本木・麻布十番"},
  {name: "表参道・青山"},
  {name: "恵比寿・広尾"},
  {name: "赤坂"},
  {name: "白金"},
  {name: "銀座・有楽町・丸の内・八重洲"},
  {name: "新橋・虎ノ門"},
  {name: "渋谷"},
  {name: "中目黒・代官山"},
  {name: "神楽坂"},
  {name: "品川・五反田・目黒"},
  {name: "新宿・代々木"},
  {name: "代々木上原・下北沢・明大前"},
  {name: "池尻・三宿・三軒茶屋・世田谷"},
  {name: "上野・浅草"},
  {name: "日本橋"},
  {name: "浜松町・お台場"},
  {name: "神田・神保町"},
  {name: "四谷"},
  {name: "築地・月島"},
  {name: "目白"}
])

Post.create!([
  {postal_code: "105-0011",
   address: "東京都港区芝公園４丁目２−８",
   longitude: 139.7454329,
   latitude: 35.6585805,
   title: "東京タワー展望台",
   introduction:
   "告白スポットの定番中の定番といっても過言ではない程の場所、東京タワー
    ！展望台から都会の夜景のが一望でき雰囲気はバッチリです。東京タワーは外か
    ら見ても綺麗ですが、中から東京の街を見下ろすのが特におすすめです。少々観
    光客が多いので、できれば平日に行くことをおすすめします。",
   atmosphere_rate: 5.0,
   few_people_rate: 5.0,
   standard_rate: 5.0,
   all_rate: 5.0,
   confession_result: "yes",
   area_id: 1,
   customer_id: 1,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower1.jpg')),filename: 'tokyo-tower1.jpg')
  },
  {postal_code: "135-0091",
   address: "東京都港区台場１丁目４",
   longitude: 139.7756912,
   latitude: 35.6300488,
   title: "お台場海浜公園",
   introduction:
   "都会の喧騒に邪魔されず告白したい方にはこちらがおすすめです！都内では珍しい
    海が見渡せる公園。お台場海浜公園はその名の通り海の傍にある公園。天気の良い
    日中に浜辺を散歩したりベンチに腰掛けたりするのも良いですが、特に夜がおすす
    めです。なぜなら夜にはレインボーブリッジなどが水面に移りとても幻想的になる
    からです。夏は人が多いのでオフシーズンに行くことをお勧めします。",
   atmosphere_rate: 4.0,
   few_people_rate: 4.0,
   standard_rate: 4.0,
   all_rate: 4.0,
   confession_result: "no_answer",
   area_id: 1,
   customer_id: 1,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/odaiba1.jpg')),filename: 'odaiba1.jpg')
  },
  {postal_code: "131-0045",
   address: "東京都墨田区押上１丁目１−２",
   longitude: 139.8107004,
   latitude: 35.7100627,
   title: "スカイツリー",
   introduction:
    "高さ634m、日本一、世界一高いタワーのスカイツリー！告白スポットの定番である東京
     東京タワーと比べられがちですが、スカイツリーは圧巻の迫力と、ショッピング、飲食が
     充実しているので気軽に気になる方を誘いやすいのでは？！",
   atmosphere_rate: 3.0,
   few_people_rate: 3.0,
   standard_rate: 3.0,
   all_rate: 3.0,
   confession_result: "no",
   area_id: 1,
   customer_id: 1,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/skytree1.jpg')),filename: 'skytree1.jpg')
  },
  {postal_code: "107-0052",
   address: "東京都港区赤坂９丁目７−１",
   longitude: 139.7308747,
   latitude: 35.6659803,
   title: "東京ミッドタウン",
   introduction:
    "ショッピング施設が豊富で地下はレストランも充実しています。また冬にはイルミネーションも
    行っているので、館内のTOHOシネマズで映画を見た後に外のベンチでイルミネーションを見るのは
    いかがでしょうか。",
   atmosphere_rate: 3.0,
   few_people_rate: 3.0,
   standard_rate: 3.0,
   all_rate: 3.0,
   confession_result: "yes",
   area_id: 1,
   customer_id: 2,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-midtown1.jpg')),filename: 'tokyo-midtown1.jpg')
  },
  {postal_code: "150-6018",
   address: "東京都渋谷区恵比寿４丁目２０",
   longitude: 139.7131772,
   latitude: 35.6421097,
   title: "恵比寿ガーデンプレイス",
   introduction: "大人の雰囲気がありお洒落です。",
   atmosphere_rate: 3.5,
   few_people_rate: 3.5,
   standard_rate: 3.5,
   all_rate: 3.5,
   confession_result: "no",
   area_id: 1,
   customer_id: 3,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/ebisu1.jpg')),filename: 'ebisu1.jpg')
  },
  {postal_code: "106-6108",
   address: "東京都港区六本木６丁目１０−１",
   longitude: 139.7300767,
   latitude: 35.6602384,
   title: "六本木ヒルズ",
   introduction: "大人の雰囲気がありお洒落です。",
   atmosphere_rate: 4.0,
   few_people_rate: 4.0,
   standard_rate: 4.0,
   all_rate: 4.0,
   confession_result: "no_answer",
   area_id: 1,
   customer_id: 4,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/roppongi1.jpg')),filename: 'roppongi1.jpg')
  }
])

PostComment.create!([
  {title: "展望台",
   comment: "無事気になっている方とお付き合いすることができました！",
   atmosphere_rate: 5.0,
   few_people_rate: 5.0,
   standard_rate: 5.0,
   all_rate: 5.0,
   confession_result: "yes",
   post_id: 1,
   customer_id: 2,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower2.jpg')),filename: 'tokyo-tower2.jpg')
  },
  {title: "雨の日の展望台",
   comment: "雨で展望台からは何も見えず、雰囲気は台無しでした。",
   atmosphere_rate: 0.5,
   few_people_rate: 0.5,
   standard_rate: 0.5,
   all_rate: 0.5,
   confession_result: "no",
   post_id: 1,
   customer_id: 3,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower3.jpg')),filename: 'tokyo-tower3.jpg')
  },
  {title: "夏のお台場",
   comment: "花火が上がっていてとても綺麗でした。雰囲気も良く告白を切り出しやすかったです。",
   atmosphere_rate: 4.5,
   few_people_rate: 4.5,
   standard_rate: 4.5,
   all_rate: 4.5,
   confession_result: "no",
   post_id: 2,
   customer_id: 2,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/odaiba2.jpg')),filename: 'odaiba2.jpg')
  },
  {title: "水面に映る夜景",
   comment: "人が少なくとても静かで、雰囲気も良く告白を切り出しやすかったです！",
   atmosphere_rate: 4.5,
   few_people_rate: 4.5,
   standard_rate: 4.5,
   all_rate: 4.5,
   confession_result: "yes",
   post_id: 2,
   customer_id: 3,
   avatar.attach(io: File.open(Rails.root.join('app/assets/images/odaiba3.jpg')),filename: 'odaiba3.jpg')
  }

PostTag.create!([
  {post_id:1,
   tag_id:1
  },
  {post_id:1,
   tag_id:3
  },
  {post_id:1,
   tag_id:9
  },
  {post_id:2,
   tag_id:1
  },
  {post_id:2,
   tag_id:2
  },
])

3.times do |n|
  Favorite.create!(
    id: n,
    post_id: (3 + n),
    customer_id: 1,
  )
end

14.times do |n|
  Relationship.create!(
    id: n,
    follower_id: 1,
    followed_id: (n + 1),
  )
end

14.times do |n|
  Relationship.create!(
    id: (n + 14),
    follower_id: (n + 1),
    followed_id: 1,
  )
end