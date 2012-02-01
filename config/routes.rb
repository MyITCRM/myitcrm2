MyITCRM2::Application.routes.draw do

  #resources :page_categories do
  #  get :page_category_name, :on => :collection
  #end
  #
  #resources :pages
  resources :statuses
  resources :priority_lists
  #resources :replies


  resources :work_orders do
    collection do
      put :close
      put :assign
    end
    resources :replies, :invoices
  end
  resources :invoices do
     resources :product_invoice_lines, :service_invoice_lines
    end

  resources :settings do
    collection do
      get :index
      put :edit
    end
  end

  resources :product_categories do
    get :product_category_name, :on => :collection
  end

  resources :user_sessions
  resources :users do
    collection do
      put :edit_profile
      put :update_profile
      put :register
    end
    end
  resources :suppliers
  resources :products
  resources :service_rates
  resources :replies, :only => [:show, :edit, :update]




  match '/login' => 'user_sessions#new', :as => :login
  match '/logout' => 'user_sessions#destroy', :as => :logout
  match '/register' =>'users#register', :as => :register
  match '/clients' =>'users#clients', :as => :clients
  match '/employees' =>'users#employees', :as => :employees
  match 'profile/:id' => 'users#edit_profile', :as => :my_account
  match 'work_orders/:id/close' => 'work_orders#close', :as => :close
  match 'work_order/:id/assign' => 'work_orders#assign', :as => :assign
  match 'settings/edit' => 'settings#edit', :as => :edit

#  Ensure these are last in this list and before the root route
#  match '/article/:permalink' => 'pages#show'
#  match '/article/:category/:permalink' => 'pages#show'
#  match '/:category/:permalink' => 'pages#show'
#  match '/home' => 'pages#home'
#  match '/faq/:permalink' => 'pages#show'
#  match '/faq/:category/:permalink' => 'pages#show'

#  map.root :register
#  root :to => 'pages#home'
  root :to => 'user_sessions#new'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
