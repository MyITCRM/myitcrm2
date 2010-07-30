class Product < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :product_category
  
# Validations on inputs
  validates_presence_of :supplier, :description, :cost_price, :manufacturer, :model, :sell_price, :our_sku, :supplier_sku
  validates_uniqueness_of :our_sku

# Define Active value to 1 on creation of new product
  def before_create
    self.active ||= "1"
  end
# Attachments
#  has_attachment :storage => :file_system, :path_prefix => 'attachments/private'


end
