class Supplier < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :contact_name, :contact_phone, :email, :fax, :phone, :parts_leadtime_days, :state, :zip

def before_create
  self.active ||= "1"
end

end
