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
    has_permission_on :work_orders, :to => [:close, :print, :assign]
    has_permission_on [:suppliers, :products, :product_categories], :to => [:index, :show, :new, :create, :edit, :update]
  end

  role :Client do
    includes :guest
    has_permission_on :work_orders, :to => [:create, :edit, :index, :update, :show] do
     if_attribute :user_id => is { user.id }
    end
    has_permission_on :users, :to => [:edit, :index, :update, :show, :edit_profile, :update_profile]  do
      if_attribute :id => is { user.id }
    end
  end

  role :guest do
    has_permission_on :users, :to => [:new, :create, :update]
  end

end