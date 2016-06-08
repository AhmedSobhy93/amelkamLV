class Price < ActiveRecord::Base
  has_one :products
	
  mount_uploader :image, AvatarUploader
  belongs_to :product
end
