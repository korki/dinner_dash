require 'cart'
require 'item'
require 'cart_item'

class Cart
  class AddItem
    def self.call cart, item, quantity

      cart_item = cart.cart_items.find { |i| i.item_id == item.id }

      if cart_item
        cart_item.quantity += quantity
        cart_item.save!
      else
        cart.cart_items.create do |cart_item|
          cart_item.item     = item
          cart_item.quantity = quantity
        end
      end
    end
  end
end