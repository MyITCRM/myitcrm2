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

class UsersController < ApplicationController
  #  Used by CanCan to restrict controller access
  #load_resource
  authorize_resource
  skip_authorize_resource :only =>  [:register, :create, :edit_profile, :update]
  helper_method :sort_column, :sort_direction


  def new
    @title = t "user.t_new_user"
    @user = User.new

  end


  def index
    @title = t "user.t_title"

    #@clients = User.where('client = 1').where('active = 1').order(:name).page :page

    if params[:deactivate].present?
      flash[:info] = "Please call #{Setting::business_phone} to have you account deactivated"

    end
    if current_user.employee
      @users = User.where('client = 1').order(:name)
    end
    if can? :manage, User
      @users = User.order(:id).paginate(:per_page => 30, :page => params[:page])
    end
      respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @title = t "user.t_view"
    @user = User.find(params[:id]) if current_user.employee and can? :read, User
    @user = User.find(current_user.id) if current_user.client and can? :read, User
  end


  def edit
    @title = t "user.t_edit_user"
    @user = User.find(params[:id])
  end

  def create
    @title = t "user.t_new_user"
    @user = User.new(params[:user])
      @user.dynamic_attributes = [:client, :employee, :workorder_assignability, :role_id] if can? :manage, User


    respond_to do |format|
      if @user.save
        flash[:notice] = t "user.flash_new_success"
        format.html { redirect_to(@user) }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end

  end

  def register
    @title = t "user.t_new_user"
    @user = User.new
     render :action => "register"
  end

  def update
    @title = t "user.t_update_user"

      @user = User.find(params[:id])


    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => (t "user.flash_update_user") ) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = t "user.t_delete_user"
    @user.destroy
    respond_to do |format|
      flash[:notice] = t "user.flash_delete_user"
      format.html { redirect_to(users_url) }
    end
  end

  def edit_profile
    @title = t "user.t_edit_user"
    @user = current_user

  end


  def clients
    @title = t "user.t_clients"
    @users = User.where("client = ?", true).search_users(params[:search_users], sort_column, sort_direction ).paginate(:per_page => 20, :page => params[:page])
    #authorize! :clients, @user
  end
  def employees
    @title = t "user.t_employees"
    @users = User.where("employee = ?", true).search_users(params[:search_users], sort_column, sort_direction ).paginate(:per_page => 20, :page => params[:page])

  end

  private

  def sort_column
   User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
   %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "ASC"
  end
end
