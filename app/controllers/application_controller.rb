class ApplicationController < ActionController::Base
  #include DeviseTokenAuth::Concerns::SetUserByToken

  include CanCan::ControllerAdditions
  #before_filter :authenticate_user!, :except=>:index
  #skip_before_filter :login_required, only: [:new, :create]

  # acts_as_token_authentication_handler_for User
  #acts_as_token_authentication_handler_for User

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :getCategories
  before_action :categoriesCount
  before_action :newProduct
  
  def newProduct
    @product = Product.new
  end

  def getCategories
    @categories = Category.all
    @parent_categories = Category.where('category_id is NULL')
  end

  def categoriesCount
    #@categoriesSize = Category.find_by_category_id(nil).size
    @categoriesSize = Category.where('category_id is NULL').size
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :dob
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:sign_up) << :avatar
  end

  #  def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to(:controller => 'categories', :action => 'index')
  #     ## if you want render 404 page
  #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  #   end
  # end

end
