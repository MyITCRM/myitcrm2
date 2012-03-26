class PermittablesController < ApplicationController
  # GET /permittables
  # GET /permittables.json
  def index
    @permittables = Permittable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @permittables }
    end
  end

  # GET /permittables/1
  # GET /permittables/1.json
  def show
    @permittable = Permittable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permittable }
    end
  end

  # GET /permittables/new
  # GET /permittables/new.json
  def new
    @permittable = Permittable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permittable }
    end
  end

  # GET /permittables/1/edit
  def edit
    @permittable = Permittable.find(params[:id])
  end

  # POST /permittables
  # POST /permittables.json
  def create
    @permittable = Permittable.new(params[:permittable])

    respond_to do |format|
      if @permittable.save
        format.html { redirect_to @permittable, notice: 'Permittable was successfully created.' }
        format.json { render json: @permittable, status: :created, location: @permittable }
      else
        format.html { render action: "new" }
        format.json { render json: @permittable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permittables/1
  # PUT /permittables/1.json
  def update
    @permittable = Permittable.find(params[:id])

    respond_to do |format|
      if @permittable.update_attributes(params[:permittable])
        format.html { redirect_to @permittable, notice: 'Permittable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permittable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permittables/1
  # DELETE /permittables/1.json
  def destroy
    @permittable = Permittable.find(params[:id])
    @permittable.destroy

    respond_to do |format|
      format.html { redirect_to permittables_url }
      format.json { head :no_content }
    end
  end
end
