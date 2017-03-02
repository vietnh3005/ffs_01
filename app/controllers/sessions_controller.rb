class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == Settings.one ? remember(user) : forget(user)
      if current_user.is_admin?
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      flash[:danger] = t ".invalid"
      redirect_to root_path
    end
  end

  def destroy
    if logged_in?
      log_out
      redirect_to root_url
    else
      flash.now[:danger] = t ".not_logged_in"
      redirect_to root_url
    end
  end
end
