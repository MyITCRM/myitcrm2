class CreateServiceRates < ActiveRecord::Migration
  def self.up
    create_table :service_rates do |t|
      t.string :sku
      t.string :description
      t.decimal :rate, :null => false, :default => 0.00, :precision => 12, :scale => 2
      t.boolean :taxable
      t.decimal :tax_rate, :precision => 12, :scale => 3
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :service_rates
  end
end
