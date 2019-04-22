class RatingsController < ApplicationController
  before_action :rating_params, except: [:destroy]
  # before_action :set_product, only: [:create]
  # before_action :set_rating, only: [:destroy]


  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @product = Product.find(params[:product_id])
    @rating=@product.ratings.new(rating_params)
    @rating.user_id = @current_user.id
    if @rating.save
      redirect_to @product , notice:'Review was successfully created'
    else
      redirect_to @product , notice:'Review was not created'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    rating=Rating.find_by(id:params[:rating_id])
    rating.destroy
    redirect_to @product
  end

  private
  
  # def set_product
    # @product = Product.find(params[:product_id])
  # end

  # def set_rating
  #   @rating = Rating.find(params[:id])
  # end

  def rating_params
    params.require(:rating).permit(:rating, :description)
  end
   
end