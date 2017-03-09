class Admin::OrdersController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  before_action :authenticate_staff!

  def index
    @orders = Order.unassign.paginate page: params[:page], per_page: Settings.eight
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
    params.require(:order).permit :shop_id, :rec_name, :rec_addr, :rec_phone,
      :status, :total
  end
end
