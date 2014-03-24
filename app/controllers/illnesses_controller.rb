class IllnessesController < ApplicationController
  load_and_authorize_resource

  # GET /illnesses
  # GET /illnesses.json

  def index
    @illnesses = Illness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @illnesses }
    end
  end

  # GET /illnesses/1
  # GET /illnesses/1.json
  def show
    @illness = Illness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @illness }
    end
  end

  # GET /illnesses/new
  # GET /illnesses/new.json
  def new
    @illness = Illness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @illness }
    end
  end

  # GET /illnesses/1/edit
  def edit
    @illness = Illness.find(params[:id])
  end

  # POST /illnesses
  # POST /illnesses.json
  def create
    @illness = Illness.new(params[:illness])

    respond_to do |format|
      if @illness.save
        flash[:success] = "Illness was successfully created."
        format.html { redirect_to @illness }
        format.json { render json: @illness, status: :created, location: @illness }
      else
        format.html { render action: "new" }
        format.json { render json: @illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /illnesses/1
  # PUT /illnesses/1.json
  def update
    @illness = Illness.find(params[:id])

    respond_to do |format|
      if @illness.update_attributes(params[:illness])
        flash[:success] = "Illness was successfully updated."
        format.html { redirect_to @illness }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @illness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /illnesses/1
  # DELETE /illnesses/1.json
  def destroy
    @illness = Illness.find(params[:id])
    @illness.destroy

    respond_to do |format|
      format.html { redirect_to illnesses_url }
      format.json { head :no_content }
    end
  end

end
