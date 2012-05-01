class ServiceInvoiceLine < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :service_rate

  attr_accessible :qty, :service_id, :line_comment
  validates_presence_of :service_id

  accepts_nested_attributes_for  :service_rate

  before_create :calculate
  before_update :calculate

  def calculate
    srv = ServiceRate.find(service_id)
    if srv.taxable?
      self.tax_rate = 1 / srv.tax_rate  #  Tax Rate as a decimal = 1 / 10 = 0.1
      self.sku = srv.sku   # Now the Item(s)) Price from the Rate column
      self.description = srv.description   # Now the Item(s)) Price from the Rate column
      self.price = srv.rate   # Now the Item(s)) Price from the Rate column
      self.sub_total = srv.rate * self.qty    #Now calculate the Rate * Line Qty
      self.tax = self.sub_total * self.tax_rate   # Now Calculate the Tax Rate
      self.total_price = self.sub_total + self.tax  # Now Calculate the Subtotal + Tax Rate
    end
  end



end
