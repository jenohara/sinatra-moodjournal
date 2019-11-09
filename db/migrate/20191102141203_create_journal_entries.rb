class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.date :date
      t.string :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
