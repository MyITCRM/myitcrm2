class CreateSuppliers < ActiveRecord::Migration
  class Supplier < ActiveRecord::Base; end
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
      # create default Supplier account
     @supplier = Supplier.create :company_name => "Example",
                         :address => "Unit 4/49 Fake Road",
                        :city => "Sydney",
                        :state => "NSW",
                        :zip => "2001",
                        :email => "purchasing@example.com",
                        :phone => "02 9998 9996",
                        :contact_phone => "02 9998 9996",
                        :contact_name => "Fred Smith",
                        :fax => "02 9998 9998",
                        :date_created => Time.now,
                        :active => true
  end


    def self.down
      drop_table :suppliers
    end
  
end
