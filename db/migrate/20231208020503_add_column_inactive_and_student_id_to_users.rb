class AddColumnInactiveAndStudentIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :inactive, :boolean, null: false, default: false
    add_column :users, :student_id, :string
  end
end
