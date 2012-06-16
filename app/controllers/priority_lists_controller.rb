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

class PriorityListsController < ApplicationController
   # myTODO - Add cancan auth here and in ability model
   #authorize_resource
   #skip_authorize_resource :only =>  [:index]
  def index
    @title = t 'global.priority_list'
    @priority_lists = PriorityList.all
  end

  def edit
    @title = t 'global.edit_priority_list'
    @priority_list = PriorityList.find(params[:id])
  end

  def update
    @priority_list = PriorityList.find(params[:id])

    respond_to do |format|
      if @priority_list.update_attributes(params[:priority_list])
        flash[:notice] = 'PriorityList was successfully updated.'
        format.html { redirect_to( priority_lists_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @priority_list.errors, :status => :unprocessable_entity }
      end
    end
  end
end
