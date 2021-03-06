class CartsController < ApplicationController

  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    if Product.find(product_id).quantity==0
    else
      modify_cart_delta(product_id, +1)
    end

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

  def empty? 
    self.id
  end

end