class ServiceRatesController < ApplicationController
  # GET /service_rates
  # GET /service_rates.xml
  def index
    @title = 'Service Rates'
    @service_rates = ServiceRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_rates }
    end
  end

  # GET /service_rates/1
  # GET /service_rates/1.xml
  def show
    @title = 'Service Rate Details'
    @service_rate = ServiceRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_rate }
    end
  end

  # GET /service_rates/new
  # GET /service_rates/new.xml
  def new
    @title = 'Creating New Service Rate'
    @service_rate = ServiceRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_rate }
    end
  end

  # GET /service_rates/1/edit
  def edit
    @title = 'Editing Service Rate'
    @service_rate = ServiceRate.find(params[:id])
  end

  # POST /service_rates
  # POST /service_rates.xml
  def create
    @title = 'Adding New Service Rate'
    @service_rate = ServiceRate.new(params[:service_rate])

    respond_to do |format|
      if @service_rate.save
        format.html { redirect_to(@service_rate, :notice => 'Service rate was successfully created.') }
        format.xml  { render :xml => @service_rate, :status => :created, :location => @service_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_rates/1
  # PUT /service_rates/1.xml
  def update
    @service_rate = ServiceRate.find(params[:id])

    respond_to do |format|
      if @service_rate.update_attributes(params[:service_rate])
        format.html { redirect_to(@service_rate, :notice => 'Service rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_rates/1
  # DELETE /service_rates/1.xml
  def destroy
    @service_rate = ServiceRate.find(params[:id])
    @service_rate.destroy

    respond_to do |format|
      format.html { redirect_to(service_rates_url) }
      format.xml  { head :ok }
    end
  end
end
