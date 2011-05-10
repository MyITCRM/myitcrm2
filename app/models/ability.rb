class Ability
  include CanCan::Ability
  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role) }
    can :register, User

  end
#
  def client
    can :read, User, :id => @user.id
    can [:update, :edit_profile, :update_profile], User, :id => @user.id
    can :create, WorkOrder
    can [:update, :read, :close], WorkOrder, :user_id => @user.id

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
    can :read, User, :client => TRUE
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
