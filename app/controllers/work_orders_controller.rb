# MyITCRM - Repairs Business CRM Software
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

class WorkOrdersController < ApplicationController
#  Used by CanCan to restrict controller access
  load_and_authorize_resource

#  Used as a starting pint for PDF documents generation.
  prawnto :prawn => {:top_margin => 20}

  def index
    @title = t "workorder.t_workorders"
    @work_orders = WorkOrder.all
    if current_user.client == true

      @new_work_orders = WorkOrder.where("status_id = 1").where('user_id = ?', current_user.id)
      @assigned_work_orders = WorkOrder.where("status_id = 2").where('user_id = ?', current_user.id)
      @on_hold_work_orders = WorkOrder.where("status_id = 3").where('user_id = ?', current_user.id)
      @pending_work_orders = WorkOrder.where("status_id = 4").where('user_id = ?', current_user.id)
      @re_opened_work_orders = WorkOrder.where("status_id = 5").where('user_id = ?', current_user.id)
      @closed_work_orders = WorkOrder.where("status_id = 6").order("closed_date DESC").where('user_id = ?', current_user.id)
    else
    @new_work_orders = WorkOrder.where("status_id = 1" )
    @assigned_work_orders = WorkOrder.where("status_id = 2")
    @on_hold_work_orders = WorkOrder.where("status_id = 3")
    @pending_work_orders = WorkOrder.where("status_id = 4")
    @re_opened_work_orders = WorkOrder.where("status_id = 5")
    @closed_work_orders = WorkOrder.where("status_id = 6").order("closed_date DESC")

    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @work_orders }
    end
  end

  def show
    @title = t "workorder.t_viewing_workorder_details"
    @work_order = WorkOrder.find(params[:id])
    @invoiced = Invoice.find_all_by_work_order_id(params[:id]).first
    @reply = Reply.new(:work_order_id => @work_order.id)
    @replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 4, :page => params[:page])

  end

  def new

    if params[:client_id].present?
    @client = User.find(params[:client_id])
    @title = (t "workorder.creating_wo_for")+@client.name.camelcase
    end
    if params[:client_id].blank? & current_user.employee
      redirect_to clients_url
      flash[:info] = "You MUST select a client first before creating a new Work Order"
    else
    @work_order = WorkOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @work_order }
    end
    end
  end

  def edit
    @title = t "workorder.t_edit"
    @work_order = WorkOrder.find(params[:id])
  end

  def create
    @title = t "workorder.t_workorders"
    respond_to do |format|
      if @work_order.save
        flash[:notice] = 'Work Order was successfully created.'
        format.html { redirect_to(@work_order) }
        format.xml { render :xml => @work_order, :status => :created, :location => @work_order }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    #@invoicing_enabled = true
    invoicing_enabled = true

    if invoicing_enabled.present? and @work_order.closed.present?
       respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'Work Order was successfully updated.'
        format.html { redirect_to( new_work_order_invoice_path(:work_order_id => @work_order.id) ) }
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
    if @work_order.assigned_to_id.blank?
      redirect_to(:back)
      flash[:alert] = "Work Order needs to be assigned to an Employee first before closing."
    #else
    #respond_to do |format|
    #  if @work_order.update_attribute(:status_id, "6")
    #    @work_order.update_attribute(:closed, true)
    #    @work_order.update_attribute(:closed_date, Time.now)
    #    @work_order.update_attribute(:closed_by, current_user.username)
    #    flash[:notice] = 'WorkOrder was successfully Closed.'
    #    format.html { redirect_to( Invoice.new) }
    #    format.xml { head :ok }
    #  else
    #    format.html { render :action => "index" }
    #    format.xml { render :xml => @work_order.errors, :status => :unprocessable_entity }
    #  end
    #end
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
end
