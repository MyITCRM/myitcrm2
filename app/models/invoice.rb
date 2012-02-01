class Invoice < ActiveRecord::Base
  has_many :service_invoice_lines, :dependent => :destroy
  has_many :product_invoice_lines, :dependent => :destroy

  attr_accessible :service_id, :product_id, :invoice_note, :user_id, :work_order_id, :paid, :service_invoice_lines_attributes, :product_invoice_lines_attributes

  validates_uniqueness_of :work_order_id, :allow_blank => true

  accepts_nested_attributes_for :service_invoice_lines, :reject_if => lambda { |a| a[:qty].blank? || a[:service_id].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :product_invoice_lines, :reject_if => lambda { |a| a[:qty].blank? || a[:product_id].blank? }, :allow_destroy => true

   before_create :update_invoice_numbering

  #def update_totals
  #  self.total=service_invoice_lines.to_a.sum(&:total_price)
  #  self.tax_total=service_invoice_lines.to_a.sum(&:tax)
  #  self.sub_total=service_invoice_lines.to_a.sum(&:sub_total)
  #end

  # Service lines SUMs
  def srv_price_totals
    service_invoice_lines.to_a.sum(&:total_price)
  end
  def srv_tax_totals
    service_invoice_lines.to_a.sum(&:tax)
  end
def srv_sub_totals
    service_invoice_lines.to_a.sum(&:sub_total)
end

# Product lines SUMs
def prod_price_totals
    product_invoice_lines.to_a.sum(&:total_price)
  end
  def prod_tax_totals
    product_invoice_lines.to_a.sum(&:tax)
  end
def prod_sub_totals
    product_invoice_lines.to_a.sum(&:sub_total)
end

  # Are these required?
def inv_price_totals
    service_invoice_lines.to_a.sum(&:total_price) + product_invoice_lines.to_a.sum(&:total_price)
  end
  def inv_tax_totals
    service_invoice_lines.to_a.sum(&:tax) + product_invoice_lines.to_a.sum(&:tax)
  end
def inv_sub_totals
    service_invoice_lines.to_a.sum(&:sub_total) + product_invoice_lines.to_a.sum(&:sub_total)
end


end
