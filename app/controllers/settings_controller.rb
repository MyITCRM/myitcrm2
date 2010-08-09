class SettingsController < ApplicationController
  # GET /settings
  # GET /settings.xml
  def index
    @settings = Settings.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  # GET /settings/1
  # GET /settings/1.xml
  def show
    @settings = Settings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  # GET /settings/new
  # GET /settings/new.xml
  def new
    @settings = Settings.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  # GET /settings/1/edit
  def edit
    @settings = Settings.find(params[:id])
  end

  # POST /settings
  # POST /settings.xml
  def create
    @settings = Settings.new(params[:settings])

    respond_to do |format|
      if @settings.save
        flash[:notice] = 'Settings was successfully created.'
        format.html { redirect_to(@settings) }
        format.xml  { render :xml => @settings, :status => :created, :location => @settings }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @settings.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /settings/1
  # PUT /settings/1.xml
  def update
    @settings = Settings.find(params[:id])

    respond_to do |format|
      if @settings.update_attributes(params[:settings])
        flash[:notice] = 'Settings was successfully updated.'
        format.html { redirect_to(@settings) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @settings.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.xml
  def destroy
    @settings = Settings.find(params[:id])
    @settings.destroy

    respond_to do |format|
      format.html { redirect_to(settings_url) }
      format.xml  { head :ok }
    end
  end
end
