class InvoicesController < ApplicationController
  # mytodo - Add full language support.
  # mytodo - Add Mass Assignment restrictions.
  authorize_resource
  # GET /invoices
  # GET /invoices.xml
  def index
    @title = t 'global.invoices'
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @title = "Creating New Invoice"
    @invoice = Invoice.new
    service_invoice_line = @invoice.service_invoice_lines.build
    product_invoice_line = @invoice.product_invoice_lines.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @title = "Edit Invoice"
    @invoice = Invoice.find(params[:id])
    service_invoice_line = @invoice.service_invoice_lines.build
    product_invoice_line = @invoice.product_invoice_lines.build

  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully created.') }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end
  end
