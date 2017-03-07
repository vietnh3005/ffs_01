class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :person, contains: [:user, :staff]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
