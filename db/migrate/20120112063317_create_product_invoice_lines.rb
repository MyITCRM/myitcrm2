class CreateProductInvoiceLines < ActiveRecord::Migration
  def self.up
    create_table :product_invoice_lines do |t|
      t.integer :invoice_id,:null => false, :default => 0
      t.integer :product_id, :null => false, :default => 0
      t.string :sku, :null => false, :limit => 255
      t.string :description, :null => false, :limit => 255
      t.decimal :qty, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :tax_rate, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :tax, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :price, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :sub_total, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.decimal :total_price, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.string :line_comment, :limit => 255

      t.timestamps
    end
  end

  def self.down
    drop_table :product_invoice_lines
  end
end
