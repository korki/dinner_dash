class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def statuses
    return ['canceled', 'completed'] if self.status == 'paid'
    return ['canceled', 'paid'] if self.status == 'ordered'
  end


  def changeable?
    return true if self.status == 'paid' || self.status == 'pending'
  end

end