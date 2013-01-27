# MyITCRM - Repairs Business CRM Software
# Copyright (C) 2009-2012  Glen Vanderhel
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

module WorkOrdersHelper
  def invoice(work_order_id = nil)
   Invoice.where("work_order_id = ?", "#{work_order_id}")
  end

  def replies
    @replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 10, :page => params[:page])
  end

  def tasks
      @tasks = Task.where("work_order_id = ?","#{params[:id]}").order("id DESC")
  end

  def reply
    @reply = Reply.new
  end

    #@invoiced = Invoice.find_all_by_work_order_id(params[:id]).first

    #@replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 4, :page => params[:page])


end
