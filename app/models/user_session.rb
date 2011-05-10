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

class UserSession < Authlogic::Session::Base
  logout_on_timeout true
  consecutive_failed_logins_limit 6

def to_key
   new_record? ? nil : [ self.send(self.class.primary_key) ]
end

 
end