class PricesController < ApplicationController

  # load_and_authorize_resource
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.all
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to @price, notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to @price, notice: 'Price was successfully updated.' }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to prices_url, notice: 'Price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #POST
  def apicreate
       @image = params[:image]
       @price = params[:price]
       @address = params[:address]
       @long = params[:longitude]
       @lat = params[:latitude]
       @avg_rating = 100.0
       @product_id = 1
       @user_id = 2

       price =Price.new

       price.image= @image
       price.price= @price
       price.address=@address
       price.longitude = @long
       price.latitude = @lat
       price.avg_rating=@avg_rating
       price.product_id=@product_id
       price.user_id=@user_id



      respond_to do |format|
        if price.save
          format.json {render :json => {:status=> "1"} }
        else
          format.json { render :json => {:status=> "2"} }
        end
      end


    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
      params.require(:price).permit(:image, :price, :address, :longitude, :latitude, :avg_rating)
    end



end
