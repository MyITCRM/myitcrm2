class AddCreatedByToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :created_by, :string
  end

  def self.down
    remove_column :suppliers, :user_id
  end
end
