class CreateCreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :create_journal_entries do |t|

      t.timestamps
    end
  end
end
