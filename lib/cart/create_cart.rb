require 'cart'
require 'item'
require 'cart_item'

class Cart
  class CreateCart
    def self.call (user_id,session_id)
      if session_id.nil?
        cart = Cart.create(user_id: user_id)
      else
        cart = Cart.create(session_id: session_id)
      end
      cart
    end
  end
end
