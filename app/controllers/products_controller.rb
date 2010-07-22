class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @products = Products.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @products = Products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @products = Products.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1/edit
  def edit
    @products = Products.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @products = Products.new(params[:products])

    respond_to do |format|
      if @products.save
        flash[:notice] = 'Products was successfully created.'
        format.html { redirect_to(@products) }
        format.xml  { render :xml => @products, :status => :created, :location => @products }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @products.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @products = Products.find(params[:id])

    respond_to do |format|
      if @products.update_attributes(params[:products])
        flash[:notice] = 'Products was successfully updated.'
        format.html { redirect_to(@products) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @products.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @products = Products.find(params[:id])
    @products.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
