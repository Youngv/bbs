class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates :title, :content, presence: true
  has_many :comments
end
