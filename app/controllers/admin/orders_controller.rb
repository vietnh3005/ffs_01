class Admin::OrdersController < ApplicationController
  before_action :authenticate_staff!
  layout "application_admin"
  load_and_authorize_resource

  def index
    @orders = Order.unassign.paginate page: params[:page], per_page: Settings.pag_pages
    @supports = Supports::Order.new
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash.now[:success] = t ".update_success"
      redirect_to root_path
    else
      flash.now[:danger] = t ".update_fail"
    end
  end

  private
  def order_params
    params.require(:order).permit :shop_id, :status
  end
end
