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

class WorkOrdersController < ApplicationController
  before_filter :login_required # User must be logged in first
  authorize_resource  # Used by CanCan to restrict controller access
  helper_method :sort_column, :sort_direction # Used for sorting columns
  prawnto :prawn => {:top_margin => 20} #  Used as a starting pint for PDF documents generation.

  def index
    @title = t "workorder.t_workorders"
    if current_user.client
      @new_work_orders = WorkOrder.where("status_id = 1 AND user_id = ?", current_user.id)
      @assigned_work_orders = WorkOrder.where("status_id = 2 AND user_id = ?", current_user.id)
      @on_hold_work_orders = WorkOrder.where("status_id = 3 AND user_id = ?", current_user.id)
      @pending_work_orders = WorkOrder.where("status_id = 4 AND user_id = ?", current_user.id)
      @re_opened_work_orders = WorkOrder.where("status_id = 5 AND user_id = ?", current_user.id)
      @closed_work_orders = WorkOrder.where("status_id = 6 AND user_id = ?", current_user.id).order("closed_date DESC")
    elsif can? :manage, WorkOrder
      @new_work_orders = WorkOrder.where("status_id = 1" )
      @assigned_work_orders = WorkOrder.where("status_id = 2")
      @on_hold_work_orders = WorkOrder.where("status_id = 3")
      @pending_work_orders = WorkOrder.where("status_id = 4")
      @re_opened_work_orders = WorkOrder.where("status_id = 5")
      @closed_work_orders = WorkOrder.where("status_id = 6").order("closed_date DESC")
    end
  end

  def show
    @title = t "workorder.t_viewing_workorder_details"
    @work_order = WorkOrder.find(params[:id])
    @invoiced = Invoice.find_all_by_work_order_id(params[:id]).first
    @reply = Reply.new(:work_order_id => @work_order.id)

  end

  def new
    @work_order = WorkOrder.new
    if can? :create, WorkOrder
      if params[:user_id].present? and current_user.client
          @client = User.find(current_user.id)
          @title = (t "workorder.creating_wo_for")+@client.name.camelcase
      else
        if params[:user_id].present? and current_user.employee
          @client = User.find(params[:user_id])
          @title = (t "workorder.creating_wo_for")+@client.name.camelcase
        end
      end
    if params[:user_id].blank? and current_user.employee
      redirect_to clients_url
      flash[:info] = "Please Select a Client first"
    end
  end
  end

  def edit
    @title = t "workorder.t_edit"
    @work_order = WorkOrder.find(params[:id])
  end

  def create
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.new
    if can? :create, WorkOrder
      @work_order.user_id = params[:user_id] if current_user.employee?
      @work_order.user_id = current_user.id if current_user.client?
      @work_order.created_at = Time.now
      @work_order.status_id = 1 # Applies a status of "NEW" by default
      @work_order.closed = 0 # Work Order is not "closed" by default
      @work_order.created_by = current_user.username
    end
    @work_order.attributes = params[:work_order]
    respond_to do |format|
      if @work_order.save
        format.html { redirect_to @work_order, notice: 'Work Order was successfully created.' }
      else
        redirect_to(:back)
      end
    end
  end

  def update
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    @work_order.user_id = current_user.id if current_user.client
    @work_order.edited_by = current_user.username
    @work_order.dynamic_attributes = [:status_id, :resolution, :assigned_to_username, :closed] if can? :manage, WorkOrder
    invoicing_enabled = true

    if invoicing_enabled.present? and @work_order.closed
       respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'Work Order was successfully updated.'
        format.html { redirect_to new_work_order_invoice_path(:work_order_id => @work_order.id)  }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
      end
    else
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'Work Order was successfully updated.'
        format.html { redirect_to(@work_order) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
      end
    end
  end

  def close
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    #@work_order.edited_by = current_user.username
    #@work_order.closed_by = current_user.username
    #@work_order.dynamic_attributes = [:status_id, :resolution, :assigned_to_username, :closed] if can? :manage, WorkOrder
    #invoicing_enabled = true
    if @work_order.assigned_to_id.blank?
      redirect_to(:back)
      flash[:alert] = "Work Order needs to be assigned to an employee first before closing."
      respond_to do |format|
            if @work_order.update_attributes(params[:work_order])
              flash[:notice] = 'Work Order was successfully closed.'
              format.html { redirect_to(@work_order) }
              format.xml { head :ok }
            else
              format.html { render :action => "close" }
              format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
            end
            end
          end
  end

  def assign
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
# Only change status if the status is either NEW or Assigned
    @status = @work_order.status_id = 2 if @work_order.status_id < 3
    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = t "workorder.message_assigned_success"
        format.html { redirect_to(work_orders_url) }
        format.xml { head :ok }
      else
        format.html { render :action => "assign" }
        format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to(work_orders_url) }
      format.xml { head :ok }
    end
  end


   private

  def sort_column
   Product.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
   %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "ASC"
  end
end
