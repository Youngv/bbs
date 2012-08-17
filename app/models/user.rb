class User < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation, :email
   validates :username, :email, presence: true, uniqueness: true
   validates :password, :password_confirmation, presence: true
   has_secure_password
end
