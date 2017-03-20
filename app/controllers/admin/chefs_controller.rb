class Admin::ChefsController < ApplicationController
  before_action :authenticate_staff!
  layout "staffs_layout"

  def index
    @orders = Order.shop_order(current_staff).waiting_order
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash.now[:success] = t ".update_success"
      redirect_to :back
    else
      flash.now[:danger] = t ".update_fail"
    end
  end

  private
  def order_params
    params.require(:order).permit :status
  end
end
