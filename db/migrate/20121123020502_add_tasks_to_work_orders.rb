class AddTasksToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :task_id, :integer

  end
end
