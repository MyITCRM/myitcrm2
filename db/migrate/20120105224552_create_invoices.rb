class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :work_order_id
      t.decimal :sub_total, :default => 0.0, :precision => 12, :scale => 2
      t.decimal :tax_total, :default => 0.0, :precision => 12, :scale => 2
      t.decimal :total, :default => 0.0, :precision => 12, :scale => 2
      t.decimal :tax_rate, :default => 0.0, :precision => 12, :scale => 2
      t.decimal :shipping, :default => 0.0, :precision => 12, :scale => 2
      t.decimal :discount, :default => 0.0, :precision => 12, :scale => 2
      t.text :invoice_note
      t.boolean :paid
      t.boolean :paid_partially
      t.string :created_by
      t.string :updated_by
      t.datetime :due_date
      t.datetime :paid_date
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
