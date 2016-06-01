class Api::V1::RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :verify_authenticity_token  
  respond_to :json

  def create
    user = User.new(params[:user])

    if user.save
      render :json =>{:auth_token => user.authentication_token ,:email =>user.email },:status =>201
      return 
    else
      render :json =>user.errors,:status=>422
      return
    end

    # respond_to do |format|
    #   format.json {render :json => 'welcome'}
    # end
  end
end