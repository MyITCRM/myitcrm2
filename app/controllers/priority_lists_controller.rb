class PriorityListsController < ApplicationController
   # myTODO - Add cancan auth here and in ability model
  def index
    @title = t 'global.priority_list'
    @priority_lists = PriorityList.all
  end

  def edit
    @title = t 'global.edit_priority_list'
    @priority_list = PriorityList.find(params[:id])
  end

  def update
    @priority_list = PriorityList.find(params[:id])

    respond_to do |format|
      if @priority_list.update_attributes(params[:priority_list])
        flash[:notice] = 'PriorityList was successfully updated.'
        format.html { redirect_to( priority_lists_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @priority_list.errors, :status => :unprocessable_entity }
      end
    end
  end
end
