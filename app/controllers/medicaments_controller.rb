class MedicamentsController < ApplicationController
  load_and_authorize_resource

  # GET /medicaments
  # GET /medicaments.json
  def index
    @medicaments = Medicament.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medicaments }
    end
  end

  # GET /medicaments/1
  # GET /medicaments/1.json
  def show
    @medicament = Medicament.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicament }
    end
  end

  # GET /medicaments/new
  # GET /medicaments/new.json
  def new
    @medicament = Medicament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicament }
    end
  end

  # GET /medicaments/1/edit
  def edit
    @medicament = Medicament.find(params[:id])
  end

  # POST /medicaments
  # POST /medicaments.json
  def create
    @medicament = Medicament.new(params[:medicament])

    respond_to do |format|
      if @medicament.save
        flash[:success] = "Medicament was successfully created."
        format.html { redirect_to @medicament }
        format.json { render json: @medicament, status: :created, location: @medicament }
      else
        format.html { render action: "new" }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medicaments/1
  # PUT /medicaments/1.json
  def update


    @medicament = Medicament.find(params[:id])

    respond_to do |format|
      if @medicament.update_attributes(params[:medicament])

        flash[:success] = "Medicament was successfully updated."
        format.html { redirect_to @medicament}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicaments/1
  # DELETE /medicaments/1.json
  def destroy
    @medicament = Medicament.find(params[:id])
    @medicament.destroy

    respond_to do |format|
      format.html { redirect_to medicaments_url }
      format.json { head :no_content }
    end
  end

end
