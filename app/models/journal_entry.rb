class JournalEntry < ActiveRecord::Base
    belongs_to :user
    has_many :mood_journal_entries
    has_many :moods, :through => :mood_journal_entries
end
