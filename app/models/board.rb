class Board < ActiveRecord::Base
  attr_accessible :description, :mainboard_id, :name
  belongs_to :mainboard
  has_many :posts
  def same_as_record
  	"#{name}"
  end
end
