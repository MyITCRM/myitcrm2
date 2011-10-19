# MyIT CRM - Repair's Business CRM Software
# Copyright (C) 2009-2011  Glen Vanderhel
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

class User < ActiveRecord::Base
# This allows/connects the Users to many Work Orders
  has_many :work_orders

# Mass Assignment Protection
  attr_accessible :name, :address, :city, :username, :email, :phone, :state, :zip, :role, :updated_by, :created_by, :password_confirmation, :mobile, :fax, :password, :employee, :client, :workorder_assignability

# Validations for Users
  validates_presence_of :name, :username, :email, :phone
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
#  validates_length_of :password, :password_confirmation
  before_update :define_permissions
  before_create :new_user

# Used to set New Users to defaults
  def new_user
    validates_length_of :password, :password_confirmation, :minimum => 8
    if self.role.blank?
      self.role = "client"
    end
    if self.client.nil?
      self.client = 1
    end
    if self.employee.nil?
      self.employee = 0
    end
  end

#  Used to define permission and roles if they don't exist for this user
  def define_permissions
    if self.role.blank?
      self.role = "client"
    end
    if self.client.nil?
      self.client = 1
    end
    if self.employee.nil?
      self.employee = 0
    end
  end

#  Authlogic GEM - Used to logout/destroy user sessions if they exceed the timeout limit.
  acts_as_authentic do |c|
    c.logged_in_timeout 10.minutes # default is 10 minutes. Change this value and restart server to take effect of new value
 end

# DON'T CHANGE THESE BELOW VALUES OR THERE ORDER UNLESS YOU HAVE BEEN INSTRUCTED TO OR KNOW WHAT YOU ARE DOING.
#
      ROLES = %w[administrator manager technician accountant assistant client]
#      ROLES = %w[client assistant accountant technician manager administrator]
#
# DON'T CHANGE THESE ABOVE VALUES OR THERE ORDER UNLESS YOU HAVE BEEN INSTRUCTED TO OR KNOW WHAT YOU ARE DOING.

  def roles
    User::ROLES.to_a
  end

  def self.search_users(search_users, sort_column, sort_direction)
       User.where().all.order(sort_column+ " "+sort_direction)

  end

  def default_role
     User::ROLES.client
  end

end
