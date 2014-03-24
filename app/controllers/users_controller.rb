class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    session[:sub_delete_return_to] = request.fullpath
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
