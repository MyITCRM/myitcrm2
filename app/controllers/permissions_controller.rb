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

class PermissionsController < ApplicationController
  #skip_authorization_check
  # GET /permissions
  # GET /permissions.json
  def index
    @title = t("role.tab.permissions")
    @permissions = Permission.order(:subject_class).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permissions }
    end
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    @permission = Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permission }
    end
  end

  # GET /permissions/new
  # GET /permissions/new.json
  def new
    @permission = Permission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permission }
    end
  end

  # GET /permissions/1/edit
  def edit
    @title = t("global.editing")+ '-' + t('global.permission')
    @permission = Permission.find(params[:id])
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new
    @permission.dynamic_attributes = [:name, :action, :subject_class, :subject_id] if can? :manage, User

    @permission.attributes = params[:permission]

    respond_to do |format|
      if @permission.save
        format.html { redirect_to permissions_url, notice: 'Permission was successfully created.' }
        format.json { render json: @permission, status: :created, location: @permission }
      else
        format.html { render action: "new" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissions/1
  # PUT /permissions/1.json
  def update
    @permission = Permission.find(params[:id])
    @permission.dynamic_attributes = [:name, :action, :subject_class, :subject_id] if can? :manage, User
    respond_to do |format|
      if @permission.update_attributes(params[:permission])
        format.html { redirect_to permissions_url, notice: 'Permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission = Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
    end
  end
end
