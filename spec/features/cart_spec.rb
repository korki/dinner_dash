require 'spec_helper'
require 'cart/add_item'

describe 'Cart::AddItem' do
  it 'adds the item, with a quantity of 1, when the item is not in the cart' do
    cart = Cart.new
    item = Item.new(:id => 4)
    # put in lib/cart/add_item.rb
    Cart::AddItem.call cart, item, 1
    #puts cart.items.inspect

    expect(cart.items.to_a).to eq [item]
    expect(cart.cart_items.first.quantity).to eq 1
  end

  it 'increases the quantity when the item is already in the cart' do
    cart = Cart.new
    item = Item.new(:id => 3)
    # put in lib/cart/add_item.rb
    Cart::AddItem.call cart, item, 1
    Cart::AddItem.call cart, item, 1
    expect(cart.items.to_a).to eq [item]
    expect(cart.cart_items.first.quantity).to eq 2
  end
end

describe 'viewing the cart' do
  let(:user)             { User.first  } # Possibly consider making a User::Create class to do things like give the user their one cart
  let(:cart)             { user.cart   } # may or may not exist
  let(:item_in_cart)     { Item.find 1 }
  let(:item_NOT_in_cart) { Iten.find 2 }

  before do
    #Cart::AddItem.call(cart, item_in_cart) # doesn't exist at all
  end

  def current_user_is(user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  specify 'A user sees their cart items (possibly other stuff like total?)' do
    pending 'need to be able to add an item to the cart'
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
