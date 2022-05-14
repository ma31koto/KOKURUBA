## KOKURUBA <告る場>

![readme](https://user-images.githubusercontent.com/94063037/168276636-f3924304-9f04-48af-8031-1956e496db62.gif)

### ◆サイト概要
告白場所レビューサイト</br>

主な機能</br>

・告白場所をマップ検索や、エリアやタグで絞り込み検索、並び替え一覧表示が可能</br>
・スポットに星レビューや告白成功率を表示（評価者全員の平均値）</br>
・管理者側を設定しアカウント管理が可能

### ◆サイトテーマ
明日は告白を控えた大事なデート！絶対にOKを貰いたい！しかしどこで告白すれば良いのかわからない…。</br>
そんな方の不安を解消し一発で理想の告白場所が探せる告白場所レビューサイト。

### ◆テーマを選んだ理由
私自身、過去に告白場所について困ったことがあり今回の開発きっかけとなりました。</br>
またマッチングアプリが普及し、出会いがより身近なものとなっている現代で、私と同じように告白場所</br>
について困ってる方の需要があると推測し、またそういった告白場所に特化したアフターケアのようなサ</br>
イトがあまり世の中にあまり見かけられなかった為、自身で作成しようと今回の開発に至りました。</br>
コロナ禍であまり外出ができず色々な場所へ頻繁に行けない世の中ですが、本サイトを利用し、外出や下</br>
見をしなくても、理想の告白場所を見つけ、少しでも告白成功の力、また思い出に残る告白場所になれば</br>
と思います。

### ◆ターゲットユーザ
・絶対に告白を成功させたい人。</br>
・過去に告白場所について困った・失敗した経験がある人。</br>
　（例：原宿竹下通りなど、人・お店も多くデート場所には良いが、告白するにはムードが全然ない…等）</br>
・告白場所のイメージが湧かない人。</br>
・いつ告白できるチャンスが来るか分からないので、デートの予定が確定している場所で、</br>
  念の為告白場所を調べておきたい人。</br>
・恋人はいるがプロポーズ場所を探している人。

### ◆主な利用シーン
・好きな相手に告白やプロポーズを決意しており告白場所を探したい時。</br>
・今後の為に告白スポットを知っておきたい場合。</br>
・いつ告白できるチャンスが来るか分からないので、デートの予定が確定している場所で、</br>
　念の為告白場所を調べておきたい場合。

## ◆設計書
##・ER図</br>
![suteru](https://user-images.githubusercontent.com/94063037/168416198-66ff953a-1e71-4087-9fc8-cc19eddf53c8.png)
・実装機能一覧</br>
|     | 機能                          |  gem / 備考                      |
| --- | ----------------------------- | -------------------------------- |
|  1  |会員/管理者(ログイン機能)      | devise                           |
|  2  |フォロー機能                   | Ajax(非同期)                     |
|  3  |スポット投稿機能               | ×                                |
|  4  |コメント機能                   | ×                                |
|  5  |地図検索・表示機能             | Google Map API                   |
|  6  |住所情報取得機能               | geocoder                         |
|  7  |星レビュー機能                 | raty.js                          |
|  8  |告白成功率機能                 | × 　　　　　                     |
|  9  |タグ機能                       | ×                                |
|  10 |検索機能                       | ransack                          |
|  11 |ランキング機能                 | ×                                |
|  12 |お気に入り機能                 | Ajax(非同期)                     |
|  13 |ページネーション機能           | kaminari                         |
|  14 |rails/devise日本語化           | rails-i18n                       |
|  15 |レスポンシブ対応(会員側)       | Bootstrap                        |
|  16 |コード解析                     | RuboCop                          |
|  17 |単体・結合テスト(一部)	      | RSpec                            |
|  18 |自動デプロイ                   | AWS, Github Actions(CI/CDツール) |
|  19 |ドメイン指定                   | お名前.com / AWSRoute 53         |
|  20 |https設定                      | Certbot                          |

##・テーブル定義書</br>
https://docs.google.com/spreadsheets/d/1N9lSC_y8pFyS9C14Lqt-CnbO44N1_A5_fyNidsl46zg/edit#gid=1373217982</br>
##・詳細設計</br>
https://docs.google.com/spreadsheets/d/1htXMWH3dE_1wGEddYUeKXyawQNXqKhFoa-4Hzsyh8f0/edit#gid=2133469642

## ◆開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## ◆使用素材
canva https://www.canva.com/ja_jp/