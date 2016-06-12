class Product < ActiveRecord::Base

	# belongs_to :prices
	
	def self.search(search)
		if search
			where(["name LIKE ?","%#{search}%"])
		else
			all
		end
	end

  	mount_uploader :image, AvatarUploader
	has_many :prices


	def self.search name
	  return scoped unless name.present? 
	  where(['name LIKE ?', "%#{name}%"]) 
	end
end
