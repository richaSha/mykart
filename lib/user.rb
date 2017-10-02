class User  < ActiveRecord::Base
  has_many :addresses
  has_many :reviews
  has_many :cards
  has_many :orders

  belongs_to :cart

  validates(:name, {presence: true})
  validates(:username, {:uniqueness => true, :presence => true})
  validates(:email, {:presence => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } })
  validates(:password, {presence: true, format: {with: /\A([^\s]+)\z/i} })

end