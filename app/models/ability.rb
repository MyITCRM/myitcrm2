class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.role.each { |role| send(role) }
  end


  def client
    can :read, User, :id => @user.id
    can [:update, :edit_profile, :update_profile], User, :id => @user.id
    can [:create], WorkOrder
    can [:update, :create], WorkOrder, :user_id => @user.id

  end

  def technician
    can :manage, WorkOrder
    can :manage, Product
    can :manage, ProductCategory
    can [:update, :read], User, :id => @user.id
#    can :update, User,["client = ?", true] do |user|
#      user.client = true
#    end
  end

  def manager
    technician
    can :manage, User
  end

def administrator
    can :manage, :all
  end

end
