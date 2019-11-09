class MoodJournalEntry < ActiveRecord::Base
    belongs_to :mood 
    belongs_to :journal_entry
end