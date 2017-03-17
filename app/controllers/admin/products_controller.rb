class Admin::ProductsController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  
  before_action :authenticate_staff!
  before_action :load_data, only: [:index, :new, :edit]
  before_action :load_status_product, only: [:new, :edit]

  def index
    @products = Product.sort_by_create_at.paginate page: params[:page]
  end

  def new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "controllers.admins.product.create_product"
      redirect_to admin_products_path
    else
      load_data
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
      load_data
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
  def load_status_product
    @status = Product.statuses.keys
  end

  def product_params
    params.require(:product).permit :name, :description, :price, :status, :image,
      :category_ids
  end

  def load_data
    @supports = Supports::Relationship.new
  end
end
