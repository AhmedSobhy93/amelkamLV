class Price < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  belongs_to :product
end
