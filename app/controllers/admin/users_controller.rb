class Admin::UsersController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource

  before_action :authenticate_staff!

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
end
