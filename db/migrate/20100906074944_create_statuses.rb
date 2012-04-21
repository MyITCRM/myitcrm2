class CreateStatuses < ActiveRecord::Migration
  class Status < ActiveRecord::Base; end
  def self.up
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end

  end

  def self.down
    drop_table :statuses
  end
end
