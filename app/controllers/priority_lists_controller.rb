class PriorityListsController < ApplicationController
  # GET /priority_lists
  # GET /priority_lists.xml
  def index
    @priority_lists = PriorityList.all

  end

  # GET /priority_lists/1
  # GET /priority_lists/1.xml
  def show
    @priority_list = PriorityList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @priority_list }
    end
  end

  # GET /priority_lists/new
  # GET /priority_lists/new.xml
  def new
    @priority_list = PriorityList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @priority_list }
    end
  end

  # GET /priority_lists/1/edit
  def edit
    @priority_list = PriorityList.find(params[:id])
  end

  # POST /priority_lists
  # POST /priority_lists.xml
  def create
    @priority_list = PriorityList.new(params[:priority_list])

    respond_to do |format|
      if @priority_list.save
        flash[:notice] = 'PriorityList was successfully created.'
        format.html { redirect_to(@priority_list) }
        format.xml  { render :xml => @priority_list, :status => :created, :location => @priority_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @priority_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /priority_lists/1
  # PUT /priority_lists/1.xml
  def update
    @priority_list = PriorityList.find(params[:id])

    respond_to do |format|
      if @priority_list.update_attributes(params[:priority_list])
        flash[:notice] = 'PriorityList was successfully updated.'
        format.html { redirect_to(@priority_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @priority_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_lists/1
  # DELETE /priority_lists/1.xml
  def destroy
    @priority_list = PriorityList.find(params[:id])
    @priority_list.destroy

    respond_to do |format|
      format.html { redirect_to(priority_lists_url) }
      format.xml  { head :ok }
    end
  end
end
