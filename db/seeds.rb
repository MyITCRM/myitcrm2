# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

pages = Page.create([{:name => 'home', :content => 'This is the default content for the home page of your MyITCRM installation. This page can only be edited by Administrators of this installation in the pages menu section. The name of this page is "home". Do not change this title, otherwise you will get errors.'}])
