module UsersHelper

  def active_work_order_count(id = nil)
    WorkOrder.where('user_id = ?', id).where('status_id IS NOT 6')

  end

  def clients_workorders(id = nil, status_id = nil)
    @clients_workorders = WorkOrder.where('user_id = ?', id).where('status_id = 1',status_id)
  end


end
