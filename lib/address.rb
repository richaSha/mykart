class Address < ActiveRecord::Base
  belongs_to :user

  validates(:user_id, {presence: true})
  validates(:street, {presence: true})
  validates(:city, {presence: true})
  validates(:state, {presence: true})
  validates(:country, {presence: true})
  validates(:zipcode, {presence: true})


end
