class Ability
  include CanCan::Ability
  def initialize(user)

    @user = user || User.new
#    Feature #68 - This fixes this feature no with CanCan and Authlogic time_out
    if @user.role.nil?
      @user.role = "guest"
    else
      @user.role.each { |role| send(role) }
    end
    can [:register, :create], User
    can [:read, :home], Page, :private => false
  end

#
  def client
    can [:read, :update, :edit_profile, :update_profile], User, :id => @user.id
    can :read, Page, :private => false
    can :create, WorkOrder
    can [:update, :read], WorkOrder, :user_id => @user.id

  end
#
  def assistant
    client
  end
#
  def accountant
    assistant
  end
#
  def technician
    can :manage, WorkOrder
    can :manage, Product
    can :manage, ProductCategory
    can :manage, Page
    can [:read, :clients, :employees], User
    can :update, User, :id => @user.id
#    can :update, User,["client = ?", true] do |user|
#      user.client = true
#    end
  end
#
#
  def manager
    technician
    can :manage, User
  end
#
  def administrator
    can :manage, :all
  end

end
