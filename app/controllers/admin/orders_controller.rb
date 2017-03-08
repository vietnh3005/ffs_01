class Admin::OrdersController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  before_action :authenticate_staff!

  def index
    @orders = Order.paginate page: params[:page]
  end

  private
  def staff_params
    params.require(:staff).permit :name, :email, :password, :password_confirmation, :position
  end
end
