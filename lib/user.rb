class User  < ActiveRecord::Base
  has_many :addresses
  has_many :reviews
  has_many :cards
  has_many :orders

  has_many :products, through: :cart_items

  validates(:name, {presence: true})
  validates(:username, {uniqueness: true, presence: true})
  validates(:email, {presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } })
  validates(:password, {presence: true, format: {with: /\A([^\s]+)\z/i, on: :create } })

  before_save(:capitalizes_name)

  private

  def capitalizes_name
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end

end
