class MainboardsController < ApplicationController
  # GET /mainboards
  # GET /mainboards.json
  def index
    @mainboards = Mainboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mainboards }
    end
  end

  # GET /mainboards/1
  # GET /mainboards/1.json
  def show
    @mainboard = Mainboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mainboard }
    end
  end

  # GET /mainboards/new
  # GET /mainboards/new.json
  def new
    @mainboard = Mainboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mainboard }
    end
  end

  # GET /mainboards/1/edit
  def edit
    @mainboard = Mainboard.find(params[:id])
  end

  # POST /mainboards
  # POST /mainboards.json
  def create
    @mainboard = Mainboard.new(params[:mainboard])

    respond_to do |format|
      if @mainboard.save
        format.html { redirect_to @mainboard, notice: 'Mainboard was successfully created.' }
        format.json { render json: @mainboard, status: :created, location: @mainboard }
      else
        format.html { render action: "new" }
        format.json { render json: @mainboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mainboards/1
  # PUT /mainboards/1.json
  def update
    @mainboard = Mainboard.find(params[:id])

    respond_to do |format|
      if @mainboard.update_attributes(params[:mainboard])
        format.html { redirect_to @mainboard, notice: 'Mainboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mainboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainboards/1
  # DELETE /mainboards/1.json
  def destroy
    @mainboard = Mainboard.find(params[:id])
    @mainboard.destroy

    respond_to do |format|
      format.html { redirect_to mainboards_url }
      format.json { head :no_content }
    end
  end
end
