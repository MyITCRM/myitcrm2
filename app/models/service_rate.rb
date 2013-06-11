class ServiceRate < ActiveRecord::Base
  has_many :service_invoice_lines

  attr_accessible :sku, :description, :rate, :taxable, :tax_rate, :active
  validates_presence_of :sku, :description, :rate, :tax_rate, :active
  validates_uniqueness_of :sku

  def rate_lookup
     "[#{sku}]-#{description} - #{I18n.t 'number.currency.format.unit'}#{rate}"
  end

end
