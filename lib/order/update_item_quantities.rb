require 'order'

class Order
  class UdateItemQuantities
    def self.call(order, params)
      order.order_items.each do |order_item|
        order_item.quantity = params["quantity_#{order_item.id}"]
        order_item.save! # <-- might also be a problem (database transaction for each item)
      end
    end
  end
end
