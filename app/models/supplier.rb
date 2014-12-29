class Supplier < ActiveRecord::Base
  has_many :products
# Validations for Suppliers

  validates_presence_of :company_name, :address, :city, :contact_name, :email, :phone, :state, :zip
  validates_uniqueness_of :company_name
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  before_create :set_active

# Create New Suppliers as Active = true
def set_active
  self.active ||= "1"  
end

end
