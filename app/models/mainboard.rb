class Mainboard < ActiveRecord::Base
  attr_accessible :name
  has_many :boards

  def same_as_record
  	"#{name}"
  end
end
