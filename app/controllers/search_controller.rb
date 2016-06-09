class SearchController < ApplicationController
  def index
  	@products_search = Product.search(params[:name]).all

  	respond_to do |format|
      format.js
    end
  end
end
