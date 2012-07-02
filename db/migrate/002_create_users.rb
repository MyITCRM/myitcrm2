class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :role_id
      t.boolean :employee
      t.boolean :workorder_assignability
      t.boolean :client
      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :mobile
      t.string :fax
      t.text :notes
      t.boolean :active, :default => true
      t.datetime :edited_at
      t.string :edited_by

      t.timestamps
    end

  end


  def self.down
    drop_table :users
  end
end
