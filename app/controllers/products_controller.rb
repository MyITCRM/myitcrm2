class ProductsController < ApplicationController
  autocomplete :product_category, :name
  helper_method :sort_column, :sort_direction

  #  load_and_authorize_resource

  def index
    @title = t "products.t_title"
#    @products = Product.paginate :page => params[:page], :order => sort_column+ " " +sort_direction, :per_page => 50
    @products = Product.order(:id).page params[:page]
#    @products = Product.search_products(params[:search_products], params[:page], sort_column, sort_direction )

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def show
    @title = t "products.t_title"
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def new
    @title = t "products.t_add_new"
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  def edit
    @title = t "products.t_title"
    @product = Product.find(params[:id])
    
  end

  def create
    @title = t "products.t_title"
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @title = t "products.t_title"
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = t "products.t_title"
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end

  private

  def sort_column
   Product.column_names.include?(params[:sort]) ? params[:sort] : "our_sku"
  end

  def sort_direction
   %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "ASC"
  end
end
  
