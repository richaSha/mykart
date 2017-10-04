class Product < ActiveRecord::Base
  belongs_to :category

  has_many :reviews
  has_many :product_images
  has_many :order, through: :order_items

  has_many :users, through: :cart_items
  has_many :users, through: :reviews
  # has_many :carts, through: :cart_items
end
