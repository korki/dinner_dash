
require 'cart/add_item'
require 'order/add_item'
require 'order/create_from_cart'

class CartsController < ApplicationController
  before_action :set_cart

  def show
    puts @cart.items.inspect
    puts @cart.cart_items.inspect
    @cart_view = @cart.cart_items.map do |cart_item|
      cart_view_item = {}
      cart_view_item = {:name => cart_item.item.name, :id => cart_item.item.id, :quantity => cart_item.quantity}
    end    
    puts @cart_view
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
    @cart = Cart.find(1)
    @order = Order::CreateFromCart.call @cart
    @cart.destroy
    redirect_to orders_path
  end

  def set_cart 
    @cart = Cart.find(1)
    puts @cart.cart_items.to_a.inspect
  end

end
