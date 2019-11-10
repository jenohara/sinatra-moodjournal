class User < ActiveRecord::Base
    has_secure_password

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

    has_many :journal_entries
    has_many :moods, :through => :journal_entries
end
