class CreateMoodJournalEntries < ActiveRecord::Migration
  def change
    create_table :mood_journal_entries do |t|
      t.integer "journal_entry_id"
      t.integer "mood_id"
    end
  end
end
