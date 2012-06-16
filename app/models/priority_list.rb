class PriorityList < ActiveRecord::Base
  has_many :work_orders

  attr_accessible :name


end
