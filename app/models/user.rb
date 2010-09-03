class User < ActiveRecord::Base
  #acts_as_authentic
  acts_as_authentic do |c|
      c.logged_in_timeout = 10.minutes # default is 10.minutes

  end
# Validations for Users
validates_presence_of :name, :address, :city, :username, :email, :phone, :state, :zip

validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  

named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

# Roles_Mask values
  # Admin = 1
  # Manager = 2
  # Tech = 4
  # Accounts = 8
  # Clerk = 16
  # Client = 32
  # Guest = 64

  ROLES = %w[administrator manager technician accounts clerk client guest]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end
# Used to set New Users to default to active
  def before_create
    self.active ||= "1"
    self.roles_mask ||= "32"
  end
 
  def self.search(search, page)
      paginate :per_page => 5, :page => page,
                          :conditions => ['name LIKE  ?', "%#{search}%"],
                          :order => 'id'
   end
end
