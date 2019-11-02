class AddColumnsToJournalEntries < ActiveRecord::Migration
  def change
    add_column :journal_entries, :date, :string
    add_column :journal_entries, :happy, :string
    add_column :journal_entries, :excited, :string
    add_column :journal_entries, :calm, :string
    add_column :journal_entries, :bored, :string
    add_column :journal_entries, :tired, :string
    add_column :journal_entries, :sad, :string
    add_column :journal_entries, :angry, :string
    add_column :journal_entries, :frustrated, :string
    add_column :journal_entries, :hurting, :string
  end
end
