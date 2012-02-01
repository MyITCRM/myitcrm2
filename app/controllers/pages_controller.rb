class PagesController < ApplicationController
   load_and_authorize_resource
# GET /invoices
  # GET /invoices.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
    else
      @page = Page.find(params[:id])
    end


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @title = "Creating New Page for XXXXXXXX"
    @page = Page.new

    #@invoice_line = InvoiceLine

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /invoices/1/edit
  def edit
    @title = "Edit Page"
    @page = Page.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml  { head :ok }
    end
  end
end
