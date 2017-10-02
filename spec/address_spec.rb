require 'spec_helper'

describe 'Address' do
  it 'validates zipcode length' do
    address = Address.new({user_id: 1, street: "1020 University St.", city: "Seattle", state: "WA", country: "USA", zipcode: 9810})
    expect(address.save).to eq false
  end

  it 'validates zipcode length' do
    address = Address.new({user_id: 1, street: "1020 University St.", city: "Seattle", state: "WA", country: "USA", zipcode: 981010493983})
    expect(address.save).to eq false
  end

  it 'validates zipcode length' do
    address = Address.new({user_id: 1, street: "1020 University St.", city: "Seattle", state: "WA", country: "USA", zipcode: 98101})
    expect(address.save).to eq true
  end
end
