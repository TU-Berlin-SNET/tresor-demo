class SubscriptionsController < ApplicationController
  load_and_authorize_resource

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    session[:sub_delete_return_to] = request.fullpath
    @subscriptions = Subscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subscriptions }
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(params[:subscription])

    if params.has_key?(:new_service_id)
      service = Service.find(params[:new_service_id])
      unless service.nil?
        @subscription.service_id = service.id
        @subscription.costs = service.costs
        @subscription.user_id = current_user.id
      end
    end

    respond_to do |format|
      if @subscription.save
        flash[:success] = "Subscription was successfully created."
        format.html { redirect_to @subscription }
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        unless service.nil?
          format.html { render action: "new" }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        else
          flash[:error] = "Subscription was not successful."
          format.html redirect_to services_path
        end
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  def update
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        flash[:success] = "Subscription was successfully updated."
        format.html { redirect_to @subscription }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html {
        if request.referrer == subscription_url(@subscription)
          redirect_to session[:sub_delete_return_to]
        else
          redirect_to :back
        end
      }
      format.json { head :no_content }
    end
  end
end
