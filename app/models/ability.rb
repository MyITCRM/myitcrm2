class Ability
	include CanCan::Ability
	def initialize(user)
    ## Here you can define custom aliases
    #alias_action(:clients, :to => :access_clients)
    alias_action(:index, :show, :to => :read)
    #alias_action(:employees, :to => :access_employees)
    #alias_action(:new, :register, :to => :create)
    alias_action(:edit_profile, :update_profile, :to => :manage_profile)
    alias_action(:update, :read, :create, :destroy, :sort_column, :sort_direction, :assign, :close, :clients, :employees,  :to => :manage )


    # If the user is idle for the set amount of time, we need to assign a default user role
    # so that we redirect back to the root URL and display the correct notification message.
    # If the user is still active, then this function continues to lookup the users role and permissions
    @user = user || User.new
    if @user.role_id.blank?
	   @user.role_id = 985695958446
	   guest = 985695958446
	   def guest
	      can [:register, :create, :new], User
	      #can [:read, :home], Page, :private => false
      end
    else
    user.role.permissions.each do |permission|
          can permission.action.to_sym, permission.subject_class.constantize
      end
			#can do |action, subject_class, subject|
			#	user.role.permissions.find_all_by_action(aliases_for_action(action)).any? do |permission|
			#		permission.subject_class == subject_class.to_s &&
			#				(subject.nil? || permission.subject_id.nil? || permission.subject_id == subject.id)
			#	end
			#end
    end
    end
end

#    @user = user || User.new
##    Feature #68 - This fixes this feature no with CanCan and Authlogic time_out
#    if @user.role.nil?
#      @user.role = "guest"
#    else
#      @user.role.each_line do |role|
#        send(role)
#      end
#    end
#    can [:register, :create], User
#    can [:read, :home], Page, :private => false
#  end
#
##
#  def client
#    can [:read, :update, :edit_profile, :update_profile], User, :id => user.id
#    can :read, Page, :private => false
#    can :create, WorkOrder
#    can [:update, :read], WorkOrder, :user_id => @user.id
#    can :read, Invoice, :user_id => @user.id
#
#  end
##
#  def assistant
#    client
#  end
##
#  def accountant
#    assistant
#  end
##
#  def technician
#    can :manage, WorkOrder
#    can :manage, Product
#    can :manage, ProductCategory
#    can :manage, Page
#    can :manage, Invoice
#    can :manage, ServiceInvoiceLine
#    can :manage, ProductInvoiceLine
#    can :manage, ServiceRate
#    can [:read, :clients, :employees], User
#    can :update, User, :id => @user.id
##    can :update, User,["client = ?", true] do |user|
##      user.client = true
##    end
#  end
##
##
#  def manager
#    technician
#    can :manage, User
#    can :manage, PriorityList
#  end
##
#  def administrator
#    can :manage, :all
#  end
#
#end
