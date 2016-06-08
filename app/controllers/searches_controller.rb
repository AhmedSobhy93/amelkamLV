class SearchesController < ApplicationController

	def new
		@search = Search.new
		# should return the name from table product 
		#@price = Price.uniq.pluck(:name)
		#@price = Price.uniq.pluck(:address)
		@product = Product.uniq.pluck(:name)
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private

	def search_params
		params.require(:search).permit(:min_price,:max_price,:address,:name)
	end

end
