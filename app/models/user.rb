class User < ActiveRecord::Base
    has_secure_password

    has_many :journal_entries
    
    validates :username, :email, :password, presence: true
end
