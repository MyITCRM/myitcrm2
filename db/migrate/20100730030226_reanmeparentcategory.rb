class Reanmeparentcategory < ActiveRecord::Migration
  def self.up
    rename_column :products, :parent_category_id, :product_category_id
  end

  def self.down
    rename_column :products, :product_category_id, :parent_category_id
  end
end
