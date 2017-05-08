class AddCategoryIdToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :category_id, :integer, :null => false, :foreign_key => true
  end
end
