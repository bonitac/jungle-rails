class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @rating = @product.ratings.new
    @existing1 = @product.ratings.where.not(id:nil)
    @existing= @existing1.all.order(created_at: :desc)
  end

  def sold_out
    @soldout = Product.find params[:quantity]
    if @soldout
    end
    puts @sold_out
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :quantity, :price)
    end

end
