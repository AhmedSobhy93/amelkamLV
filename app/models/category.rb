class Category < ActiveRecord::Base

	belongs_to :category ,:class_name => 'Category'
	has_many :categories ,:class_name => 'Category' ,:foreign_key => "category_id" ,:dependent => :destroy
end
