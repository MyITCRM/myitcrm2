class ServiceRate < ActiveRecord::Base
  has_many :service_invoice_lines
end
