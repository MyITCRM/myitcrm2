class User < ActiveRecord::Base
  acts_as_authentic
  # Used to set New Users to default to active
  def before_create
    self.active ||= "1"
    end
  
  has_many :suppliers
  has_many :assignments
  has_many :roles, :through => :assignments


  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
