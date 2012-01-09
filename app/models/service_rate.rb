class ServiceRate < ActiveRecord::Base
  has_many :invoice_lines
end
