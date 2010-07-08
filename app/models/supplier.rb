class Supplier < ActiveRecord::Base
  validates_presence_of :company_name, :address, :city, :contact_name, :contact_phone, :email, :fax, :phone, :parts_leadtime_days, :state, :zip

  has_many :users

   def before_create
self.date_created ||= Time.now
self.active ||= "1"
end
def before_update
self.date_updated = Time.now
end
  def before_edit
  self.date_updated = Time.now
  end
  
end
