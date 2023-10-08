class CreateEntryUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_users do |t|

      t.timestamps
    end
  end
end
