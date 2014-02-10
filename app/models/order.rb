class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  # as this gets more cmplex, switch to an actual state machine
  # like spree does
  def statuses
    return ['canceled', 'completed'] if self.status == 'paid'
    return ['canceled', 'paid'] if self.status == 'ordered'
  end


  def changeable?
    return true if self.status == 'paid' || self.status == 'pending'
  end

end
