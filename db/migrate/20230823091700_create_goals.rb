class CreateGoals < ActiveRecord::Migration[7.0]
  def up
    create_table :goals do |t|
      t.text :description
      t.date :deadline
      t.integer :status
      t.timestamps
    end
  end

  def down
    drop_table :goals
  end
end
