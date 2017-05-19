class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :text, :null => true
    add_column :users, :cover_img, :text, :null => true
    add_column :users, :profiel, :text, :null => true, :limit => 120
    add_column :users, :hp_url, :text, :null => true
  end
end
