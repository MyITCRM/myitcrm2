class ProductInvoiceLine < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :product

  accepts_nested_attributes_for  :product


  before_create :product_calculations
  before_update :product_calculations



  def product_calculations
    prod = Product.find(product_id)
      self.tax_rate = 1 / prod.tax_rate if prod.taxable?  #  Tax Rate as a decimal = 1 / 10 = 0.1
      self.sku = prod.our_sku   # Now the Item(s)) SKU
      self.description = prod.description   # Items Description
      self.price = prod.sell_price   # Now the Item(s)) Price from the Rate column
      self.sub_total = prod.sell_price * self.qty    #Now calculate the Rate * Line Qty
      self.tax = self.sub_total * self.tax_rate if prod.taxable?   # Now Calculate the Tax Rate
      self.total_price = self.sub_total + self.tax  # Now Calculate the Subtotal + Tax Rate
  end

end
