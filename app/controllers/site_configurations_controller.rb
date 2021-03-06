class SiteConfigurationsController < ApplicationController
  # GET /site_configurations
  # GET /site_configurations.json
  def index
    @site_configurations = SiteConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_configurations }
    end
  end

  # GET /site_configurations/1
  # GET /site_configurations/1.json
  def show
    @site_configuration = SiteConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_configuration }
    end
  end

  # GET /site_configurations/new
  # GET /site_configurations/new.json
  def new
    @site_configuration = SiteConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_configuration }
    end
  end

  # GET /site_configurations/1/edit
  def edit
    @site_configuration = SiteConfiguration.find(params[:id])
  end

  # POST /site_configurations
  # POST /site_configurations.json
  def create
    @site_configuration = SiteConfiguration.new(params[:site_configuration])

    respond_to do |format|
      if @site_configuration.save
        flash[:success] = "Site configuration was successfully created."
        format.html { redirect_to @site_configuration }
        format.json { render json: @site_configuration, status: :created, location: @site_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @site_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_configurations/1
  # PUT /site_configurations/1.json
  def update
    @site_configuration = SiteConfiguration.find(params[:id])

    respond_to do |format|
      if @site_configuration.update_attributes(params[:site_configuration])
        flash[:success] = "Site configuration was successfully updated."
        format.html { redirect_to @site_configuration }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_configurations/1
  # DELETE /site_configurations/1.json
  def destroy
    @site_configuration = SiteConfiguration.find(params[:id])
    @site_configuration.destroy

    respond_to do |format|
      format.html { redirect_to site_configurations_url }
      format.json { head :no_content }
    end
  end
end
