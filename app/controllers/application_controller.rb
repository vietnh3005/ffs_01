class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private
  def current_ability
    @current_ability ||= Ability.new(current_staff)
  end

  def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_out_path_for resource
    new_staff_session_path
  end
end
