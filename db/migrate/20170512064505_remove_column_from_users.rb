class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar, :text, :null => true
    remove_column :users, :cover_img, :text, :null => true
    remove_column :users, :profiel, :text, :null => true, :limit => 120
    remove_column :users, :hp_url, :text, :null => true
  end
end
