class Item < ActiveRecord::Base    
  has_many :cart_items, inverse_of: :item
  has_many :carts, through: :cart_items
end