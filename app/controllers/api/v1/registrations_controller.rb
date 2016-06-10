class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token  
  respond_to :json

  def create
# puts "fsdfdsfdsfs"
# puts params.inspect 
# puts params[:name]
   user = User.new(params)
#prd = Product.new
#prd.email = "jjj"
#prd.encrypted_password = 1
# user = User.new(user_params)

    if user.save
render :json =>{:auth_token => user.authentication_token, :id =>user.id ,:name=>user.name,:logged =>true ,:email =>user.email },:status =>201
     # render :json =>{:auth_token => user.authentication_token ,:email =>user.email },:status =>201
      return 
    else
      render :json =>user.errors,:status=>420
      return
    end

    # respond_to do |format|
    #   format.json {render :json => 'welcome'}
    # end
  end
end
