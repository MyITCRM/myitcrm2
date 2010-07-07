authorization do
  role :administrator do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:roles], :to => [:index, :show, :edit, :update]
  end
  role :manager do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  role :technician do
    has_permission_on [:suppliers, :users], :to => [:index, :show, :new, :create, :edit, :update]
  end
  role :client do

    end
 
end