class AlterTableJournalEntries < ActiveRecord::Migration[7.0]
  def up
    add_reference :journal_entries, :user, foreign_key: true
  end

  def down
    remove_reference :journal_entries, :user, foreign_key: true
  end
end
