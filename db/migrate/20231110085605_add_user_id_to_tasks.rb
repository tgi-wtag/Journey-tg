class AddUserIdToTasks < ActiveRecord::Migration[7.0]
  def up
    add_reference :tasks, :user, null: false, foreign_key: true
    remove_column :tasks, :attached_document
  end

  def down
    add_column :tasks, :attached_document, :string
    remove_reference :tasks, :user
  end
end
