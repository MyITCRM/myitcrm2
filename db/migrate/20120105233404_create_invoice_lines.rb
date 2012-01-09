class CreateInvoiceLines < ActiveRecord::Migration
  def self.up
    create_table :invoice_lines do |t|
      t.integer :invoice_id
      t.integer :service_rate_id
      t.integer :product_id
      t.decimal :qty
      t.decimal :tax_rate
      t.decimal :tax
      t.decimal :price
      t.decimal :sub_total
      t.decimal :total_price
      t.string :line_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_lines
  end
end
