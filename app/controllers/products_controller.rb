class ProductsController < ApplicationController
  include CheckOrder
  before_action :check_staff_order, only: [:index, :show]

  def index
    @products = Product.all
    @product = Product.find_by id: params[:id]
  end
end
