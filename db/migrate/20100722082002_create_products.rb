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
      t.decimal :tax_rate
      t.decimal :cost_price
      t.decimal :sell_price
      t.decimal :mark_up
      t.boolean :active
      t.decimal :weight
      t.boolean :discountable
      t.decimal :disc_percent
      t.decimal :disc_amount
      t.string :created_by
      t.string :edited_by
      t.datetime :edited_at
      t.integer :qty_on_hand
      t.integer :qty_allocated
      t.integer :qty_available
      t.integer :qty_ordered
      t.integer :stocking_qty
      t.boolean :stocked_product
       
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
