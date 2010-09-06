class CreateWorkOrders < ActiveRecord::Migration
  def self.up
    create_table :work_orders do |t|
      t.integer :workorder_id
      t.string :subject
      t.text :description
      t.integer :note_id
      t.integer :comment_id
      t.integer :attachment_id
      t.integer :schedule_id
      t.boolean :closed
      t.integer :closed_by
      t.datetime :closed_date
      t.text :resolution
      t.integer :user_id
      t.integer :assigned_to
      t.integer :priority_list_id
      t.integer :status_id
      t.integer :created_by
      t.integer :edited_by

      t.timestamps
    end
  end

  def self.down
    drop_table :work_orders
  end
end
