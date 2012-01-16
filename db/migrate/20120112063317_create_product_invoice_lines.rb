class CreateProductInvoiceLines < ActiveRecord::Migration
  def self.up
    create_table :product_invoice_lines do |t|
      t.integer :invoice_id
      t.integer :product_id
      t.decimal :qty, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :tax_rate, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 3
      t.decimal :tax, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :price, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :sub_total, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.decimal :total_price, :null => false, :default => 0, :limit => 10, :precision => 10, :scale => 2
      t.string :line_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :product_invoice_lines
  end
end
