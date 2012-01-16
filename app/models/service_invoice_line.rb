class ServiceInvoiceLine < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :service_rate

  accepts_nested_attributes_for  :service_rate

  before_update :calculate
  before_save :calculate


  def calculate
    srv = ServiceRate.find(service_rate_id)
    if srv.taxable?
      self.tax_rate = 1 / srv.tax_rate
      self.tax = self.qty * srv.rate * self.tax_rate
      self.price = srv.rate
      self.sub_total = srv.rate * self.qty
      self.total_price = self.sub_total + self.tax

    end
  end

end
