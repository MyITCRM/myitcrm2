module InvoicesHelper
  def open_invoices
    @open_invoices = Invoice.where("paid = ?",false)
  end

  def paid_invoices
    @paid_invoices = Invoice.where("paid = ?",true)
  end

  def client_info
     @client_info = User.find(@invoice.user_id)
  end

  def service_invoice_lines
     @service_invoice_lines = ServiceInvoiceLine.where("invoice_id = ? ","#{params[:id]}")
  end

  def product_invoice_lines
    @product_invoice_lines = ProductInvoiceLine.where("invoice_id = ? ","#{params[:id]}")
  end
end
