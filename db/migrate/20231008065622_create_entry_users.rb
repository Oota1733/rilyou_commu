class CreateEntryUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_users do |t|
      
      t.references :user, foreign_key: true
      t.references :commumity, foreign_key: true

      t.timestamps
    end
  end
end
