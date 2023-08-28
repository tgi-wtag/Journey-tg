class CreateUsers < ActiveRecord::Migration[7.0]

  def up
    create_table :users, id: false do |t|
      t.integer "user_id", primary_key: true #primary key
      t.string "fist_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "role", :default => 'user'
      t.date "date_of_birth"
      t.date "joining_date"
      t.timestamps
      #t.datetime "created_at"
      #t.datetime "updated_at"
    end

  end

  def down 
    drop_table : users;
  end

end