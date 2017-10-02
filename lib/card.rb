class Card < ActiveRecord::Base
  belongs_to :user

  validates(:user_id, { presence: true })
  validates(:card_no, { presence: true, uniqueness: true, length: { minimum: 8, maximum: 19 } })
  validates(:exp_year, { presence: true })
  validates(:exp_month, { presence: true })
  validates(:name_on_card, { presence: true })
end
