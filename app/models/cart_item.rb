class CartItem < ActiveRecord::Base
  has_many :carts 
  has_many :items 
end