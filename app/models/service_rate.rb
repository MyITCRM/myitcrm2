class ServiceRate < ActiveRecord::Base
  has_many :service_invoice_lines

  def rate_lookup
     # mytodo - Add currency symbol if possible.....
     "[#{sku}]-#{description} - #{I18n.t 'number.currency.format.unit'}#{rate}"
  end

end
