class ServiceInvoiceLinesController < ApplicationController
  # GET /service_invoice_lines
  # GET /service_invoice_lines.xml
  def index
    @service_invoice_lines = ServiceInvoiceLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_invoice_lines }
    end
  end

  # GET /service_invoice_line/1
  # GET /service_invoice_line/1.xml
  def show
    @service_invoice_line = ServiceInvoiceLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_invoice_line }
    end
  end

  # GET /service_invoice_line/new
  # GET /service_invoice_line/new.xml
  def new
    @service_invoice_line = ServiceInvoiceLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_invoice_line }
    end
  end

  # GET /service_invoice_line/1/edit
  def edit
    @service_invoice_line = ServiceInvoiceLine.find(params[:id])
  end

  # POST /service_invoice_line
  # POST /service_invoice_line.xml
  def create
    @service_invoice_line = ServiceInvoiceLine.new(params[:service_invoice_line])

    respond_to do |format|
      if @service_invoice_line.save
        format.html { redirect_to(@service_invoice_line, :notice => 'Invoice line was successfully created.') }
        format.xml  { render :xml => @service_invoice_line, :status => :created, :location => @service_invoice_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_invoice_line/1
  # PUT /service_invoice_line/1.xml
  def update
    @service_invoice_line = ServiceInvoiceLine.find(params[:id])

    respond_to do |format|
      if @service_invoice_line.update_attributes(params[:service_invoice_line])
        format.html { redirect_to(@service_invoice_line, :notice => 'Invoice line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_invoice_line/1
  # DELETE /service_invoice_line/1.xml
  def destroy
    @service_invoice_line = ServiceInvoiceLine.find(params[:id])
    @service_invoice_line.destroy

    respond_to do |format|
      format.html { redirect_to(service_invoice_lines_url) }
      format.xml  { head :ok }
    end
  end
end
