require 'spec_helper'
require 'cart/add_item'
require 'order/add_item'
require 'order/create_from_cart'

describe 'Cart::AddItem' do
  it 'adds the item, with a quantity of 1, when the item is not in the cart' do
    cart = Cart.create
    item = Item.create(:id => 4)
    Cart::AddItem.call cart, item, 1
    #expect(cart.items.to_a).to eq [item]
    expect(cart.cart_items.first.quantity).to eq 1
  end

  it 'increases the quantity when the item is already in the cart' do
    cart = Cart.create
    item = Item.create(:id => 3)
    # put in lib/cart/add_item.rb
    Cart::AddItem.call cart, item, 1
    Cart::AddItem.call cart, item, 1
    #expect(cart.items.to_a).to eq [item]
    expect(cart.cart_items.first.quantity).to eq 2
  end
end

describe 'Order::AddItem' do
  it 'add items to the order' do
    order = Order.create
    item = Item.create(:id => 4)
    Order::AddItem.call order, item, 1
    expect(order.order_items.first.quantity).to eq 1
  end
end

describe 'Checkout' do
  it 'add item with correct quantity to order' do
    cart = Cart.create
    item = Item.create(:id => 4)
    Cart::AddItem.call cart, item, 1
    order = Order::CreateFromCart.call cart
    expect(order.order_items.first.quantity).to eq cart.cart_items.first.quantity
  end
end

describe 'viewing the cart' do
  let :user do
    User.create(full_name: 'tony', display_name: 'tonyk', email: 't@t.com', password:'password',  password_confirmation:'password') 
  end  
  let(:cart)             { user.cart   } # may or may not exist
  let(:item_in_cart)     { Item.find 1 }
  let(:item_NOT_in_cart) { Item.find 2 }

  before do
    #Cart::AddItem.call(cart, item_in_cart) # doesn't exist at all
  end

  def current_user_is(user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  specify 'A user sees their cart items (possibly other stuff like total?)' do
    pending 'need to connect user with cart'
    current_user_is user
    visit cart_path(cart) # hits /cart
    expect(page.body).to     include item_in_cart.name
    expect(page.body).to_not include item_NOT_in_cart.name
  end

  # I would put this in spec/models/user.rb
  it 'cart start empty' do
    # expect(User.new.cart.items.count).to eq 0
  end
end
