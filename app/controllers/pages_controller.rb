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

class PagesController < ApplicationController
  skip_authorize_resource
  before_filter :find_page, only: [:show, :edit, :update, :destroy]
# GET /invoices
# GET /invoices.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pages }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @title = "Creating New Page"
    @page = Page.new

    #@invoice_line = InvoiceLine

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @page }
    end
  end

  # GET /invoices/1/edit
  def edit
    @title = "Edit Page"
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @page = Page.new
    if can? :manage, WorkOrder
      @page.user_id = current_user.id
      @page.permalink = params[:permalink] if current_user.employee?

    end

    @page.attributes = params[:page]


    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml { head :ok }
    end
  end

  private

  def find_page
    @page = Page.find_by_permalink!(params[:id])
  end
  def home
    if params[:permalink]
      @page = Page.find_by_permalink(params[:id])
    else
      @page = Page.first
    end
  end
end
