authorization do
# myTODO - check to ensure all modules and controllers have filter_accessible on
  role :Administrator do
    has_permission_on [:suppliers, :users, :products, :product_categories, :settings, :work_orders], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :edit_profile, :update_profile, :close, :print, :assign]
  end

  role :Manager do
    includes :Technician
    has_permission_on [:suppliers, :users, :products, :product_categories], :to => [:destroy]
  end

  role :Technician do
    includes :Client
    has_permission_on :users, :to => [:index, :show, :edit, :update]
    has_permission_on :workorders, :to => [:close, :print, :assign]
    has_permission_on [:suppliers, :products, :product_categories], :to => [:index, :show, :new, :create, :edit, :update]
  end

  role :Client do
    includes :guest
    has_permission_on :workorders, :to => :create
    has_permission_on :workorders, :to => [:edit, :index, :update, :show] do
     if_attribute  :user_id => is { user }
    end
    has_permission_on :users, :to => [:edit_profile, :update_profile, :show]  do
      if_attribute  :user => is { user }
    end
  end

  role :guest do
    has_permission_on :users, :to => [:new, :create, :update]
  end

end