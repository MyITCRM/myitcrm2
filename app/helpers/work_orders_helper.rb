module WorkOrdersHelper
  def invoicing_required(work_order_id = nil)
    Invoice.where("work_order_id = ?", "#{work_order_id}").limit(1)
  end
end
