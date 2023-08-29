class CreateUsers < ActiveRecord::Migration[7.0]

  def up
    create_table :users do |t|
      t.string "fist_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "role", :default => 'user'
      t.date "date_of_birth"
      t.date "joining_date"
      t.timestamps
    end

  end

  def down 
    drop_table :users;
  end

end
