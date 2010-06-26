class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id

       t.timestamps
    end
    # create default assignments
     @assignments = Assignment.create :user_id => "1", :role_id => "1"
  end

  def self.down
    drop_table :assignments
  end
end
