MyITCRM2::Application.routes.draw do

  resources :statuses
  resources :priority_lists
  resources :work_orders
  resources :work_orders do
    collection do
      put :close
      put :assign
    end
  end
  resources :settings do
    collection do
      get :index
      put :edit
    end
  end
  resources :product_categories
   resources :product_categories do
      get :product_category_name, :on => :collection
   end
  resources :user_sessions
  resources :users
  resources :users do
    collection do
      put :edit_profile
      put :update_profile
      put :register
    end
  end
  resources :suppliers
  resources :products


#  map.login "login", :controller => "user_sessions", :action => "new"
  match '/login' => 'user_sessions#new', :as => :login
#  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  match '/logout' => 'user_sessions#destroy', :as => :logout
#  map.register "register", :controller => "users", :action => "new"
  match '/register' =>'users#register', :as => :register
  match '/clients' =>'users#clients', :as => :clients
#  map.profile "profile/:id", :controller => "users", :action => "edit_profile"
  match 'profile/:id' => 'users#edit_profile', :as => :my_account
#  map.close_workorder "work_order/:id/close", :controller => "work_orders", :action => "close"
  match 'work_order/:id/close' => 'work_orders#close', :as => :close
#  map.assign_workorder "work_order/:id/assign", :controller => "work_orders", :action => "assign"
  match 'work_order/:id/assign' => 'work_orders#assign', :as => :assign
  match 'settings/edit' => 'settings#edit', :as => :edit


#  map.root :register
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
