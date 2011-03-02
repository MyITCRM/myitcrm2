# MyIT CRM - Repair's Business CRM Software
# Copyright (C) 2009-2010  Glen Vanderhel
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
#  acts_as_authentic
acts_as_authentic do |c|
  c.logged_in_timeout = 10.minutes # default is 10 minutes. Change this value and restart server to take effect of ne value
end

has_many :work_orders
has_one :position
has_many :roles, :through => :position

# Validations for Users
validates_presence_of :name, :address, :city, :username, :email, :phone, :state, :zip
validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
before_create :new_user

# Used to set New Users to default to active

  def new_user
    self.active ||= "1"
    if self.created_by == nil
      self.created_by ||= "0"
    end
  end
 
  def self.search(search, page)
      User.paginate :per_page => 25, :page => page,
                          :conditions => ['name LIKE  ?', "%#{search}%"],
                          :order => 'id'
   end
end
