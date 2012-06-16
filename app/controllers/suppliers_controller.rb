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


class SuppliersController < ApplicationController
  #  Used by CanCan to restrict controller access
  authorize_resource

  def index
    @title = t "supplier.t_title"
    @supplier = Supplier.all

  end

  def show
    @title = t "supplier.t_view"
    @supplier = Supplier.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @supplier }
    end
  end

  def new
    @title = t "supplier.t_new"
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @supplier }
    end
  end

  def edit

    @supplier = Supplier.find(params[:id])
    @title = (t "supplier.t_edit") +@supplier.company_name.camelcase

  end

  def create
    @title = t "supplier.t_new"
    @supplier = Supplier.new(params[:supplier])
    @supplier.created_by = current_user.username
    @supplier.dynamic_attributes = [:created_by,] if can? :edit, Supplier

    respond_to do |format|
      if @supplier.save
        @title = t "supplier.t_new"
        flash[:notice] = 'Supplier was successfully created.'
        format.html { redirect_to(@supplier) }
        format.xml { render :xml => @supplier, :status => :created, :location => @supplier }
      else
        flash[:notice] = t "global.error"
        format.html { render :action => "new" }
        format.xml { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @title = t "supplier.t_new"


    @supplier = Supplier.find(params[:id])
    @supplier.edited_by = current_user.username
    @supplier.dynamic_attributes = [:active, :credit_terms, :credit_amount, :parts_leadtime_days, :edited_by, :edited_at,] if can? :edit, Supplier

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        flash[:notice] = 'Supplier was successfully updated.'
        format.html { redirect_to(@supplier) }
        format.xml { head :ok }
      else
        flash[:notice] = t "global.error"
        format.html { render :action => "edit" }
        format.xml { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = t "supplier.t_new"
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      flash[:notice] = 'Supplier was successfully deleted.'
      format.html { redirect_to(suppliers_url) }
      format.xml { head :ok }
    end
  end
end
