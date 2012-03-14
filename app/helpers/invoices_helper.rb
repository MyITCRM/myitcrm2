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
  # This is used to display a invoice status stamp on the invoice
  def invoice_stamp(paid, due_date)
    # If this invoice is paid in full, then display the PAID stamp
    if paid == true
      text = [t "invoice.paid"]
      "<a class='paid'>#{text}</a>".html_safe
    else
        # If we have a due_date, lets use that to see if the invoice is OVERDUE, if not stamp it with UNPAID
        if due_date.present?
          if due_date + 86399 < Time.now
          text = [t "invoice.overdue"]
          "<a class='overdue'>#{text}</a>".html_safe
          else
           text = [t "invoice.unpaid"]
          "<a class='unpaid'>#{text}</a>".html_safe
        end
        end
    end
  end

   def wo_details
    @wo_details = WorkOrder.where("id = ?", @invoice.work_order_id).first
  end
end
