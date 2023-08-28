class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.text :description
      t.integer :user_id
      t.date :deadline

      t.timestamps
    end
  end
end
