class CreateSuppliers < ActiveRecord::Migration
  def self.up
      create_table :suppliers do |t|
        t.string :company_name
        t.text :address
        t.string :city
        t.string :state
        t.string :zip
        t.string :phone
        t.string :fax
        t.string :email
        t.string :credit_terms
        t.integer :credit_amount
        t.string :contact_name
        t.string :contact_phone
        t.text :notes
        t.boolean :active
        t.datetime :date_created
        t.datetime :date_updated
        t.integer :parts_leadtime_days

        t.timestamps
      end
    end

    def self.down
      drop_table :suppliers
    end
  
end
