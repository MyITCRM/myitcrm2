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

module WorkOrdersHelper
  def invoice(work_order_id = nil)
    Invoice.where("work_order_id = ?", "#{work_order_id}")
  end

  def replies
    @replies = Reply.where("work_order_id = ?", "#{params[:id]}").order("id DESC").paginate(:per_page => 10, :page => params[:page])
  end

  def tasks
    @tasks = Task.where("work_order_id = ?", "#{params[:id]}").order("id DESC")
  end

  def reply
    @reply = Reply.new
  end

  def priority_badge(priority_list_id = nil, priority_list_name = nil)
    priority_list_id == priority_list_id.to_i
    if priority_list_id == 1 then
      "<span class='label'>#{priority_list_name}</span>".html_safe
    else
      if priority_list_id == 2 then
        "<span class='label label-info'>#{priority_list_name}</span>".html_safe
      else

        if priority_list_id == 3 then
          "<span class='label label-warning'>#{priority_list_name}</span>".html_safe
        else
          if priority_list_id == 4 then
            "<span class='label label-important'>#{priority_list_name}</span>".html_safe
          else
            if priority_list_id == 5 then
              "<span class='label label-inverse'>#{priority_list_name}</span>".html_safe
            end
          end
        end
      end
    end


  end

  #@invoiced = Invoice.find_all_by_work_order_id(params[:id]).first

  #@replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 4, :page => params[:page])


end
