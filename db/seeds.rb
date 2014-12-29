# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
I18n.locale = ENV['LOCALE'].nil? ? 'en_AU' : ENV['LOCALE'] # Define locale

# create default administrator account
User.create!({
                 :username => 'admin',
                 :name => 'Company Admin',
                 :email => 'admin@example.com',
                 :password => 'password',
                 :password_confirmation => 'password',
                 :employee => true,
                 :workorder_assignability => true,
                 :client => false,
                 :role_id => '1'})


Role.create({
                :name => I18n.t('seeds.role.super'),
                :enabled => true,
                :list_position => '1'})

Role.create({
                :name => 'Technician',
                :enabled => true,
                :list_position => '2'})

Role.create({
                :name => 'Client',
                :enabled => true,
                :list_position => '3'})

# create default Supplier account
Supplier.create({
                    :company_name => 'Example',
                    :address => 'Unit 4/49 Fake Road',
                    :city => 'Sydney',
                    :state => 'NSW',
                    :zip => '2001',
                    :email => 'purchasing@example.com',
                    :phone => '02 9998 9996',
                    :contact_phone => '02 9998 9996',
                    :contact_name => 'Fred Smith',
                    :fax => '02 9998 9998',
                    :date_created => Time.now,
                    :active => true})

# Adding Some default Permissions to get you started and assigning them to the default Admin account created above.
#
Permission.create({:name => 'Manage Users', :action => 'manage', :subject_class => 'User'})
Permission.create({:name => 'Manage Work Orders', :action => 'manage', :subject_class => 'WorkOrder'})
Permission.create({:name => 'Manage Settings', :action => 'manage', :subject_class => 'Setting'})
Permission.create({:name => 'Update Own Profile', :action => 'update', :subject_class => 'User'})
Permission.create({:name => 'Manage Invoices', :action => 'manage', :subject_class => 'Invoice'})
Permission.create({:name => 'Manage Product Categories', :action => 'manage', :subject_class => 'ProductCategory'})
Permission.create({:name => 'Manage Products', :action => 'manage', :subject_class => 'Product'})
Permission.create({:name => 'View Products', :action => 'view', :subject_class => 'Product'})
Permission.create({:name => 'Manage Replies', :action => 'manage', :subject_class => 'Reply'})
Permission.create({:name => 'Manage Roles', :action => 'manage', :subject_class => 'Role'})
Permission.create({:name => 'Manage Permissions', :action => 'manage', :subject_class => 'Permission'})
Permission.create({:name => 'Manage Service Rates', :action => 'manage', :subject_class => 'ServiceRate'})
Permission.create({:name => 'Manage Suppliers', :action => 'manage', :subject_class => 'Supplier'})

Permittable.create({:role_id => '1', :permission_id => '1'})
Permittable.create({:role_id => '1', :permission_id => '2'})
Permittable.create({:role_id => '1', :permission_id => '3'})
Permittable.create({:role_id => '1', :permission_id => '5'})
Permittable.create({:role_id => '1', :permission_id => '6'})
Permittable.create({:role_id => '1', :permission_id => '7'})
Permittable.create({:role_id => '1', :permission_id => '9'})
Permittable.create({:role_id => '1', :permission_id => '10'})
Permittable.create({:role_id => '1', :permission_id => '11'})
Permittable.create({:role_id => '1', :permission_id => '12'})
Permittable.create({:role_id => '1', :permission_id => '13'})
Permittable.create({:role_id => '2', :permission_id => '1'})
Permittable.create({:role_id => '2', :permission_id => '2'})
Permittable.create({:role_id => '2', :permission_id => '8'})
Permittable.create({:role_id => '3', :permission_id => '1'})
Permittable.create({:role_id => '3', :permission_id => '2'})
Permittable.create({:role_id => '3', :permission_id => '4'})

# create default values for Priority List (MyTODO :Translation required for values)
PriorityList.create({:name => 'Low'})
PriorityList.create({:name => 'Normal'})
PriorityList.create({:name => 'High'})
PriorityList.create({:name => 'Urgent'})
PriorityList.create({:name => 'Critical'})

# create default statuses (MyTODO :Translation required for values)
Status.create({:name => 'New'})
Status.create({:name => 'Assigned'})
Status.create({:name => 'On Hold'})
Status.create({:name => 'Pending'})
Status.create({:name => 'Re-Opened'})
Status.create({:name => 'Closed'})



