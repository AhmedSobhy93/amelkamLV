class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
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
    @product_name = params[:product][:product_name]
    @desc = params[:product][:desc]
    @cat_id = params[:product][:cat_id]
    @barcode = params[:product][:barcode]
    @image = params[:product][:image]
    @price = params[:product][:price]
    @address = params[:product][:address]
    @longitude = params[:product][:longitude]
    @latitude = params[:product][:latitude]
    @owner_id = params[:product][:owner_id]
  if @product_name!="" && @desc!="" && @cat_id!="" && @barcode!="" && @image!="" && @price!="" && @address!="" && @longitude!="" && @latitude!="" && @owner_id!=""
   @product = Product.find_by_barcode(@barcode)
    if @product!= nil
        respond_to do |format|
            newproduct = Proudct.new
            newproduct.name = @product_name
            newproduct.description = @desc
            newproduct.category_id = @cat_id
            newproduct.barcode = @barcode
            
            
          if product.save
            prodid = product.id
            pri = Price.new
            pri.image = @image
            pri.price = @price
            pri.address = @address
            pri.longitude = @longitude
            pri.latitude = @latitude
            pri.user_id = @owner_id
            pri.avg_rating = "5"
            pri.product_id = @product_id
            pri.save
            format.html { render :inline => "1" }
            
          else
            format.html { render :inline => "2" }
          end
        end


        
    else
        respond_to do |format|
            format.html { render :inline => "0" }
        end
    end 
  else
      respond_to do |format|
            format.html { render :inline => "2" }
        end
  end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, price: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :barcode)
    end
end
