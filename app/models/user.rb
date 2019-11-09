class User < ActiveRecord::Base
    has_secure_password

    has_many :journal_entries
    has_many :moods, :through => :journal_entries
    
    validates :username, :email, :password, presence: true
end
