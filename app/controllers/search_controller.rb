class SearchController < ApplicationController
  def index
  	cat_id = params[:product][:category_id]
  	product_name = params[:name]

  	#@products_search = Product.search(params[:name]).where(:category_id => :cat_id).all
  	#@products_search=Product.where(:category_id => cat_id AND ).where(['name LIKE ?', "%#{product_name}%"])

  	if cat_id.blank? or product_name.blank?
  		@products_search=nil
  	else
  		@products_search = Product.where("name LIKE :name1 AND category_id = :category_id1",
  {:name1 => "#{product_name}%", :category_id1 => cat_id}).all
  	end	

  	respond_to do |format|
      		format.js 
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



