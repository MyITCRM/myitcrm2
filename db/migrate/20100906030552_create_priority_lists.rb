class CreatePriorityLists < ActiveRecord::Migration
  def self.up
    create_table :priority_lists do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :priority_lists
  end
end
