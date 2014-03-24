class ConflictIllnessesController < ApplicationController
  load_and_authorize_resource

  # GET /conflict_illnesses
  # GET /conflict_illnesses.json
  def index
    @conflict_illnesses = ConflictIllness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conflict_illnesses }
    end
  end

  # GET /conflict_illnesses/1
  # GET /conflict_illnesses/1.json
  def show
    @conflict_illness = ConflictIllness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conflict_illness }
    end
  end

  # GET /conflict_illnesses/new
  # GET /conflict_illnesses/new.json
  def new
    @conflict_illness = ConflictIllness.new
    if defined? params[:m_id]
      @conflict_illness.medicament_id = params[:m_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conflict_illness }
    end
  end

  # GET /conflict_illnesses/1/edit
  def edit
    @conflict_illness = ConflictIllness.find(params[:id])
  end

  # POST /conflict_illnesses
  # POST /conflict_illnesses.json
  def create
    @conflict_illness = ConflictIllness.new(params[:conflict_illness])

    respond_to do |format|
      if @conflict_illness.save
        flash[:success] = "Conflict with illness was successfully created."
        format.html { redirect_to @conflict_illness}
        format.json { render json: @conflict_illness, status: :created, location: @conflict_illness }
      else
        format.html { render action: "new" }
        format.json { render json: @conflict_illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conflict_illnesses/1
  # PUT /conflict_illnesses/1.json
  def update
    @conflict_illness = ConflictIllness.find(params[:id])

    respond_to do |format|
      if @conflict_illness.update_attributes(params[:conflict_illness])
        flash[:success] = "Conflict with illness was successfully created."
        format.html { redirect_to @conflict_illness }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conflict_illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conflict_illnesses/1
  # DELETE /conflict_illnesses/1.json
  def destroy
    @conflict_illness = ConflictIllness.find(params[:id])
    @conflict_illness.destroy

    respond_to do |format|
      format.html { redirect_to conflict_illnesses_url }
      format.json { head :no_content }
    end
  end
end
