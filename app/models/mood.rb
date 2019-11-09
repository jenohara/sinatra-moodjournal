class Mood < ActiveRecord::Base
    has_many :mood_journal_entries
    has_many :journal_entries, :through => :mood_journal_entries
    has_many :users, :through => :journal_entries
end