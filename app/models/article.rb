class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  # categoriesテーブルとのアソシエーションです
  belongs_to :category
  # imagesテーブルとのアソシエーションです
  has_many :images, foreign_key: 'article_id'
  accepts_nested_attributes_for :images
  #タグ関連の設定です
  acts_as_taggable

  # paperclip用の設定です
  has_attached_file :thumbnail,
                    styles:  { medium: "150x150#", thumb: "150x150!" }
  validates_attachment_content_type :thumbnail,
                                    content_type: ["image/jpg","image/jpeg","image/png"]

  validates_numericality_of :category_id, :only_integer => true, :greater_than_or_equal_to => 1
end
