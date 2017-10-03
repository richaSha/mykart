require 'spec_helper'

describe 'Card' do

  it 'validates the uniqueness of card_no' do
    card = Card.new({user_id: 1, card_no: 1234567, exp_year: 19, exp_month: 12, name_on_card: "Elrey Belmonti"})
    expect(card.save).to eq false
  end

  it 'validates the uniqueness of card_no' do
    card = Card.new({user_id: 1, card_no: 12345678901234567890, exp_year: 19, exp_month: 12, name_on_card: "Elrey Belmonti"})
    expect(card.save).to eq false
  end

  it 'validates the uniqueness of card_no' do
    card = Card.new({user_id: 1, card_no: 12345678, exp_year: 19, exp_month: 12, name_on_card: "Elrey Belmonti"})
    expect(card.save).to eq true
  end
end
