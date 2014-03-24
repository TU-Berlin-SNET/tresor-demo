class ConflictMedsController < ApplicationController
  load_and_authorize_resource

  # GET /conflict_meds
  # GET /conflict_meds.json
  def index
    @conflict_meds = ConflictMed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conflict_meds }
    end
  end

  # GET /conflict_meds/1
  # GET /conflict_meds/1.json
  def show
    @conflict_med = ConflictMed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conflict_med }
    end
  end

  # GET /conflict_meds/new
  # GET /conflict_meds/new.json
  def new
    @conflict_med = ConflictMed.new
    if defined? params[:m_id]
      id = params[:m_id]
      @conflict_med.medicament_id = id
      @paramid = id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conflict_med }
    end
  end

  # GET /conflict_meds/1/edit
  def edit
    @conflict_med = ConflictMed.find(params[:id])
  end

  # POST /conflict_meds
  # POST /conflict_meds.json
  def create
    @conflict_med = ConflictMed.new(params[:conflict_med])

    respond_to do |format|
      if @conflict_med.save
        flash[:success] = "Conflict with medicament was successfully created."
        format.html { redirect_to @conflict_med }
        format.json { render json: @conflict_med, status: :created, location: @conflict_med }
      else
        format.html { render action: "new" }
        format.json { render json: @conflict_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conflict_meds/1
  # PUT /conflict_meds/1.json
  def update
    @conflict_med = ConflictMed.find(params[:id])

    respond_to do |format|
      if @conflict_med.update_attributes(params[:conflict_med])
        flash[:success] = "Conflict with medicament was successfully updated."
        format.html { redirect_to @conflict_med }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conflict_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conflict_meds/1
  # DELETE /conflict_meds/1.json
  def destroy
    @conflict_med = ConflictMed.find(params[:id])
    @conflict_med.destroy

    respond_to do |format|
      format.html { redirect_to conflict_meds_url }
      format.json { head :no_content }
    end
  end
end
