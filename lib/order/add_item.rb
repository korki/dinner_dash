require 'order'
require 'item'
require 'order_item'

class Order
  class AddItem
    def self.call order, item, quantity

      order_item = order.order_items.find { |i| i.item_id == item.id }

      if order_item
        order_item.quantity += quantity
        order_item.save!
      else
        order.order_items.create do |order_item|
          order_item.item     = item
          order_item.quantity = quantity
        end
      end
    end
  end
end