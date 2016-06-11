module ProductsHelper

	def set_current_product_id(product_id)
		cookies[:product_id] = product_id 
	end

	def get_current_product_id
		cookies[:product_id]
	end

	def delete_current_product_id
		cookies.delete(:product_id)
	end

end
