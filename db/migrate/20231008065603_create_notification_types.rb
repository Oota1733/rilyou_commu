class CreateNotificationTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_types do |t|

      t.timestamps
    end
  end
end
