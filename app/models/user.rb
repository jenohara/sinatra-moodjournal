class User < ActiveRecord::Base
    has_secure_password
    validate :username, :email, password, present: true
end
