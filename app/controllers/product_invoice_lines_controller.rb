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

class ProductInvoiceLinesController < ApplicationController
  # GET /product_invoice_lines
  # GET /product_invoice_lines.xml
  def index
    @product_invoice_lines = ProductInvoiceLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_invoice_lines }
    end
  end

  # GET /product_invoice_lines/1
  # GET /product_invoice_lines/1.xml
  def show
    @product_invoice_line = ProductInvoiceLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_invoice_line }
    end
  end

  # GET /product_invoice_lines/new
  # GET /product_invoice_lines/new.xml
  def new
    @product_invoice_line = ProductInvoiceLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_invoice_line }
    end
  end

  # GET /product_invoice_lines/1/edit
  def edit
    @product_invoice_line = ProductInvoiceLine.find(params[:id])
  end

  # POST /product_invoice_lines
  # POST /product_invoice_lines.xml
  def create
    @product_invoice_line = ProductInvoiceLine.new(params[:product_invoice_line])

    respond_to do |format|
      if @product_invoice_line.save
        format.html { redirect_to(@product_invoice_line, :notice => 'Product invoice line was successfully created.') }
        format.xml  { render :xml => @product_invoice_line, :status => :created, :location => @product_invoice_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_invoice_lines/1
  # PUT /product_invoice_lines/1.xml
  def update
    @product_invoice_line = ProductInvoiceLine.find(params[:id])

    respond_to do |format|
      if @product_invoice_line.update_attributes(params[:product_invoice_line])
        format.html { redirect_to(@product_invoice_line, :notice => 'Product invoice line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_invoice_lines/1
  # DELETE /product_invoice_lines/1.xml
  def destroy
    @product_invoice_line = ProductInvoiceLine.find(params[:id])
    @product_invoice_line.destroy

    respond_to do |format|
      format.html { redirect_to(product_invoice_lines_url) }
      format.xml  { head :ok }
    end
  end
end
