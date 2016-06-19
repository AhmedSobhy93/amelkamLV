class Price < ActiveRecord::Base
  # has_one :products
	
  attr_accessible :image,:price,:address,:product_id,:user_id,:avg_rating

  mount_uploader :image, AvatarUploader
  


  belongs_to :product
  belongs_to :user
  has_many :comments
  has_many :rates
end
