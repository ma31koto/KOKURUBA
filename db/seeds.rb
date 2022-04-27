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

customer1 = Customer.create(
  name: "makoto",
  gender: "man",
  age: 27,
  email: "makoto123@gmail.com",
  password: 123456,
  biography: "東京に上京してきて5年になります。まだまだ知らない場所が沢山ありますが、
  この５年間で発見した告白スポットを定番から穴場まで紹介していきたいと思います！",
  is_deleted: "false"
  )
  customer1.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer1.jpg')),filename: 'customer1.jpg')

customer2 = Customer.create(
  name: "shun",
  gender: "man",
  age: 31,
  email: "shun123@gmail.com",
  password: 123456,
  biography: "みなさんの恋が叶うように、思い出に残る素敵な告白場所を紹介してきたいと思います！",
  is_deleted: "false"
  )
  customer2.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer2.jpg')),filename: 'customer2.jpg')

customer3 = Customer.create(
  name: "yuta",
  gender: "man",
  age: 23,
  email: "yuta123@gmail.com",
  password: 123456,
  biography: "今年東京の大学へ進学の為、上京してきました！",
  is_deleted: "false"
  )
  customer3.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer3.jpg')),filename: 'custome3r.jpg')

customer4 = Customer.create(
  name: "megu",
  gender: "woman",
  age: 25,
  email: "megu123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer4.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer4.jpg')),filename: 'customer4.jpg')

customer5 = Customer.create(
  name: "natsumi",
  gender: "woman",
  age: 29,
  email: "natsumi123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer5.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer5.jpg')),filename: 'customer5.jpg')

customer6 = Customer.create(
  name: "yuuki",
  gender: "another",
  age: 29,
  email: "yuuki123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer6.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer6.jpg')),filename: 'customer6.jpg')

customer7 = Customer.create(
  name: "kizima",
  gender: "no_answer",
  age: 20,
  email: "kizima123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer7.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer7.jpg')),filename: 'customer7.jpg')

customer8 = Customer.create(
  name: "taiki",
  gender: "man",
  age: 18,
  email: "taiki123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer8.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer8.jpg')),filename: 'customer8.jpg')

customer9 = Customer.create(
  name: "hikaru",
  gender: "woman",
  age: 18,
  email: "hikaru123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "false"
  )
  customer9.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer9.jpg')),filename: 'customer9.jpg')

customer10 = Customer.create(
  name: "jotaro",
  gender: "man",
  age: 18,
  email: "jotaro123@gmail.com",
  password: 123456,
  biography: "こんにちは！よろしくお願いします。",
  is_deleted: "true"
  )
  customer10.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/customer10.jpg')),filename: 'customer10.jpg')

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
  {name: "ショッピング"},
  {name: "大人"},
  {name: "学生"},
  {name: "水族館"}
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

post1 = Post.create(
  postal_code: "105-0011",
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
  area_id: 17,
  customer_id: 1
  )
  post1.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower1.jpg')),filename: 'tokyo-tower1.jpg')

post2 = Post.create(
  postal_code: "135-0091",
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
  area_id: 17,
  customer_id: 1
  )
  post2.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/odaiba1.jpg')),filename: 'odaiba1.jpg')

post3 = Post.create(
  postal_code: "131-0045",
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
  area_id: 15,
  customer_id: 1
  )
  post3.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/skytree1.jpg')),filename: 'skytree1.jpg')

post4 = Post.create(
  postal_code: "107-0052",
  address: "東京都港区赤坂９丁目７−１",
  longitude: 139.7308747,
  latitude: 35.6659803,
  title: "東京ミッドタウン",
  introduction:
    "ショッピング施設が豊富でレストランも充実しています。また冬にはイルミネーションも
    行っているので、食事終わりにイルミネーションを見るのはいかがでしょうか。",
  atmosphere_rate: 1.0,
  few_people_rate: 1.0,
  standard_rate: 1.0,
  all_rate: 1.0,
  confession_result: "yes",
  area_id: 4,
  customer_id: 2
  )
  post4.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-midtown1.jpg')),filename: 'tokyo-midtown1.jpg')

post5 = Post.create(
  postal_code: "150-6018",
  address: "東京都渋谷区恵比寿４丁目２０",
  longitude: 139.7131772,
  latitude: 35.6421097,
  title: "恵比寿ガーデンプレイス",
  introduction: "大人の雰囲気がありお洒落です。駅から徒歩5分に東京都写真美術館があり多様な展覧会や上映が行われているので、
  見に行きたい物の期間を狙ってデートの予定を立てるのも良いですね。",
  atmosphere_rate: 3.5,
  few_people_rate: 3.5,
  standard_rate: 3.5,
  all_rate: 3.5,
  confession_result: "no",
  area_id: 3,
  customer_id: 3
  )
  post5.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/ebisu1.jpg')),filename: 'ebisu1.jpg')

post6 = Post.create(
  postal_code: "106-6108",
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
  customer_id: 4
  )
  post6.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/roppongi1.jpg')),filename: 'roppongi1.jpg')

post7 = Post.create(
  postal_code: "110-0007",
  address: "東京都台東区上野公園２",
  longitude: 139.771457738115,
  latitude: 35.70990257576018,
  title: "上野公園(ベンチ)",
  introduction: "上野動物園の終わりにカフェ飲み物を買ってこちらのベンチで告白しました！",
  atmosphere_rate: 2.5,
  few_people_rate: 2.5,
  standard_rate: 2.5,
  all_rate: 2.5,
  confession_result: "no",
  area_id: 15,
  customer_id: 5
  )
  post7.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/park1.jpg')),filename: 'park1.jpg')

post8 = Post.create(
  postal_code: "150-0033",
  address: "東京都渋谷区猿楽町１６−１５",
  longitude: 139.699943,
  latitude: 35.649358,
  title: "IVY PLACE(テラス)",
  introduction: "代官山にあるお洒落なカフェです。夜のテラス席を絶対にお勧めします！",
  atmosphere_rate: 4.5,
  few_people_rate: 4.0,
  standard_rate: 3.0,
  all_rate: 4.0,
  confession_result: "yes",
  area_id: 9,
  customer_id: 6
  )
  post8.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/cafe1.jpg')),filename: 'cafe1.jpg')

post9 = Post.create(
  postal_code: "150-0033",
  address: "東京都渋谷区猿楽町１０−１",
  longitude: 139.7025852,
  latitude: 35.6504276,
  title: "メキシコ料理(テラス)",
  introduction: "代官山駅近くのビル9階にあるお洒落なレストランです。美味しいメキシコ料理が味わえます。",
  atmosphere_rate: 5.0,
  few_people_rate: 2.0,
  standard_rate: 1.0,
  all_rate: 4.0,
  confession_result: "no",
  area_id: 9,
  customer_id: 7
  )
  post9.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/restaurant1.jpg')),filename: 'restaurant1.jpg')

post10 = Post.create(
  postal_code: "108-8611",
  address: "東京都港区高輪４丁目１０−３０",
  longitude: 139.7352393,
  latitude: 35.6282839,
  title: "アクアパーク(イルカショー)",
  introduction: "イルカショーを見終えた後、そのままベンチに座ることができ、周りも人が居なくなり良いと思います。",
  atmosphere_rate: 4.0,
  few_people_rate: 4.0,
  standard_rate: 4.0,
  all_rate: 4.0,
  confession_result: "yes",
  area_id: 11,
  customer_id: 7
  )
  post10.spot_image.attach(io: File.open(Rails.root.join('app/assets/images/aqua1.jpg')),filename: 'aqua1.jpg')


post_comment1 = PostComment.create(
   title: "展望台",
   comment: "無事気になっている方とお付き合いすることができました！",
   atmosphere_rate: 5.0,
   few_people_rate: 5.0,
   standard_rate: 5.0,
   all_rate: 5.0,
   confession_result: "yes",
   post_id: 1,
   customer_id: 2,
  )
  post_comment1.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower2.jpg')),filename: 'tokyo-tower2.jpg')

post_comment2 = PostComment.create(
  title: "雨の日の展望台",
  comment: "雨で展望台からは何も見えず、雰囲気は台無しでした。",
  atmosphere_rate: 0.5,
  few_people_rate: 0.5,
  standard_rate: 0.5,
  all_rate: 0.5,
  confession_result: "no",
  post_id: 1,
  customer_id: 3
  )
  post_comment2.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/tokyo-tower3.jpg')),filename: 'tokyo-tower3.jpg')

post_comment3 = PostComment.create(
  title: "夏のお台場",
  comment: "花火が上がっていてとても綺麗でした。雰囲気も良く告白を切り出しやすかったです。",
  atmosphere_rate: 4.5,
  few_people_rate: 4.5,
  standard_rate: 4.5,
  all_rate: 4.5,
  confession_result: "no",
  post_id: 2,
  customer_id: 2,
  )
  post_comment3.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/odaiba2.jpg')),filename: 'odaiba2.jpg')

post_comment4 = PostComment.create(
  title: "水面に映る夜景",
  comment: "人が少なくとても静かで、雰囲気も良く告白を切り出しやすかったです！",
  atmosphere_rate: 4.5,
  few_people_rate: 4.5,
  standard_rate: 4.5,
  all_rate: 4.5,
  confession_result: "yes",
  post_id: 2,
  customer_id: 3
  )
  post_comment4.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/odaiba3.jpg')),filename: 'odaiba3.jpg')

post_comment5 = PostComment.create(
  title: "東京都写真美術館",
  comment: "美術館好きのお相手なら誘いやすいですね！",
  atmosphere_rate: 4.5,
  few_people_rate: 4.5,
  standard_rate: 4.5,
  all_rate: 4.5,
  confession_result: "no",
  post_id: 5,
  customer_id: 1
  )
  post_comment5.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/ebisu2.jpg')),filename: 'ebisu2.jpg')

post_comment6 = PostComment.create(
  title: "幻想的！",
  comment: "水族館なので雰囲気があり告白を切り出しやすかったです！",
  atmosphere_rate: 4.5,
  few_people_rate: 4.5,
  standard_rate: 4.5,
  all_rate: 4.5,
  confession_result: "yes",
  post_id: 10,
  customer_id: 1
  )
  post_comment6.comment_image.attach(io: File.open(Rails.root.join('app/assets/images/aqua2.jpg')),filename: 'aqua2.jpg')

PostTag.create!([
  {post_id:1,
   tag_id:1
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
  {post_id:3,
   tag_id:1
  },
  {post_id:3,
   tag_id:9
  },
  {post_id:4,
   tag_id:11
  },
  {post_id:5,
   tag_id:6
  },
  {post_id:6,
   tag_id:11
  },
  {post_id:6,
   tag_id:12
  },
  {post_id:7,
   tag_id:3
  },
  {post_id:8,
   tag_id:8
  },
  {post_id:9,
   tag_id:7
  },
  {post_id:10,
   tag_id:14
  },
])

3.times do |n|
  Relationship.create!(
    follower_id: 1,
    followed_id: (n + 2)
  )
end

9.times do |n|
  Relationship.create!(
    follower_id: (n + 2),
    followed_id: 1
  )
end

Favorite.create!([
  {customer_id: 1,
   post_id: 4
  },
  {customer_id: 1,
   post_id: 5
  },
  {customer_id: 1,
   post_id: 6
  }
])