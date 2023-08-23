class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.date :date
      t.text :content

      t.timestamps
    end
  end
end
