# プロジェクト概要
#### タイトル
 チャット小説投稿サイト dynamic novel

#### コンセプト
チャット小説作品内に登場する専門用語を、その場で確認できるサイト

小説に限らず情報コンテンツに専門用語が出て来る事がある。  
そもそも専門用語を使用して、読者を置いてきぼりにしているコンテンツ自体が欠陥でしかないが、  
読者側としては専門用語の理解に一瞬の手間を取ることなく内容を把握したい。  

それでも内容を読み込んでいる途中で、用語の内容を忘れてしまったり、用語を初めて出される場面で負担がかかってしまう。  

本サイトについて  
・作者は作品内容と別に、作品内で登場する用語説明の情報を持たせることが出来る。  
・読者は作品を読んでいる最中、同一ページ上に作者の用意した用語説明を確認することが出来る。  

読者側の用語の理解に掛かる負担を軽減させ、  
作品を最後まで集中して読めるようにされた作品を本サイトに集約し一般公開する。  

# 動作確認方法
## 各コンテナ起動
`docker compose -f "docker-compose.yml" up -d`

## dynamic_novel/api:1.0コンテナで実行
#### ライブラリ更新
`go mod tidy`

#### DB接続、connect-go構築
`rm -rf db && sqlboiler psql && rm -rf gen && buf generate`

#### APIサーバ起動
`go run main.go`

## dynamic_novel/web:1.0コンテナで実行
#### ※envファイルの設定が必要
.env.devを元に .envファイルを作成

#### ライブラリインストール
`yarn`

#### DB構築
`yarn prisma migrate dev`

#### テストデータ作成
`yarn node --import ./ts-node.register.mjs prisma/seed-master`
`yarn node --import ./ts-node.register.mjs prisma/seed`

#### フロントエンド起動
`yarn dev`


## `http://localhost:3000/` にて各種ページを用意、逐次作成中

- ユーザ
http://localhost:3000/user/「DBデータより確認：ユーザID」
- 作品編集
http://localhost:3000/user/「DBデータより確認：ユーザID」/dynamic/2/1/1
- 作品閲覧
http://localhost:3000/dynamic/2/1/1
- 作品検索
http://localhost:3000/search

