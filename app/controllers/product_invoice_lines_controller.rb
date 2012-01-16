class ProductInvoiceLinesController < ApplicationController
  # GET /product_invoice_lines
  # GET /product_invoice_lines.xml
  def index
    @product_invoice_lines = ProductInvoiceLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_invoice_lines }
    end
  end

  # GET /product_invoice_lines/1
  # GET /product_invoice_lines/1.xml
  def show
    @product_invoice_line = ProductInvoiceLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_invoice_line }
    end
  end

  # GET /product_invoice_lines/new
  # GET /product_invoice_lines/new.xml
  def new
    @product_invoice_line = ProductInvoiceLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_invoice_line }
    end
  end

  # GET /product_invoice_lines/1/edit
  def edit
    @product_invoice_line = ProductInvoiceLine.find(params[:id])
  end

  # POST /product_invoice_lines
  # POST /product_invoice_lines.xml
  def create
    @product_invoice_line = ProductInvoiceLine.new(params[:product_invoice_line])

    respond_to do |format|
      if @product_invoice_line.save
        format.html { redirect_to(@product_invoice_line, :notice => 'Product invoice line was successfully created.') }
        format.xml  { render :xml => @product_invoice_line, :status => :created, :location => @product_invoice_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_invoice_lines/1
  # PUT /product_invoice_lines/1.xml
  def update
    @product_invoice_line = ProductInvoiceLine.find(params[:id])

    respond_to do |format|
      if @product_invoice_line.update_attributes(params[:product_invoice_line])
        format.html { redirect_to(@product_invoice_line, :notice => 'Product invoice line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_invoice_lines/1
  # DELETE /product_invoice_lines/1.xml
  def destroy
    @product_invoice_line = ProductInvoiceLine.find(params[:id])
    @product_invoice_line.destroy

    respond_to do |format|
      format.html { redirect_to(product_invoice_lines_url) }
      format.xml  { head :ok }
    end
  end
end
