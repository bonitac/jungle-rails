class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def sold_out
    # if @product.quantity.inspect == 0
    #   puts "sold out"
    # end
    @soldout = Product.find params[:quantity]
    if @soldout
      
    end
    puts @sold_out
  end

end
