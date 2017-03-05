class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:danger] = t ".not_exist"
      redirect_to products_path
    end
  end
end
