class CreatePageCategories < ActiveRecord::Migration
  def self.up
    create_table :page_categories do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :page_categories
  end
end
