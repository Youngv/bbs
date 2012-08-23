# coding: utf-8
class User < ActiveRecord::Base
   attr_accessible :username, :password, :password_confirmation, :email, :state
   validates :username, :email, presence: true, uniqueness: true
   validates :password, format: {with: /\A\w+\z/, message: '只允许数字、大小写字母和下划线'}, length: {in: 3..20}, presence: true
   has_secure_password
   has_many :posts, :dependent => :destroy
   has_many :comments, :dependent => :destroy
end
