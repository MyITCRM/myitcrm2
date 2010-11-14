class CreatePriorityLists < ActiveRecord::Migration
  class PriorityList < ActiveRecord::Base; end
  def self.up
    create_table :priority_lists do |t|
      t.string :name

      t.timestamps
    end
    # create default list items
     @priority_list = PriorityList.create :name => "Low"
     PriorityList.create :name => "Normal"
     PriorityList.create :name => "High"
     PriorityList.create :name => "Urgent"
     PriorityList.create :name => "Critical"


  end

  def self.down
    drop_table :priority_lists
  end
end
