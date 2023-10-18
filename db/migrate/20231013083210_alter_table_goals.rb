class AlterTableGoals < ActiveRecord::Migration[7.0]
  def up
    add_reference :goals, :user, foreign_key: true
  end

  def down
    remove_reference :goals, :user, foreign_key: false
  end
end
