class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories

  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, {:content_type => ['image/jpeg', 'image/jpg', 'image/png']}
  validates :name, presence: true, uniqueness: true
end