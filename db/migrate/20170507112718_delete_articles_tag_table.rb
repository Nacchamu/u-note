class DeleteArticlesTagTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :article_tags
  end
end
