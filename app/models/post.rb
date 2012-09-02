class Post < ActiveRecord::Base
  attr_accessible :content, :title, :board_id
  belongs_to :user
  validates :title, :content, :board_id, presence: true
  has_many :comments
  belongs_to :board
end
