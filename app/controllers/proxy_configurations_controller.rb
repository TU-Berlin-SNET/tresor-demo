class ProxyConfigurationsController < ApplicationController
  # GET /proxy_configurations
  # GET /proxy_configurations.json
  def index
    @proxy_configurations = ProxyConfiguration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proxy_configurations }
    end
  end

  # GET /proxy_configurations/1
  # GET /proxy_configurations/1.json
  def show
    @proxy_configuration = ProxyConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proxy_configuration }
    end
  end

  # GET /proxy_configurations/new
  # GET /proxy_configurations/new.json
  def new
    @proxy_configuration = ProxyConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proxy_configuration }
    end
  end

  # GET /proxy_configurations/1/edit
  def edit
    @proxy_configuration = ProxyConfiguration.find(params[:id])
  end

  # POST /proxy_configurations
  # POST /proxy_configurations.json
  def create
    @proxy_configuration = ProxyConfiguration.new(params[:proxy_configuration])

    respond_to do |format|
      if @proxy_configuration.save
        flash[:success] = "Proxy configuration was successfully created."
        format.html { redirect_to @proxy_configuration }
        format.json { render json: @proxy_configuration, status: :created, location: @proxy_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @proxy_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proxy_configurations/1
  # PUT /proxy_configurations/1.json
  def update
    @proxy_configuration = ProxyConfiguration.find(params[:id])

    respond_to do |format|
      if @proxy_configuration.update_attributes(params[:proxy_configuration])
        flash[:success] = "Proxy configuration was successfully updated."
        format.html { redirect_to @proxy_configuration }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proxy_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proxy_configurations/1
  # DELETE /proxy_configurations/1.json
  def destroy
    @proxy_configuration = ProxyConfiguration.find(params[:id])
    @proxy_configuration.destroy

    respond_to do |format|
      format.html { redirect_to proxy_configurations_url }
      format.json { head :no_content }
    end
  end
end
