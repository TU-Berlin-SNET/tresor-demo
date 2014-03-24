class BrokerConfigurationsController < ApplicationController
  load_and_authorize_resource

  # GET /broker_configurations
  # GET /broker_configurations.json
  def index
    @broker_configurations = BrokerConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @broker_configurations }
    end
  end

  # GET /broker_configurations/1
  # GET /broker_configurations/1.json
  def show
    @broker_configuration = BrokerConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @broker_configuration }
    end
  end

  # GET /broker_configurations/new
  # GET /broker_configurations/new.json
  def new
    @broker_configuration = BrokerConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @broker_configuration }
    end
  end

  # GET /broker_configurations/1/edit
  def edit
    @broker_configuration = BrokerConfiguration.find(params[:id])
  end

  # POST /broker_configurations
  # POST /broker_configurations.json
  def create
    @broker_configuration = BrokerConfiguration.new(params[:broker_configuration])

    respond_to do |format|
      if @broker_configuration.save
        flash[:success] = "Broker configuration was successfully created."
        format.html { redirect_to @broker_configuration }
        format.json { render json: @broker_configuration, status: :created, location: @broker_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @broker_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /broker_configurations/1
  # PUT /broker_configurations/1.json
  def update
    @broker_configuration = BrokerConfiguration.find(params[:id])

    respond_to do |format|
      if @broker_configuration.update_attributes(params[:broker_configuration])
        flash[:success] = "Broker configuration was successfully updated."
        format.html { redirect_to @broker_configuration }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @broker_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broker_configurations/1
  # DELETE /broker_configurations/1.json
  def destroy
    @broker_configuration = BrokerConfiguration.find(params[:id])
    @broker_configuration.destroy

    respond_to do |format|
      format.html { redirect_to broker_configurations_url }
      format.json { head :no_content }
    end
  end
end
