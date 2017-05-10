class CreateImpressionsTable < ActiveRecord::Migration
  def self.up
    create_table :impressions, :force => true do |t|
      t.string :impressionable_type
      t.integer :impressionable_id
      t.integer :user_id
      t.string :controller_name
      t.string :action_name
      t.string :view_name
      t.string :request_hash
      t.string :ip_address
      t.string :session_hash
      t.text :message
      t.text :referrer
      t.text :params
      t.timestamps
    end
  end
end
