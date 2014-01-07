# MyIT CRM - Repair's Business CRM Software
# Copyright (C) 2009-2014  Glen Vanderhel
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
  has_many :work_orders # MyTODO protection for mass-assignment
  has_many :replies # MyTODO protection for mass-assignment
  belongs_to :role

# Mass Assignment Protection
  attr_accessible :name, :address, :city, :username, :email, :phone, :state, :zip, :updated_by,
                  :created_by, :password_confirmation, :mobile, :fax, :password, :edited_by, :edited_at,
                  :client, :employee, :workorder_assignability, :role_id, :notes, :active

# Validations for Users
  validates_presence_of :name, :username, :email
  validates_uniqueness_of :name, :username, :email
  validates_length_of :password, :password_confirmation, :in => 8..64
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  before_create :new_user

# Used to set New Users defaults
  def new_user
    #validates_length_of :password, :password_confirmation, :minimum => 8
    if self.client.nil?
      self.client = 1
    end
    if self.employee.nil?
      self.employee = 0
    end
    if self.role_id.nil?
      self.role_id = 3
    end
  end


###  Authlogic GEM - Used to logout/destroy user sessions if they exceed the timeout limit.
  acts_as_authentic do |c|
    if Setting::logout_limit?
      time = Setting::idle_time.to_i
      c.logged_in_timeout time.minutes # default is 15 minutes. Change this value and restart server to take effect of new value
    end
  end

  def self.search_users(search_users, sort_column, sort_direction)
    User.where('name LIKE  ?', "%#{search_users}%").order(sort_column+ " "+sort_direction)
  end

end
