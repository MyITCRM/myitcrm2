class AddUserIdToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :user_id, :string
 end
 
  def self.down
    remove_column :suppliers, :user_id
  end
end