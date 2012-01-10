class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :client_id
      t.datetime :due_date
      t.integer :work_order_id
      t.text :invoice_note
      t.integer :payment_id
      t.boolean :paid

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
