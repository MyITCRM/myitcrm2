class SettingsController < ApplicationController
  filter_resource_access

  def index
    @settings = Setting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  def show
    @setting = Setting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  def edit
    @title = t "global.administration"
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Settings was successfully updated.'
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
