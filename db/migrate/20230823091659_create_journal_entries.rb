class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def up
    create_table :journal_entries do |t|
      t.string :title
      t.date :date
      t.text :content
      t.timestamps
    end
  end

  def down
    drop_table :journal_entries
  end
end
