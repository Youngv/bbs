class User < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation, :email, :state
   validates :username, :email, presence: true, uniqueness: true
   validates :password, presence: true
   has_secure_password
   has_many :posts
end
