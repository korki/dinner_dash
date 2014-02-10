class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :cart_items, inverse_of: :item
  has_many :carts, through: :cart_items

  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, {:content_type => ['image/jpeg', 'image/jpg', 'image/png']}
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0, :allow_blank => true}

end