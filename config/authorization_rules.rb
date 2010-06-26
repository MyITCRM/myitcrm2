authorization do
  role :administrator do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:roles], :to => [:index, :show, :edit, :update]
    end
  role :manager do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update]
    has_permission_on [:roles], :to => [:index, :show]
  end
  role :technician do
    has_permission_on :suppliers, :to => [:index, :show]
    has_permission_on :users, :to => [:index, :show]
    has_permission_on :users, :to => [:edit, :update] do
    if_attribute :user => is { user }
       end
    
  end
  role :accounts do
    has_permission_on [:suppliers], :to => [:index, :show, :new, :create, :edit, :update]
    has_permission_on [:users], :to => [:index, :show]
  end
  role :client do
    has_permission_on  :users, :to => [:index, :show, :edit, :update] do
      if_attribute :user => is { user }
    end
  end
  role :guest do
    has_permission_on [:login], :to => [:index, :show]
  end


end