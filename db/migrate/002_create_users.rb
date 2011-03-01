class CreateUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base; end

  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :role_id
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
      t.boolean :active, :default => 1
      t.datetime :edited_at
      t.string :edited_by

      t.timestamps
    end

  # create default administrator account
     @user = User.create :username => "admin",
                         :name => "Company Admin",
                        :crypted_password => "1b9b040d838f59c16a843e9b49a8cd23a02c3945d27af80dfa68d208712d696a1cf22858cd91b76865869299aa3b4e2bd495cf97532168fddfdb20e59519aa35",
                        :password_salt => "3t3Xc_YhQ6AeTlUde-Om",
                        :email => "admin@example.net",
                        :role_id => "1"
  end


  def self.down
    drop_table :users
  end
end
