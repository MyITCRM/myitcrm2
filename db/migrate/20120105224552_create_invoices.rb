class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :work_order_id
      t.text :invoice_note
      t.boolean :paid
      t.string :created_by
      t.string :updated_by
      t.datetime :due_date
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
