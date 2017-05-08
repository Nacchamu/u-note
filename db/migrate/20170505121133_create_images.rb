class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :article_id, index: true, null: false, unique: false, foreign_key: true
      t.integer :img_url, index: false, null: false, unique: false, foreign_key: true

      t.timestamps
    end
  end
end
