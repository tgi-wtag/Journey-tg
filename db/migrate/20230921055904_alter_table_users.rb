class AlterTableUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :role, :integer, default: 0
    add_column :users, :designation, :string
    add_column :users, :email, :string
    add_column :users, :passwort_digest, :string
    rename_column :users, :fist_name, :first_name
  end

  def down
    rename_column :users, :first_name, :fist_name
    remove_column :users, :role
    remove_column :users, :designation
    remove_column :users, :email
    remove_column :users, :passwort_digest
  end
end
