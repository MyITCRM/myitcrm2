class Setting < ActiveRecord::Base
  validates_presence_of :address,:business_name,:city,:state,:zip,:phone,:email
  validates_format_of  :email,:billing_email,:business_contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
end
