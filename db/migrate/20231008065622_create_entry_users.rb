class CreateEntryUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_users do |t|

      t.references :user, type: :integer, foreign_key: true

      t.references :commumity, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
