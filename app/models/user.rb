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
  #acts_as_authentic
  acts_as_authentic do |c|
      c.logged_in_timeout = 10.minutes # default is 10 minutes

  end

  has_many :work_orders

# Validations for Users
validates_presence_of :name, :address, :city, :username, :email, :phone, :state, :zip

validates_format_of  :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_create :new_user
  

scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

# Roles_Mask values
  # Admin = 1
  # Manager = 2
  # Tech = 4
  # Accounts = 8
  # Clerk = 16
  # Client = 32
  # Guest = 64

  ROLES = %w[Administrator Manager Technician Accounts Clerk Client guest]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end
# Used to set New Users to default to active

  def new_user
    self.active ||= "1"
    self.roles_mask ||= "32"
    if self.created_by == nil
      self.created_by ||= "0"
    end
  end
 
  def self.search(search, page)
      User.paginate :per_page => 20, :page => page,
                          :conditions => ['name LIKE  ?', "%#{search}%"],
                          :order => 'id'
   end
end
