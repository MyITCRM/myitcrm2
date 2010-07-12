authorization do
  role :administrator do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :edit_profile]
    has_permission_on [:roles], :to => [:index, :show, :edit, :update]
  end
  role :manager do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  role :technician do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update]
  end
  role :client do
    has_permission_on :users, :to => [:new, :create, :update, :edit_profile, :update_profile, :show]
    has_permission_on :users, :to => [:edit_profile, :update_profile]  do
      if_attribute  :user => is { user }
    end
  end
  role :guest do
    has_permission_on :users, :to => [:new, :create, :update]
  end
 
end