class AddColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :thumbnail, :text, :null => true
    remove_column :articles, :articles, :integer
  end
end
