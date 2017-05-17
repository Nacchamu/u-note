class Image < ApplicationRecord
  # articlesテーブルとのアソシエーションです
  belongs_to :article
end
