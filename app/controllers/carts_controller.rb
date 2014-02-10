
require 'cart/add_item'
require 'cart/create_cart'
require 'order/add_item'
require 'order/create_from_cart'

class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_view = @cart.cart_items.map do |cart_item|
      cart_view_item = {:name => cart_item.item.name, :id => cart_item.item.id, :quantity => cart_item.quantity}
    end
  end

  def add
    item = Item.find(params[:item_id])
    Cart::AddItem.call @cart, item, 1
    redirect_to cart_path
  end

  def remove
    item = @cart.cart_items.find_by(item_id: params[:item_id])
    item.destroy
    redirect_to cart_path
  end

  def checkout
    @order = Order::CreateFromCart.call @cart
    @cart.destroy
    redirect_to orders_path
  end

  def set_cart
    # get cart from current user
    # create cart if user has no cart

    if logged_in?
      @cart = Cart.where(user_id: current_user.id).first
      if @cart.nil?
        @cart = Cart::CreateCart.call(current_user.id,nil)
      end
    else
      @cart = Cart.where(session_id: request.session_options[:id]).first
      if @cart.nil?
        @cart = Cart::CreateCart.call(nil,request.session_options[:id])
        # binding.pry
      end
    end



    # puts @cart.cart_items.to_a.inspect
  end

end
