class AddWebsiteToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers, :website, :string
  end

  def self.down
    remove_column :suppliers, :website
  end
end
