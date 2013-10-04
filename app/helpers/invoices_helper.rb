# MyITCRM - Repairs Business CRM Software
# Copyright (C) 2009-2013 Glen Vanderhel
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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
    if paid
      text = t "invoice.paid"
      "<a class='paid'>#{text}</a>".html_safe
    else
        # If we have a due_date, lets use that to see if the invoice is OVERDUE, if not stamp it with UNPAID
        if due_date.present?
          if due_date + 86399 < Time.now
          text = t "invoice.overdue"
          "<a class='overdue'>#{text}</a>".html_safe
          else
           text = t "invoice.unpaid"
          "<a class='unpaid'>#{text}</a>".html_safe
        end
        end
    end
  end

   def wo_details
    @wo_details = WorkOrder.where("id = ?", @invoice.work_order_id).first
   end

  def active_service_rates
    ServiceRate.where('active = ?', true).order('description')
  end

  def active_parts_rates
    Product.where('active = ?', true).order('description')
  end
end
