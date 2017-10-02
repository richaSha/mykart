class User  < ActiveRecord::Base
  has_many :addresses
  has_many :reviews
  has_many :cards
  has_many :orders

  belongs_to :cart

end
