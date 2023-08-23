class CreateCreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :create_goals do |t|

      t.timestamps
    end
  end
end
