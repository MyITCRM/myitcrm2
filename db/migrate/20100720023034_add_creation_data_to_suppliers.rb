class AddCreationDataToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :created_by, :string
    add_column :suppliers, :edited_by, :string
    add_column :suppliers, :edited_at, :datetime
  end

  def self.down
    remove_column :suppliers, :created_by
    remove_column :suppliers, :edited_by
    remove_column :suppliers, :edited_at
  end
end
