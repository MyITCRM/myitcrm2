class Invoice < ActiveRecord::Base
  has_many :service_invoice_lines, :dependent => :destroy

  attr_accessible :service_id, :product_id

  validates_uniqueness_of :work_order_id

  accepts_nested_attributes_for :service_invoice_lines, :reject_if => lambda { |a| a[:qty].blank? }, :allow_destroy => true

end
