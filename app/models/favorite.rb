class Favorite < ApplicationRecord
  # usersテーブルとのアソシエーションです
  belongs_to :user
  # articlesテーブルとのアソシエーションです
  belongs_to :article
end
