# 📗 Bible

Bibleはノート管理アプリです。
<br>
下記の機能により、自分でノートを作成し、管理・運用することができます。
* テキスト記載
* 画像挿入
* リンク作成
* 必要なノート検索
* 不要なノートのゴミ捨て

<br>

# 🌐 アプリURL
### **http://54.150.18.21:3000**

<br>

# 👀 テストアカウント
メールアドレス：taro@sample.com

パスワード：tarotaro1

<br>

# 🌅 制作背景
オンライン学習に最適なノート及びその管理ツールを作成することが目的です。
機能の実装意図は下記の要件定義の通りとなっております。

<p align="center">
  <img src="http://54.150.18.21:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e992f54a2800ef84ee63c6920c73f37f514cdb0c/d6da12efba6ecf41ad8f96cfc7e47d6d.png" width=100%>  
</p>

<br>

# 😏 今後実装予定の内容
* ドラッグアンドドロップによるノートの並び順変更
* パスワード再発行機能
* 動画挿入機能

<br>

# :octocat:使用技術(開発環境)
* フレームワーク: Ruby on Rails
* フロントエンド: HTML、CSS、JavaScript
* インフラ: Docker、AWS
* バージョン管理: Git、GitHub

<br>

# 🎨 DB設計

## users table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :notes

<br>

## notes table

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| trash       | boolean |                                |
| user_id     | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

<br>
