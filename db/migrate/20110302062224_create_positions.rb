class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end

  def self.down
    drop_table :positions
  end
end
