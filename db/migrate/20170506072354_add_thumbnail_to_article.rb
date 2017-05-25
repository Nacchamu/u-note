class AddThumbnailToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :thumbnail, :integer, :null => false
  end
end
