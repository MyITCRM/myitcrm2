class UsersController < ApplicationController
  filter_resource_access
  


  def new
    @title = t "user.t_new_user"
    @user = User.new
  end

  def index
    @title = t "user.t_title"
    @user = User.search(params[:search], params[:page])
 end

   def show
    @title = t "user.t_view"
    if current_user.roles_mask <= 32
    else
      if @user != current_user
        flash[:error] = t "global.restricted"
        redirect_to root_path
      end
    end
  end


  def edit
    @title = t "user.t_edit_user"
  end

  def edit_profile
    @title = t "user.t_edit_user"
    @user = current_user
    
  end

  def update_profile
    @title = t "user.t_update_user"
    if @user.update_attributes(params[:user])
      flash[:notice] = t "user.flash_update_user"
      redirect_to user_path
    else
      render :action => "edit_profile"
    end

  end

 def create
    @title = t "user.t_new_user"
    if @user.save
      flash[:notice] = t "user.flash_new_success"
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  def update
    @title = t "user.t_update_user"
    if @user.update_attributes(params[:user])
      flash[:notice] = t "user.flash_update_user"
      redirect_to user_path

    else
      render :action => "edit"
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
end
