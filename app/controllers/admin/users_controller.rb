class Admin::UsersController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  before_action :authenticate_staff!
  before_action :find_user, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user.destroy
    flash[:success] = t "controllers.admins.user.delete_user"
    redirect_to admin_users_path
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "controllers.admins.user.user_not_exist"
      redirect_to admin_users_path
    end
  end
end
