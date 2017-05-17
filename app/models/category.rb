class Category < ApplicationRecord
  # articlesテーブルとのアソシエーションです
  has_many :articles
end
