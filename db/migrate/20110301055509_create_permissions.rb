class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :role_id
      t.string :action
      t.string :subject_class
      t.integer :subject_id


      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
