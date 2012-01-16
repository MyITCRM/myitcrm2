class SettingsController < ApplicationController
  #  Used by CanCan to restrict controller access
  load_and_authorize_resource

  def index
    @title = "Settings"
        edit
        render :action => 'edit'
  end

  def edit
     @title = "Settings"
     @priority_list = PriorityList.all
    if request.post? && params[:settings] && params[:settings].is_a?(Hash)
      settings = (params[:settings] || {}).dup.symbolize_keys
      settings.each do |name, value|
        # remove blank values in array settings
        value.delete_if {|v| v.blank? } if value.is_a?(Array)
        Setting[name] = value
      end
      flash[:notice] = "All Good!"
      redirect_to :action => 'index'
      return

 end
 end
 end