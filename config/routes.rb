Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  get 'welcome/index'

  resources :prices
  resources :products
  resources :comments
  resources :rates
  resources :categories
  devise_for :users 
  resources :searches
 

namespace :api do
  namespace :v1 do
    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end
end


  post 'api/v1/product' => 'products#apicreate'
  post 'api/v1/price' => 'prices#apicreate'
  post 'api/v1/comment' => 'comments#apicreate'
  post 'api/v1/rate' => 'rates#apicreate'
  


  get 'fetch_products' => 'products#from_category', as: 'fetch_products' 
  get 'api/v1/listCategories' => 'categories#apiListCategories'
  get 'api/v1/ListSubCategories' => 'categories#apiListSubCategoriesByCatID'
  get 'api/v1/ListProducts' => 'products#apiListProductByCatID'
  get 'api/v1/ListPrices' => 'prices#apiListPricesByProductID'
  get 'api/v1/ListPrice' => 'prices#apiListPriceById'



  
  root 'welcome#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
