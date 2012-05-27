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

class RepliesController < ApplicationController
  before_filter :login_required # User must be logged in first
  authorize_resource  # Used by CanCan to restrict controller access

  def index
    @replies = Reply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.xml
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.xml
  def new
    @reply = Reply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

  # POST /replies
  # POST /replies.xml
  def create
    @reply = Reply.new
    if can? :manage, WorkOrder
      @reply.work_order_id = params[:work_order_id]
      @reply.user_id = current_user.id
      @reply.dynamic_attributes = [:private] if can? :manage, WorkOrder
    end
    @reply.attributes = params[:reply]
    respond_to do |format|
      if @reply.save
        format.html { redirect_to( :back, :notice => 'Reply was successfully created.') }
        format.xml  { render :xml => @reply, :status => :created, :location => @reply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.xml
  def update
    if can? :update, Reply
      @reply = Reply.find(params[:id])
      @reply.work_order_id = params[:id]
      @reply.user_id = current_user.id
      @reply.dynamic_attributes = [:private] if current_user.employee
    end
    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to( work_order_path(@reply.work_order_id), :notice => 'Reply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.xml
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to(:back, :notice => 'Reply was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
