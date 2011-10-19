module UsersHelper

  def active_work_order_count(id = nil)
    WorkOrder.where('user_id = ?', id).where('status_id IS NOT 6')
  end


end
