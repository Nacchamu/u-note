# README

# ChatSpaceデータベース設計
## 必要となるテーブル
・usersテーブル(deviseを使用)…ユーザー登録時に入力されたデータを保存。  
・articlesテーブル…管理者及びユーザーによって作成された記事のデータを保存。  
・favoritesテーブル…どのユーザーがどの記事をお気に入り登録しているかのデータを保存。  
・categoriesテーブル…サービス内に存在する記事のカテゴリーを保存。  
・tagsテーブル(acts-as-taggable-onを使用)…サービス内に存在する記事のタグを保存。  
・taggingsテーブル…どのタグがどの記事に付いているのかを保存。  
・impressionsテーブル(impressionistを使用)…誰がどの記事を読んだのかを保存。  
・relatinoshipsテーブル…誰が誰をフォローしているかを保存。  
・article_tagsテーブル…articlesテーブルとtagsテーブルの中間テーブル。

## 各テーブルの構造
### ・usersテーブル(devise使用)
<!-- articlesテーブルとのアソシエーション -->
has_many :articles  
has_many :favorites

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |false |
|email |string |false|false |true  |
|pass  |string |false|false |false |
|avatar|text   |false|true  |false |
|cover_img|text|false|true  |false |
|profiel|text  |false|true  |false |
|hp_url|text   |false|true  |false |


* * *
### ・articlesテーブル
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
|thumbnail  |text   |false|false |false |false      |
|category_id|integer|false|false |false |true       |


* * *
### ・favoritesテーブル
belongs_to :user  
belongs_to :article

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|user_id    |integer|true |false |false |true       |
|article_id |integer|false|false |false |true       |


* * *
### ・categoriesテーブル
<!-- articlesテーブルとのアソシエーション -->
has_many :articles  

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|name  |string |true |false |true  |


* * *
### ・tagsテーブル(acts-as-taggable-on使用)
<!-- articlesテーブルとのアソシエーション -->
has_many :articles ,through: :taggings  
has_many :taggings  

|column|type   |index|null  |unique|
|------|-------|-----|------|------|
|tag_id |string |true |false |true  |


* * *
### ・taggingsテーブル(acts-as-taggable-on使用)
<!-- articlesテーブルとのアソシエーション -->
has_many :articles ,through: :article_tags  
has_many :article_tags  

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|tag_id     |integer|true |false |false |true       |
|taggable_type|string|false|false |false|false      |
|taggable_id|integer|false|false |false |true       |
|tagger_type|string |false|false |false |false      |
|tagger_id  |integer|false|false |false |true       |
|taggable_id|integer|false|false |false |true       |


* * *
### ・impressionsテーブル(impressionist使用)
belongs_to :article
belongs_to :user

|column           |type   |index|null  |unique|foreign_key|
|-----------------|-------|-----|------|------|-----------|
|impressionable_id|integer|false|false |false |true       |
|user_id          |integer|true |false |false |true       |


* * *
### ・relationshipsテーブル
belongs_to :follower, class_name: "User"  
belongs_to :followed, class_name: "User"

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|follower_id|integer|false|false |false |true       |
|followed_id|integer|true |false |false |true       |


* * *
### ・article_tagsテーブル(中間テーブル)
belongs_to :article  
belongs_to :tag

|column     |type   |index|null  |unique|foreign_key|
|-----------|-------|-----|------|------|-----------|
|article_id |integer|true |false |false |true       |
|tag_id     |integer|false|false |false |true       |
