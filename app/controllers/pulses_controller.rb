class PulsesController < ApplicationController
  load_and_authorize_resource

  # GET /pulses
  # GET /pulses.json
  def index
    @pulses = Pulse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pulses }
    end
  end

  # GET /pulses/1
  # GET /pulses/1.json
  def show
    @pulse = Pulse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pulse }
    end
  end

  # GET /pulses/new
  # GET /pulses/new.json
  def new
    @pulse = Pulse.new
    @pulse.date = Time.now
    if params.has_key?(:patient_id)
      @pulse.patient_id = params[:patient_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pulse }
    end
  end

  # GET /pulses/1/edit
  def edit
    @pulse = Pulse.find(params[:id])
  end

  # POST /pulses
  # POST /pulses.json
  def create
    @pulse = Pulse.new(params[:pulse])

    respond_to do |format|
      if @pulse.save
        flash[:success] = "Pulse was successfully created."
        format.html { redirect_to @pulse }
        format.json { render json: @pulse, status: :created, location: @pulse }
      else
        format.html { render action: "new" }
        format.json { render json: @pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pulses/1
  # PUT /pulses/1.json
  def update
    @pulse = Pulse.find(params[:id])

    respond_to do |format|
      if @pulse.update_attributes(params[:pulse])
        flash[:success] = "Pulse was successfully updated."
        format.html { redirect_to @pulse }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulses/1
  # DELETE /pulses/1.json
  def destroy
    @pulse = Pulse.find(params[:id])
    @pulse.destroy

    respond_to do |format|
      format.html { redirect_to pulses_url }
      format.json { head :no_content }
    end
  end
end
