class ServiceInvoiceLine < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :service_rate

  validates_presence_of :service_id

  accepts_nested_attributes_for :service_rate

  before_create :calculate
  before_update :calculate

  def calculate
    srv = ServiceRate.find(service_id)
    if srv.taxable.present?
      before_tax = srv.rate / ((100 + srv.tax_rate)/100)
      #self.tax_rate = 1 + srv.tax_rate #  Tax Rate as a decimal = 1 / 10 = 0.1
      self.sku = srv.sku                            # Now the Item(s)) Price from the Rate column
      self.description = srv.description            # Now the Item(s)) Price from the Rate column
      self.price = before_tax                       # Now the Item(s) Price from the Rate column
      self.sub_total = self.price * self.qty        #Now calculate the Rate * Line Qty
      self.total_price = srv.rate * self.qty        # Now Calculate the Subtotal + Tax Rate
      self.tax = self.total_price - self.sub_total  # Now Calculate the Tax Rate

      #self.tax_rate = 1 / srv.tax_rate #  Tax Rate as a decimal = 1 / 10 = 0.1
      #self.sku = srv.sku # Now the Item(s)) Price from the Rate column
      #self.description = srv.description # Now the Item(s)) Price from the Rate column
      #self.price = srv.rate # Now the Item(s) Price from the Rate column
      #self.sub_total = srv.rate * self.qty #Now calculate the Rate * Line Qty
      #self.tax = self.sub_total * self.tax_rate # Now Calculate the Tax Rate
      #self.total_price = self.sub_total + self.tax # Now Calculate the Subtotal + Tax Rate
    else
      self.tax_rate = 0 #  Tax Rate is zero
      self.sku = srv.sku # Now the Item(s)) Price from the Rate column
      self.description = srv.description # Now the Item(s)) Price from the Rate column
      self.price = srv.rate # Now the Item(s) Price from the Rate column
      self.sub_total = srv.rate * self.qty #Now calculate the Rate * Line Qty
      self.tax = 0 # Zero tax on none taxable item
      self.total_price = self.sub_total # Now Calculate the Subtotal
    end
  end
end
