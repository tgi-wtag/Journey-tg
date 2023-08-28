class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.integer :user_id
      t.date :date
      t.text :content
      t.timestamps
    end
    
  end
end
