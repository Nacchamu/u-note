class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :article_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
