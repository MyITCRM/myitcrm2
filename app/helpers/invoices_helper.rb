module InvoicesHelper

  def open_invoices
    @open_invoices = Invoice.where("paid = ?",false)
  end

  def paid_invoices
    @paid_invoices = Invoice.where("paid = ?",true)
  end

  def client_info
    if @invoice.work_order_id.present?
     user = WorkOrder.find(@invoice.work_order_id)
     user_id = user.user_id
    else
     user = User.find(@invoice.user_id)
      user_id = user.id
    end
     @client_info = User.find(user_id)
  end

  def service_invoice_lines
     @service_invoice_lines = ServiceInvoiceLine.where("invoice_id = ? ","#{params[:id]}")
  end

  def product_invoice_lines
    @product_invoice_lines = ProductInvoiceLine.where("invoice_id = ? ","#{params[:id]}")
  end

  def payment_status(paid)
    if paid.present?
      "<p>Payment Status = <a class='paid'>PAID</a></p>".html_safe
    end
    if paid.blank?
      "<p>Payment Status = <a class='unpaid'>UNPAID</a></p>".html_safe
    end
  end
  def invoice_stamp(paid)
    if paid.present?
      text = [t "invoice_paid"]
      "<a class='paid'>#{text}</a>".html_safe
    else
       text = [t "invoice_overdue"]
      "<a class='overdue'>#{text}</a>".html_safe
    end
  end

   def wo_details
    @wo_details = WorkOrder.where("id = ?", @invoice.work_order_id).first
  end
end
