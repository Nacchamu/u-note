class RemoveThumbnailFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :thumbnail_file_name
    remove_column :articles, :thumbnail_content_type
    remove_column :articles, :thumbnail_file_size
    remove_column :articles, :thumbnail_updated_at
  end
end
