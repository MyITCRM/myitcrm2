# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# create default administrator account
class User < ActiveRecord::Base; end
@user = User.find_or_create_by_name(
    :username => "admin",
    :name => "Company Admin",
    :crypted_password => "1b9b040d838f59c16a843e9b49a8cd23a02c3945d27af80dfa68d208712d696a1cf22858cd91b76865869299aa3b4e2bd495cf97532168fddfdb20e59519aa35",
    :password_salt => "3t3Xc_YhQ6AeTlUde-Om",
    :email => "admin@example.net",
    :employee => true,
    :client => false,
    :workorder_assignability => true,
    :role_id => "1"
    )

Role.find_or_create_by_name(
		:name => 'Super User',
		:enabled => true,
		:list_position => '1'
)
# Adding Some default Permissions to get you started and assigning them to the default Admin account created above.
permissions = %w[User - Manage, manage, user, ,
                 Work Order - Manage, manage, WorkOrder, ,
                 Setting - Manage, manage, Setting, ,
                ]
Permission.find_or_create_by_name(permissions)

Permittable.find_or_create_by_role_id(:role_id => '1',:permission_id => '1')
Permittable.find_or_create_by_role_id(:role_id => '1',:permission_id => '2')
Permittable.find_or_create_by_role_id(:role_id => '1',:permission_id => '3')

# create default vaules for Priority List (MyTODO :Translation required for values)
PriorityList.find_or_create_by_name(:name => 'Low')
PriorityList.find_or_create_by_name(:name => 'Normal')
PriorityList.find_or_create_by_name(:name => 'High')
PriorityList.find_or_create_by_name(:name => 'Urgent')
PriorityList.find_or_create_by_name(:name => 'Critical')

# create default statuses (MyTODO :Translation required for values)
Status.find_or_create_by_name(:name => "New")
Status.find_or_create_by_name(:name => "Assigned")
Status.find_or_create_by_name(:name => "On Hold")
Status.find_or_create_by_name(:name => "Pending")
Status.find_or_create_by_name(:name => "Re-Opened")
Status.find_or_create_by_name(:name => "Closed")

