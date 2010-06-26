class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    # create default roles
     @roles = Role.create :name => "Administrator"
     Role.create :name => "Administrator"
     Role.create :name => "Manager"
     Role.create :name => "Technician"
     Role.create :name => "Accounts"
     Role.create :name => "Clerk"
     Role.create :name => "Client"
     Role.create :name => "Guest"
  end

  def self.down
    drop_table :roles
  end
end
