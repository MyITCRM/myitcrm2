class CreateServiceRates < ActiveRecord::Migration
  def self.up
    create_table :service_rates do |t|
      t.string :sku
      t.string :description
      t.decimal :rate
      t.boolean :taxable
      t.decimal :tax_rate
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :service_rates
  end
end
