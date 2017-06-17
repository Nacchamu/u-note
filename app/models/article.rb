class Article < ApplicationRecord
  # usersテーブルとのアソシエーションです
  belongs_to :user
  # favoritesテーブルとのアソシエーションです
  has_many :favorites
  # categoriesテーブルとのアソシエーションです
  belongs_to :category
  # imagesテーブルとのアソシエーションです
  has_many :images, foreign_key: 'article_id'
  accepts_nested_attributes_for :images
  #タグ関連の設定です
  acts_as_taggable
  # ビュー数カウントの設定です
  # is_impressionable
  # サムネイルをアップロードする際の設定です
  mount_uploader :thumbnail, ThumbnailUploader

  validates_numericality_of :category_id, :only_integer => true, :greater_than_or_equal_to => 1

end
