class SuppliersController < ApplicationController
  filter_resource_access
  

  def index
    @title = t "supplier.t_title"
    @supplier = Supplier.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  # GET /suppliers/1
  # GET /suppliers/1.xml
  def show
    @title = t "supplier.t_view"
    @supplier = Supplier.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  # GET /suppliers/new
  # GET /suppliers/new.xml
  def new
    @title = t "supplier.t_new"
    @supplier = Supplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplier }
    end
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.xml
  def create
    @title = t "supplier.t_new"
    @supplier = Supplier.new(params[:supplier])

    respond_to do |format|
      if @supplier.save
        @title = t "supplier.t_new"
        flash[:notice] = 'Supplier was successfully created.'
        format.html { redirect_to(@supplier) }
        format.xml  { render :xml => @supplier, :status => :created, :location => @supplier }
      else
        flash[:error] = t "global.error"
        format.html { render :action => "new" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suppliers/1
  # PUT /suppliers/1.xml
  def update
    @title = t "supplier.t_new"
    @supplier =Supplier.find(params[:id])

    respond_to do |format|
      if @supplier.update_attributes(params[:supplier])
        flash[:notice] = 'Supplier was successfully updated.'
        format.html { redirect_to(@supplier) }
        format.xml  { head :ok }
      else
        flash[:error] = t "global.error"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.xml
  def destroy
    @title = t "supplier.t_new"
    @supplier.destroy

    respond_to do |format|
      flash[:notice] = 'Supplier was successfully deleted.'
      format.html { redirect_to(suppliers_url) }
      format.xml  { head :ok }
    end
  end
end
