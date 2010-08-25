class Product < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :product_category
  
# Validations on inputs
  validates_presence_of :supplier, :description, :cost_price, :manufacturer, :model, :sell_price, :our_sku, :supplier_sku
  validates_uniqueness_of :our_sku
  validates_numericality_of :qty_allocated, :cost_price, :disc_amount, :disc_percent, :qty_available, :qty_on_hand, :qty_ordered, :sell_price, :tax_rate
  validates_numericality_of :disc_percent, :tax_rate, :less_than_or_equal_to => 100
  
# Define Active value to 1 on creation of new product
  def before_create
    self.active ||= "1"
  end
# Attachments
#  has_attachment :storage => :file_system, :path_prefix => 'attachments/private'

# Search by 
  def self.search_products(search_products, page)
      paginate :per_page => 5, :page => page,
                          :conditions => ['description LIKE  ?', "%#{search_products}%"],
                          :order => 'id'
  end

  def category_name
    product_category.name if product_category
  end
  def category_name=(name)
    self.product_category_id = ProductCategory.find_or_create_by_name(name) unless name.blank?

  end
end
