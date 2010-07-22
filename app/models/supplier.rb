class Supplier < ActiveRecord::Base
# Validations for Suppliers
  validates_presence_of :company_name, :address, :city, :contact_name, :contact_phone, :email, :fax, :phone, :parts_leadtime_days, :state, :zip
  validates_uniqueness_of :company_name
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :parts

# Create New Suppliers as Active = true
def before_create
  self.active ||= "1"
end

end
