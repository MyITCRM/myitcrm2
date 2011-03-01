class ProductCategoriesController < ApplicationController
  # GET /product_categories
  # GET /product_categories.xml
  def index
    @product_categories = ProductCategory.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])

  end
=begin

  # GET /product_categories/1
  # GET /product_categories/1.xml
  def show
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_category }
    end
  end

  # GET /product_categories/new
  # GET /product_categories/new.xml
  def new
    @product_category = ProductCategory.new
    @product_categories = ProductCategory.all(:order => "name ASC")
    @product_categories = ProductCategory.paginate :page => params[:page], :order => 'name ASC', :per_page => 15

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_category }
    end
  end

  # GET /product_categories/1/edit
  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  # POST /product_categories
  # POST /product_categories.xml
  def create
    @product_category = ProductCategory.new(params[:product_category])

    respond_to do |format|
      if @product_category.save
        flash[:notice] = 'Product Category was successfully created.'
        format.html { redirect_to(@product_category) }
        format.xml  { render :xml => @product_category, :status => :created, :location => @product_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_categories/1
  # PUT /product_categories/1.xml
  def update
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      if @product_category.update_attributes(params[:product_category])
        flash[:notice] = 'ProductCategory was successfully updated.'
        format.html { redirect_to(@product_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.xml
  def destroy
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy

    respond_to do |format|
      format.html { redirect_to(product_categories_url) }
      format.xml  { head :ok }
    end
  end
=end
end
