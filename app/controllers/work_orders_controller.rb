class WorkOrdersController < ApplicationController
filter_resource_access
# Only load tinyMCE for the defined methods list
#uses_tiny_mce :only => [:new, :create, :edit, :update]

  def index
    @title = t "workorder.t_workorders"
    @work_orders = WorkOrder.all
    @new_work_orders = WorkOrder.find(:all, :conditions => "status_id = 1")
    @assigned_work_orders = WorkOrder.find(:all, :conditions => "status_id = 2")
    @on_hold_work_orders = WorkOrder.find(:all, :conditions => "status_id = 3")
    @pending_work_orders = WorkOrder.find(:all, :conditions => "status_id = 4")
    @closed_work_orders = WorkOrder.find(:all, :conditions => "status_id = 6")
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_orders }
    end
  end

  # GET /work_orders/1
  # GET /work_orders/1.xml
  def show
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    
#    @assignee = @assigned_user.username


  end

  # GET /work_orders/new
  # GET /work_orders/new.xml
  def new
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.new
    @user_id = User.find(params[:clients_id])


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
    @title = t "workorder.t_workorders"
#    @assigned_user = User.find(:all, :conditions => "roles_mask < 5 " )
#    @assignee = @assigned_user.username
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.xml
  def create
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.new(params[:work_order])

    respond_to do |format|
      if @work_order.save
        flash[:notice] = 'WorkOrder was successfully created.'
        format.html { redirect_to(@work_order) }
        format.xml  { render :xml => @work_order, :status => :created, :location => @work_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.xml
  def update
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'WorkOrder was successfully updated.'
        format.html { redirect_to(@work_order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end
def close
  @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'WorkOrder was successfully Closed.'
        format.html { redirect_to(@work_orders) }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.xml
  def destroy
    @title = t "workorder.t_workorders"
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to(work_orders_url) }
      format.xml  { head :ok }
    end
  end
end
