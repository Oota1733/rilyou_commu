class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title,              null: false, default: ""
      t.text :body,              null: false, default: ""
      t.integer :user_id
      t.integer :tag_id, null: false
      t.integer :community_id, null: false
      t.boolean :public_status, default: true
      t.timestamps
    end
  end
end
