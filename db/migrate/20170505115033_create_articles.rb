class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, index: true, null: false, unique: false, foreign_key: false
      t.text :text, index: false, null: false, unique: false, foreign_key: false
      t.integer :user_id, index: true, null: false, unique: false, foreign_key: true
      t.timestamps
    end
  end
end
