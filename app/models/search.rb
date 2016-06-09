class Search < ActiveRecord::Base
		def search_prices
		prices = Price.all

		prices = prices.where(["address LIKE ?","%#{address}%"]) if address.present?
		prices = prices.where(["price >= ?",min_price]) if min_price.present?
		prices = prices.where(["price <= ?",max_price]) if max_price.present?

		return prices
	end
end
