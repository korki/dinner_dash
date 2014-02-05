class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :items_cart
end
