class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items, inverse_of: :cart  
  has_many :items, through: :cart_items
end
