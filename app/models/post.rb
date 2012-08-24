class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  validates :title, :content, presence: true
  has_many :comments
end
