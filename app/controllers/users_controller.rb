class UsersController < ApplicationController
  filter_resource_access

  def new
    @title = t "user.t_new_user"
    @user = User.new
  end

  def index
    @title = t "user.t_title"
    @user = User.all
  end

  def show
    @title = t "user.t_view"
    @user = User.find(params[:id])
  end

  def edit
    @title = t "user.t_edit_user"
    @user = User.find(params[:id])

  end

  def create
    @title = t "user.t_new_user"
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = t "user.flash_new_success"
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  def update
    @title = t "user.t_update_user"
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = t "user.flash_update_user"
      redirect_to users_path

    else
      render :action => "edit"
    end
  end

  def destroy
    @title = t "user.t_delete_user"
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      flash[:notice] = t "user.flash_delete_user"
      format.html { redirect_to(users_url) }

    end
  end
end
