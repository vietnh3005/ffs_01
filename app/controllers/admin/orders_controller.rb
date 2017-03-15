class Admin::OrdersController < ApplicationController
  before_action :authenticate_staff!
  layout "application_admin"
  load_and_authorize_resource

  def index
    @orders = if params[:assign]
      Order.assign
    elsif params[:unassign]
      Order.unassign
    else
      Order
    end.sort_by_create_at.paginate page: params[:page],
      per_page: Settings.orders_per_page
    @supports = Supports::Order.new
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
    params.require(:order).permit :shop_id, :status
  end
end
