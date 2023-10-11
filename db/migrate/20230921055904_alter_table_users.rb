class AlterTableUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :designation, :string
    add_column :users, :email, :string, null: false
    add_column :users, :password_digest, :string, null: false
    add_column :users, :password_confirmation, :string
    rename_column :users, :fist_name, :first_name
    change_column :users, :date_of_birth, :date, null: false
  end

  def down
    rename_column :users, :first_name, :fist_name
    remove_column :users, :role
    remove_column :users, :designation
    remove_column :users, :email
    remove_column :users, :password_digest
    remove_column :users, :password_confirmation
  end
end
