class InvoiceLinesController < ApplicationController
  # GET /invoice_lines
  # GET /invoice_lines.xml
  def index
    @invoice_lines = InvoiceLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_lines }
    end
  end

  # GET /invoice_lines/1
  # GET /invoice_lines/1.xml
  def show
    @invoice_line = InvoiceLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_line }
    end
  end

  # GET /invoice_lines/new
  # GET /invoice_lines/new.xml
  def new
    @invoice_line = InvoiceLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_line }
    end
  end

  # GET /invoice_lines/1/edit
  def edit
    @invoice_line = InvoiceLine.find(params[:id])
  end

  # POST /invoice_lines
  # POST /invoice_lines.xml
  def create
    @invoice_line = InvoiceLine.new(params[:invoice_line])

    respond_to do |format|
      if @invoice_line.save
        format.html { redirect_to(@invoice_line, :notice => 'Invoice line was successfully created.') }
        format.xml  { render :xml => @invoice_line, :status => :created, :location => @invoice_line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_lines/1
  # PUT /invoice_lines/1.xml
  def update
    @invoice_line = InvoiceLine.find(params[:id])

    respond_to do |format|
      if @invoice_line.update_attributes(params[:invoice_line])
        format.html { redirect_to(@invoice_line, :notice => 'Invoice line was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_lines/1
  # DELETE /invoice_lines/1.xml
  def destroy
    @invoice_line = InvoiceLine.find(params[:id])
    @invoice_line.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_lines_url) }
      format.xml  { head :ok }
    end
  end
end
