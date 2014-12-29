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
  #before_filter :find_page, only: [:show]
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pages }
    end
  end

  def show
    @page = Page.find_by_permalink!(params[:id])
  end

  def new
    @title = "Creating New Page"
    @page = Page.new


    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @page }
    end
  end

  def edit
    @title = "Edit Page"
    @page = Page.find_by_permalink!(params[:id])
  end

  def create
    @page = Page.new
    if can? :manage, Page
      @page.user_id = current_user.id
      @page.permalink = params[:permalink] if current_user.employee?

    end

    Page.create(page_params)


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

  def update
    @page = Page.find_by_permalink!(params[:id])
    respond_to do |format|
      if @page.update!(page_params)
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find_by_permalink!(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml { head :ok }
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :content, :page_category_name, :user_id)
  end

  def find_page
    @page = Page.find_by_permalink!(params[:id])
  end

end
