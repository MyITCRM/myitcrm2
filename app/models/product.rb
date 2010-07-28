class Product < ActiveRecord::Base
  belongs_to :supplier
  

validates_presence_of :supplier, :description, :cost_price, :manufacturer, :model, :sell_price

end
