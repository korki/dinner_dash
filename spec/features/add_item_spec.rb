require 'spec_helper'

describe 'Cart::AddItem' do
  it 'adds the item, with a quantity of 1, when the item is not in the cart' do
    cart = Cart.create
    item = Item.new
    Cart::AddItem.call cart, item, 1
    expect(cart.cart_items.first.quantity).to eq 1
  end

  it 'increases the quantity when the item is already in the cart' do
    cart = Cart.create
    item = Item.new
    Cart::AddItem.call cart, item, 1
    Cart::AddItem.call cart, item, 1
    expect(cart.cart_items.first.quantity).to eq 2
  end
end

describe 'Order::AddItem' do
  it 'add items to the order' do
    order = Order.create
    item  = Item.create(:id => 4)
    Order::AddItem.call order, item, 1
    expect(order.order_items.first.quantity).to eq 1
  end
end
