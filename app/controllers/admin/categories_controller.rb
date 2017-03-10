class Admin::CategoriesController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource
  
  before_action :authenticate_staff!
  before_action :load_data, only: [:index, :new, :edit]

  def index
    @categories = Category.sort_by_create_at.paginate page: params[:page]
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controllers.admins.product.create_product"
      redirect_to admin_categories_path
    else
      load_data
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      redirect_to admin_categories_path
      flash[:success] = t "controllers.admins.product.update_product"
    else
      load_data
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t "controllers.admins.product.delete_product"
    redirect_to admin_categories_path
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :product_ids
  end

  def load_data
    @supports = Supports::Relationship.new
  end
end
