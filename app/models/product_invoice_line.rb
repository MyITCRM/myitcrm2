class ProductInvoiceLine < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :product

  accepts_nested_attributes_for  :product


  before_create :product_calculations
  before_update :product_calculations



  def product_calculations
    prod = Product.find(product_id)
    if prod.taxable?
      before_tax = prod.sell_price / ((100 + prod.tax_rate)/100)
    else
      before_tax = prod.sell_price
    end
    self.sku = prod.our_sku                            # Now the Item(s)) Price from the Rate column
    self.description = prod.description            # Now the Item(s)) Price from the Rate column
    self.price = before_tax                       # Now the Item(s) Price from the Rate column
    self.sub_total = self.price * self.qty        #Now calculate the Rate * Line Qty
    self.total_price = prod.sell_price * self.qty        # Now Calculate the Subtotal + Tax Rate
    self.tax = self.total_price - self.sub_total  # Now Calculate the Tax Rate
  end

end
