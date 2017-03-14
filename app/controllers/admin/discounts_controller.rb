class Admin::DiscountsController < ApplicationController
  before_action :authenticate_staff!
  load_and_authorize_resource
  layout "application_admin"

  def index
  end

  def new
  end

  def create
    @discount = Discount.new discount_params
    if @discount.save
      flash[:success] = t "controllers.admins.discount.create_discount"
      redirect_to admin_discounts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash.now[:success] = t "controllers.admins.discount.update_success"
      redirect_to admin_orders_path
    else
      flash.now[:danger] = t "controllers.admins.discount.update_fail"
    end
  end

  def destroy
    @discount.destroy
    flash.now[:success] = t "controllers.admins.discount.delete_discount"
    redirect_to :back
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def discount_params
    params.require(:discount).permit :description, :dis_value,
      :date_start, :date_end, :title
  end
end
