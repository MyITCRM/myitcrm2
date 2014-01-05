# MyITCRM - Repairs Business CRM Software
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

module UsersHelper

  def active_work_order_count(id = nil)
    status_id = 6
    @active_work_order_count = WorkOrder.where("user_id = ? AND status_id NOT LIKE ?", id, status_id)

  end

  def clients_workorders(id = nil, status_id = nil)
    @clients_workorders = WorkOrder.where('user_id = ? AND status_id = ?', id, status_id)
  end


end
