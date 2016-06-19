class SearchController < ApplicationController

	 skip_before_filter :verify_authenticity_token

  def index
  	cat_id = params[:product][:category_id]
  	product_name = params[:name]
  	producy_city = params[:city]
  	#@products_search = Product.search(params[:name]).where(:category_id => :cat_id).all
  	#@products_search=Product.where(:category_id => cat_id AND ).where(['name LIKE ?', "%#{product_name}%"])

  	if cat_id.blank? or product_name.blank? or params[:address].blank? or params[:min].blank? or params[:max].blank?
  		@products_search=nil
  	else	#.joins(:price).where('prices.address = ?',producy_city).
  # 		@products_search = Product.where("name LIKE :name1 AND category_id = :category_id1",
  # {:name1 => "%#{product_name}%", :category_id1 => cat_id}).all.paginate(page: params[:page],per_page: 3)
  			@products_search = Product.joins(:prices)
  				.group(:product_id)
  				.where("prices.address like :address AND prices.price BETWEEN :min AND :max",{:address => params[:address],min:params[:min],max:params[:max]})
  				.paginate(page: params[:page],per_page: 3)

  	end	
  	respond_to do |format|
  			format.js
    end
  end


  def apiAdvancedSearch

  	product_name = params['product_name']
  	category_id = params['category_id']
  
  	if product_name.blank? or category_id.blank? or params[:address].blank? or params[:min].blank? or params[:max].blank?
		@products_search=nil
	else
	  	@products_search = Product.joins(:prices)
  				.group(:product_id)
  				.where("prices.address like :address AND prices.price BETWEEN :min AND :max",{:address => params[:address],min:params[:min],max:params[:max]})
  	end		

  		respond_to do |format|
  			if @products_search.nil?
  				format.json { render json: 'empty' }
  			else
  				format.json { render json: @products_search, status: 200 }
  			end
   		end	
  end


  def apiSearch
  	barcode = params[:barcode]

  	if barcode.blank?
  		@products_search=nil
  	else
  		@products_search = Product.where("barcode = ?",barcode).all
  	end	
render :status=>200,:json=>@products_search

  	#respond_to do |format|
      	#	format.js 
    #end
  end

end



