# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# create default administrator account
User.create({
    :username => "admin",
    :name => "Company Admin",
    :crypted_password => "1b9b040d838f59c16a843e9b49a8cd23a02c3945d27af80dfa68d208712d696a1cf22858cd91b76865869299aa3b4e2bd495cf97532168fddfdb20e59519aa35",
    :password_salt => "3t3Xc_YhQ6AeTlUde-Om",
    :persistence_token => "",
    :employee => true,
    :workorder_assignability => true,
    :client => false,
    :login_count => "0",
    :failed_login_count => "0",
    :last_login_at => Time.now,
    :last_request_at => Time.now,
    :created_at => Time.now,
    :updated_at => Time.now,
    :edited_at => Time.now,
    :edited_by => "Initial Config",
    :current_login_ip => "127.0.0.1",
    :last_login_ip => "127.0.0.1",
    :address => "14 Corporate Avenue",
    :city => "Sydney",
    :state => "NSW",
    :zip => "2000",
    :phone => "02 9999 0001",
    :mobile => "0409 999 001",
    :fax => "02 9999 0002",
    :active => true,
    :notes => "None",
    :role_id => "1"},
    :without_protection => true )


Role.create({
		:name => "Super User",
		:enabled => true,
		:list_position => "1"},
    :without_protection => true )

Role.create({
		:name => "Technician",
		:enabled => true,
		:list_position => "2"},
    :without_protection => true )

Role.create({
		:name => "Client",
		:enabled => true,
		:list_position => "3"},
    :without_protection => true )

# create default Supplier account
Supplier.create({
    :company_name => "Example",
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
    :active => true},
    :without_protection => true )

# Adding Some default Permissions to get you started and assigning them to the default Admin account created above.
#
Permission.create({:name => "User - Manage", :action => "manage", :subject_class => "User"}, :without_protection => true)
Permission.create({:name => "Work Order - Manage", :action => "manage", :subject_class => "WorkOrder"}, :without_protection => true)
Permission.create({:name => "Setting - Manage", :action => "manage", :subject_class => "Setting"}, :without_protection => true)
Permission.create({:name => "Profile - Manage", :action => "update", :subject_class => "User"}, :without_protection => true)

Permittable.create({:role_id => '1',:permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '1',:permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '1',:permission_id => '3'}, :without_protection => true)
Permittable.create({:role_id => '2',:permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '2',:permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '3',:permission_id => '1'}, :without_protection => true)
Permittable.create({:role_id => '3',:permission_id => '2'}, :without_protection => true)
Permittable.create({:role_id => '3',:permission_id => '4'}, :without_protection => true)

# create default values for Priority List (MyTODO :Translation required for values)
PriorityList.create({:name => 'Low'}, :without_protection => true )
PriorityList.create({:name => 'Normal'}, :without_protection => true)
PriorityList.create({:name => 'High'}, :without_protection => true)
PriorityList.create({:name => 'Urgent'}, :without_protection => true)
PriorityList.create({:name => 'Critical'}, :without_protection => true)

# create default statuses (MyTODO :Translation required for values)
Status.create({:name => "New"}, :without_protection => true)
Status.create({:name => "Assigned"}, :without_protection => true)
Status.create({:name => "On Hold"}, :without_protection => true)
Status.create({:name => "Pending"}, :without_protection => true)
Status.create({:name => "Re-Opened"}, :without_protection => true)
Status.create({:name => "Closed"}, :without_protection => true)



