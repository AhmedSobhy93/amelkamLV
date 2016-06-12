class Comment < ActiveRecord::Base

	belongs_to :price
	belongs_to :user
end
