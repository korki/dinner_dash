require 'order'
require 'cart'
require 'item'
require 'order_item'

class Order
  class CreateFromCart
    def self.call cart
      order = Order.create(user_id: cart.user_id, status: 'ordered')
      cart.cart_items.each do |cart_item|
        Order::AddItem.call order, cart_item.item, cart_item.quantity
      end
      order
    end
  end
end