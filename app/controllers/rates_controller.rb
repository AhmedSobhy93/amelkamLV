class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_filter :verify_authenticity_token  

  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
  end

  # GET /rates/new
  def new
    @rate = Rate.new
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  # POST /rates.json
  def create
    @rate = Rate.new(rate_params)

    respond_to do |format|
      if @rate.save
        format.html { redirect_to @rate, notice: 'Rate was successfully created.' }
        format.json { render :show, status: :created, location: @rate }
      else
        format.html { render :new }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    respond_to do |format|
      if @rate.update(rate_params)
        format.html { redirect_to @rate, notice: 'Rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @rate }
      else
        format.html { render :edit }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate.destroy
    respond_to do |format|
      format.html { redirect_to rates_url, notice: 'Rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 ###get
  def update_rate
    

    # @rate1 = Rate.where("price_id = :price_id AND user_id = :user_id",{:price_id => params[:price_id], :user_id => params[:user_id]})
    @rate1 = Rate.where(price_id: params[:price_id]).where(:user_id => current_user.id)
    
    if @rate1.empty?
      @rate1 = Rate.new
      @rate1.price_id = params[:price_id]
      @rate1.user_id = current_user.id
      @rate1.rate = params[:rate]
      @rate1.save
    end

    respond_to do |format|
      if @rate1.update_all(:rate => params['rate'])

        avg_rating = Rate.group(:price_id).average(:rate)
        # puts avg_rating.to_h[1]

        price_avg = Price.find_by_id(params[:price_id])
        price_avg.update(:avg_rating => avg_rating.to_h[1])

        format.js 
      else 
        format.js 
      end 
    end
  end




#POST api/v1/rate.json
  def apicreate
       @rate = params[:rate]
       @price_id = params[:price_id]
       @user_id = params[:user_id]

       rate =Rate.new

       rate.rate= @rate.to_i
       rate.price_id= @price_id
       rate.user_id= @user_id



      respond_to do |format|
        if rate.save
          format.json {render :json => {:status=> "1"} }
        else
          format.json { render :json => {:status=> "2"} }
        end
      end

    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:rate)
    end
end
