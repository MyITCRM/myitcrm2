class CreateStatuses < ActiveRecord::Migration
  class Status < ActiveRecord::Base; end
  def self.up
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end
    # create default statuses (MyTODO :Translation required for values)
     @status = Status.create :name => "New"
     Status.create :name => "Assigned"
     Status.create :name => "On Hold"
     Status.create :name => "Pending"
     Status.create :name => "Re-opened"
     Status.create :name => "Closed"
  end

  def self.down
    drop_table :statuses
  end
end
