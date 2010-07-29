class Product < ActiveRecord::Base
  belongs_to :supplier
  
# Validations on inputs
  validates_presence_of :supplier, :active, :description, :cost_price, :manufacturer, :model, :sell_price
  validates_uniqueness_of :our_sku
  

end
