# coding: utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :title, :board_id
  validates_presence_of :title, :content, :board_id

  belongs_to :user
  has_many :comments
  belongs_to :board
end