class Invoice < ActiveRecord::Base
  has_many :invoice_lines, :dependent => :destroy
  accepts_nested_attributes_for :invoice_lines, :reject_if => lambda { |a| a[:qty].blank? }, :allow_destroy => true

end
