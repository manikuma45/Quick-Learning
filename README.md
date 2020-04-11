# README

# Quick Learning

## 概要
オンライン学習サービスを、プログラミング知識のないクライアントでも簡単に作成することができるアプリ。

## コンセプト
簡単に学習教材がつくれるアプリ

## バージョン
Ruby 2.6.5
Rails 5.2.3

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
- [ ] スライダーで科目を表示
- [ ] ドロップダウンメニューでパートリストを表示
- [ ] パートの投稿機能
- [ ] パートの編集機能
- [ ] パートの削除機能
- [ ] パートの編集＆削除制限
- [ ] 完了フラグ
- [ ] 科目の作成
- [ ] 科目の編集
- [ ] 科目の削除機能
- [ ] 科目の編集＆削除制限
- [ ] 質問の投稿機能
- [ ] 質問の編集機能
- [ ] 質問の削除機能
- [ ] 質問の編集＆削除制限
- [ ] プロジェクトの作成機能
- [ ] プロジェクトの削除機能
- [ ] プロジェクトの編集＆削除制限
- [ ] パスワード再設定機能
- [ ] パートのチェックリスト
- [ ] パートの内容へ画像を挿入する機能
- [ ] ワード検索機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1_k-UFB-6Sb1FEchjiMbo6ZMwX-XbJV-OSMx5nkjBJ8g/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1nwlEokdql6ozJdDMMHfTbcSMS6KVTLY0kKPvHV6kioY/edit?usp=sharing

## 画面遷移図
https://app.moqups.com/VKQTU6vcDo/view/page/aa9df7b72

## 画面ワイヤーフレーム
https://cacoo.com/diagrams/Y8E9yUbYhZFCDFXi/E710C

## ER図
https://cacoo.com/diagrams/kn8uD7ncqCcBKbtV/943B8

## 使用予定Gem
* ransack
* devise

# English Ver

# README

# Quick Leaning

## Overview
Erementary school boys & girls also be able to use this easy and this use programing only!You can write blog easy and quickly because this function is very few. Add to it, you can use code box with one click! So your job is very light.

## Concept
write blog very easy!

## Version
Ruby 2.6.5
Rails 5.2.3

## Functions list
- [ ] Login function
- [ ] User registration function
  - [ ] Email address, name and password are required
- [ ] Password reset function
- [ ] Blog list display function
  - [ ] Show number of comments
  - [ ] Show number of favorites
- [ ] Blog post function
  - [ ] Title and article content is required
- [ ] Blog edit function
- [ ] Blog deletion function
  - [ ] Posters can only do blog edit and blog deletion
- [ ] Blog favorite function
  - [ ] You can favorite only once per one blog
  - [ ] You can't favorite your own blog
- [ ] Comment post function
- [ ] Comment deletion function
- [ ] Comment edit function
  - [ ] Only comment contributors can edit and delete comments
- [ ] The comment function and favorite function can be executed without page transition.

## Catalog design,Table_Definition,Screen transition diagram,,Wire frame
https://docs.google.com/spreadsheets/d/1_k-UFB-6Sb1FEchjiMbo6ZMwX-XbJV-OSMx5nkjBJ8g/edit?usp=sharing

## To be used Gem
* devise
* ransack
