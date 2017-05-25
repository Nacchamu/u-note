class RemoveThumbnailFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :thumbnail, :text
  end
end
