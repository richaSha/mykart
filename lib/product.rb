class Product < ActiveRecord::Base
  belongs_to :category

  has_many :reviews
  has_many :product_images

  has_many :orders, through: :items
  has_many :carts, through: :cart_items
end
