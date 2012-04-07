# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
# class Page < ActiveRecord::Base; end
#Page.create([{:name => 'home', :content => 'This is the default content for the home page of your MyITCRM installation. This page can only be edited by Administrators of this installation in the pages menu section. The name of this page is "home". Do not change this title, otherwise you will get errors.'}])
Role.find_or_create_by_name(
		:name => 'Super User',
		:enabled => true,
		:list_position => '1'
)
Permission.find_or_create_by_name(
	:name => 'All Permissions',
	:action => :manage,
	:subject_class => :all
)
Permittable.find_or_create_by_role_id(
	:role_id => '1',
	:permission_id => '1'
)
PriorityList.find_or_create_by_name(:name => 'Low')
PriorityList.find_or_create_by_name(:name => 'Normal')
PriorityList.find_or_create_by_name(:name => 'High')
PriorityList.find_or_create_by_name(:name => 'Urgent')
PriorityList.find_or_create_by_name(:name => 'Critical')

class User < ActiveRecord::Base

end
# create default administrator account
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

