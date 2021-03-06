class WeightsController < ApplicationController
  load_and_authorize_resource

  # GET /weights
  # GET /weights.json
  def index
    @weights = Weight.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weights }
    end
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
    @weight = Weight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weight }
    end
  end

  # GET /weights/new
  # GET /weights/new.json
  def new
    @weight = Weight.new
    @weight.date = Time.now
    if params.has_key?(:patient_id)
      @weight.patient_id = params[:patient_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weight }
    end
  end

  # GET /weights/1/edit
  def edit
    @weight = Weight.find(params[:id])
  end

  # POST /weights
  # POST /weights.json
  def create
    @weight = Weight.new(params[:weight])

    respond_to do |format|
      if @weight.save
        flash[:success] = "Weight was successfully created."
        format.html { redirect_to @weight }
        format.json { render json: @weight, status: :created, location: @weight }
      else
        format.html { render action: "new" }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weights/1
  # PUT /weights/1.json
  def update
    @weight = Weight.find(params[:id])

    respond_to do |format|
      if @weight.update_attributes(params[:weight])
        flash[:success] = "Weight was successfully updated."
        format.html { redirect_to @weight }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.html { redirect_to weights_url }
      format.json { head :no_content }
    end
  end
end
