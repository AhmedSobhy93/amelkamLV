class Rate < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  belongs_to :price

  attr_accessible :rate

end