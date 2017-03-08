class Admin::ProductsController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  
  before_action :authenticate_staff!

  def index
    @products = Product.paginate page: params[:page]
  end

  def new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "controllers.admins.product.create_product"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      redirect_to admin_products_path
      flash[:success] = t "controllers.admins.product.update_product"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t "controllers.admins.product.delete_product"
    redirect_to admin_products_path
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :description, :price, :status, :image
  end
end
