class RenameCategoryColumn < ActiveRecord::Migration
    def self.up
      change_column :products, :product_category_id, :string
    end

    def self.down
      change_column :products, :product_category_id, :integer
    end
  end

