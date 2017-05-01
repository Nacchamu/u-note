# README

# ChatSpaceデータベース設計
## 必要となるテーブル
1,usersテーブル(deviseを使用)…ユーザー登録時に入力されたデータを保存。  
2,articlesテーブル…管理者及びユーザーによって作成された記事のデータを保存する場所です。  
3,imagesテーブル…記事投稿時に付属した写真のデータを保存する場所です。  
4,categoriesテーブル…サービス内に存在する記事のカテゴリーを記録する場所です。  
5,tagsテーブル…サービス内に存在する記事のタグを記録する場所です。  
6,article_categroiesテーブル…articlesテーブルとcategoriesテーブルの中間テーブルです。  
7,article_tagsテーブル…articlesテーブルとtagsテーブルの中間テーブルです。

## 各テーブルの構造
### 1,usersテーブル(devise使用)
<!-- articlesテーブルとのアソシエーション -->
has_many :articles

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |false |
|email |string |false|false |true  |
|pass  |string |false|false |false |


* * *
### 2,articlesテーブル
<!-- usersテーブルとのアソシエーション -->
belongs_to :user  
<!-- tagsテーブルとのアソシエーション -->
has_many :tags ,through :article_tags  
has_many :article_tags
<!-- categoriesテーブルとのアソシエーション -->
has_many :categories ,through :article_categories  
has_many :article_categories  
<!-- imagesテーブルとのアソシエーション -->
has_many :images

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|title      |string |true |false |false |false      |
|text       |text   |false|false |false |false      |
|user_id    |integer|false|false |false |true       |


* * *
### 3,imagesテーブル
<!-- articlesテーブルとのアソシエーション -->
belongs_to :article  

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|article_id |integer|true |false |false |true       |
|img_url    |integer|false|false |false |true       |


* * *
### 4,categoriesテーブル
<!-- articlesテーブルとのアソシエーション -->
has_many :articles ,through: :article_categories  
has_many :article_categories  

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |true  |


* * *
### 5,tagsテーブル
<!-- articlesテーブルとのアソシエーション -->
has_many :articles ,through: :article_tags  
has_many :article_tags  

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |true  |


* * *
### 6,article_categroiesテーブル(中間テーブル)
belongs_to :article  
belongs_to :category

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|article_id |integer|true |false |false |true       |
|category_id|integer|false|false |false |true       |


* * *
### 6,article_tagsテーブル(中間テーブル)
belongs_to :article  
belongs_to :tag

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|article_id |integer|true |false |false |true       |
|tag_id     |integer|false|false |false |true       |
