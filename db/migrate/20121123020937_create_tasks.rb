class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :work_order_id
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :calendar_id
      t.boolean :completed

      t.timestamps
    end
  end
end
