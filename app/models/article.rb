class Article < ApplicationRecord
  belongs_to :user
  # categoriesテーブルとのアソシエーションです
  belongs_to :category
  # imagesテーブルとのアソシエーションです
  has_many :images, foreign_key: 'article_id'
  accepts_nested_attributes_for :images
  #CarrierWaveの設定です
  mount_uploader :thumbnail, ThumbnailUploader
  #タグ関連の設定です
  acts_as_taggable

  validates_numericality_of :category_id, :only_integer => true, :greater_than_or_equal_to => 1
  Article.order("created_at DESC")
end
