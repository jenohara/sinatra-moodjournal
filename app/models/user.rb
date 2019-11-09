class User < ActiveRecord::Base
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true


    has_many :journal_entries
    has_many :moods, :through => :journal_entries
end
