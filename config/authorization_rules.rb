authorization do
  role :administrator do
    has_permission_on [:suppliers, :users, :products, :product_categories, :settings], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :edit_profile, :update_profile,]
  
  end
  role :manager do
    includes :technician
    has_permission_on [:suppliers, :users, :products, :product_categories], :to => [:destroy]
    
  end
  role :technician do
    includes :client
    has_permission_on :users, :to => [:index, :show, :edit, :update]
    has_permission_on [:suppliers, :products, :product_categories], :to => [:index, :show, :new, :create, :edit, :update]
  end
  role :client do
    includes :guest
    has_permission_on :users, :to => [:edit_profile, :update_profile, :show]
    has_permission_on :users, :to => [:edit_profile, :update_profile]  do
      if_attribute  :user => is { user }
    end
  end
  role :guest do
    has_permission_on :users, :to => [:new, :create, :update]
  end
 
end