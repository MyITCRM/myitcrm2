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
  attr_accessible :name, :address, :city, :username, :email, :phone, :state, :zip, :role, :updated_by, :created_by,  :password_confirmation, :mobile, :fax, :password

# Validations for Users
  validates_presence_of :name, :address, :city, :username, :email, :phone, :state, :zip
  validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  before_create :new_user

# Used to seNew Users to default to activeve
  def new_user
    if self.role.nil?
      self.role = "client"
      self.client = true
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

end
