class DropArticleCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :article_categories
  end
end
