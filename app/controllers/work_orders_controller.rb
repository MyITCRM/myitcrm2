class WorkOrdersController < ApplicationController
filter_resource_access
  # GET /work_orders
  # GET /work_orders.xml
  def index
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
    @work_order = WorkOrder.find(params[:id])


  end

  # GET /work_orders/new
  # GET /work_orders/new.xml
  def new
    @work_order = WorkOrder.new
    @user_id = User.find(params[:clients_id])


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.xml
  def create
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
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to(work_orders_url) }
      format.xml  { head :ok }
    end
  end
end
