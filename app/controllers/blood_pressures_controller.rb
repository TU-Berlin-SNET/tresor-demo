class BloodPressuresController < ApplicationController
  load_and_authorize_resource

  # GET /blood_pressures
  # GET /blood_pressures.json
  def index
    @blood_pressures = BloodPressure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blood_pressures }
    end
  end

  # GET /blood_pressures/1
  # GET /blood_pressures/1.json
  def show
    @blood_pressure = BloodPressure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blood_pressure }
    end
  end

  # GET /blood_pressures/new
  # GET /blood_pressures/new.json
  def new
    @blood_pressure = BloodPressure.new
    @blood_pressure.date = Time.now
    if params.has_key?(:patient_id)
      @blood_pressure.patient_id = params[:patient_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blood_pressure }
    end
  end

  # GET /blood_pressures/1/edit
  def edit
    @blood_pressure = BloodPressure.find(params[:id])
  end

  # POST /blood_pressures
  # POST /blood_pressures.json
  def create
    @blood_pressure = BloodPressure.new(params[:blood_pressure])

    respond_to do |format|
      if @blood_pressure.save
        flash[:success] = "Blood pressure was successfully created."
        format.html { redirect_to @blood_pressure }
        format.json { render json: @blood_pressure, status: :created, location: @blood_pressure }
      else
        format.html { render action: "new" }
        format.json { render json: @blood_pressure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blood_pressures/1
  # PUT /blood_pressures/1.json
  def update
    @blood_pressure = BloodPressure.find(params[:id])

    respond_to do |format|
      if @blood_pressure.update_attributes(params[:blood_pressure])
        flash[:success] = "Blood pressure was successfully updated."
        format.html { redirect_to @blood_pressure }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blood_pressure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blood_pressures/1
  # DELETE /blood_pressures/1.json
  def destroy
    @blood_pressure = BloodPressure.find(params[:id])
    @blood_pressure.destroy

    respond_to do |format|
      format.html { redirect_to blood_pressures_url }
      format.json { head :no_content }
    end
  end
end
