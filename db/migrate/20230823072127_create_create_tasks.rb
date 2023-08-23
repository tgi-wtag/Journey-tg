class CreateCreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :create_tasks do |t|

      t.timestamps
    end
  end
end
