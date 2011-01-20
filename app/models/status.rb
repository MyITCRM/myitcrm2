class Status < ActiveRecord::Base
  has_many :work_orders
end
