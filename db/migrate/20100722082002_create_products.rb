class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :supplier_id
      t.string :supplier_sku
      t.string :our_sku
      t.string :manufacturer
      t.string :description
      t.string :model
      t.integer :parent_category_id
      t.integer :child_category_id
      t.string :warranty_info
      t.string :warranty_length
      t.string :warranty_unit
      t.boolean :taxable
      t.decimal :tax_rate, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :cost_price, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :sell_price, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :mark_up, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.boolean :active
      t.decimal :weight, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 3
      t.boolean :discountable
      t.decimal :disc_percent, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :disc_amount, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.string :created_by
      t.string :edited_by
      t.datetime :edited_at
      t.decimal :qty_on_hand, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :qty_allocated, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :qty_available, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :qty_ordered, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :stocking_qty, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.boolean :stocked_product
       
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
