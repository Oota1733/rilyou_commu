class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :name, null: false
      t.string :introduction,null:false
      t.integer :user_id, null:false
      t.integer :notification_type_id

      t.timestamps
    end
  end
end
