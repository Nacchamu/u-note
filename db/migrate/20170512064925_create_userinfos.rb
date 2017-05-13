class CreateUserinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :userinfos do |t|
      t.text :avatar, null: true
      t.text :cover_img, null: true
      t.text :profiel, null: true, :limit => 120
      t.text :hp_url, null: true
      t.integer :user_id, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
