class RolesController < ApplicationController
  # filter_resource_access
  def new
    @title = t "role.t_new"

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
     @title = t "role.t_new"
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Role was successfully updated.'
        redirect_to roles_path
      else
        render :action => "edit"
        render :xml => @role.errors, :status => :unprocessable_entity 
      end
    end 

  def show
    @title = t "role.t_view"

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def index
    @title = t "role.t_title"
    @roles = Role.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
