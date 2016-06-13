class ProductsController < ApplicationController
  include ProductsHelper

#before_action :set_product, only: [:show, :edit, :update, :destroy]
skip_before_filter :authenticate_user!#, :only => :show, :index
#skip_before_filter :authenticate
skip_before_filter :verify_authenticity_token
skip_before_filter :require_no_authentication
    config.to_prepare do
      Devise::SessionsController.skip_before_filter :your_before_filter_here
    end

  # GET /products
  # GET /products.json
  def index
    @products = Product.search(params[:search])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new

  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
def create
 @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
end








# POST /products
  # POST /products.json
  def apicreate
    @product_name = params[:product_name]
    @desc = params[:desc]
    @cat_id = 1
    @barcode = params[:barcode]
    @avatar = params[:avatar]
    @price = params[:price]
    @address = params[:address]
    @longitude = params[:longitude]
    @latitude = params[:latitude]
    @owner_id = 3
respond_to do |format|
  if @product_name!="" && @desc!="" && @cat_id!="" && @barcode!="" && @avatar!="" && @price!="" && @address!="" && @longitude!="" && @latitude!="" && @owner_id!=""
   @product = Product.find_by_barcode(@barcode)
    if @product == nil

            newproduct = Product.new
            newproduct.name = @product_name
            newproduct.description = @desc
            newproduct.category_id = @cat_id
            newproduct.barcode = @barcode


          if newproduct.save
            prodid = newproduct.id
            pri = Price.new
            pri.image = "gdf"#@avatar
            pri.price = @price
            pri.address = @address
            pri.longitude = @longitude
            pri.latitude = @latitude
            pri.user_id = 1#@owner_id
            pri.avg_rating = 5
            pri.product_id = prodid
            puts "before price"
            pri.save
            puts "after saveing price"
          #  format.html { render :inline => "1" }
#render :json =>{:auth_token => user.authentication_token ,:email =>user.email },:status =>201

             format.json { render :json => {:status=> "1"} }

          else
          #  format.html { render :inline => "2" }
           format.json { render :json =>  "2" }
          end



    else
          #  format.html { render :inline => "0" }
           format.json { render :json =>  "0" }
    end
  else
          #  format.html { render :inline => "2" }
             format.json { render :json =>  "2" }
  end

  end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, price: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

#GET fetch_products
  def from_category
<<<<<<< HEAD
    @products = Product.where(:category_id => params[:cat_id])

=======
    @products = product_scope.paginate(page: params[:page], per_page: 3)
    
>>>>>>> 2b2c306887732c24790de065f90dbc40d11ff02d
    respond_to do |format|
      format.html
      format.js
    end
  end

  def product_details

    @product_details = Product.where(:id => params[:product_id])
    @product_prices = Price.where(:product_id => params[:product_id]).paginate(page: params[:page], per_page: 3)
    set_current_product_id(params[:product_id])
    respond_to do |f|
      f.js
      f.json {render :json => @product_details}
    end
  end



  def apiproduct_update
 @product_name = params[:product_name]
 @product_name = params[:product_name]
 @desc = params[:desc]
 @product_id = params[:product_id]
 @res = Product.find_by_id(params[:product_id]).update(:name => @product_name ,:description => @desc , :category_id => @cat_id)
respond_to do |format|
      if @res
        format.json { render :show, status: :ok, location: @res }
      else
        format.json { render json: @res.errors, status: :unprocessable_entity }
      end
    end
  end


  def apiproduct_details
    @product = Product.find_by_id(params[:product_id])
    @price =Price.where(:product_id=>params[:product_id]).limit(1)
    respond_to do |f|
      f.json {render :json =>{ :product=>@product, :price=>@price}}
    end
  end


  def apiproduct_delete
    @product = Product.find_by_id(params[:product_id]).destroy

    respond_to do |f|
      f.json {render :json => @product}
    end
  end


  def apiListProductByCatID
    @products = Product.where(:category_id => params[:id].to_i)

    respond_to do |f|
      f.json {render :json => @products}
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :barcode)
    end


  def product_scope
      Product.where(:category_id => params[:cat_id])
  end
end
