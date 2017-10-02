require 'spec_helper'

describe 'User' do
  it 'validates that username is unique' do
    user = User.new({name: "Bob", username: "Bob1", email: "rey@yahoo.com"})
    user1 = User.new({name: "Smith", username: "Bob1", email: "c@gmail.com"})
    user.save
    expect(user1.save).to eq false
  end

  it "validates presence of username" do
    user = User.new({name: "Bob", email: "rey@yahoo.com"})
    expect(user.save).to eq false
  end

  it 'validates that email is presence' do
    user = User.new({name: "Bob", username: "Smith"})
    expect(user.save).to eq false
  end

  it 'validates that email is format' do
    user = User.new({name: "erleu", username: "Elrey", email: "elrey.dkdkjsn>olss"})
    expect(user.save).to eq false
  end

  it 'validates uniqueness of email' do
    user = User.new({name: "Sam", username: "sam123", email: "sam@yahoo.com", password: 'do245&#{$#{[9;]}}'})
    user.save
    user2 = User.new({name: "Elrey", username: "star123", email: "sam@yahoo.com", password: 'do245&#{$#{[9;]}}'})
    expect(user2.save).to eq false
  end


  it 'validates presence of name' do
    user = User.new({username: "star122", email: "rey@yahoo.com"})
    expect(user.save).to eq false
  end

  it 'validates presence of password' do
    user = User.new({name: "Elrey", username: "star122", email: "rey@yahoo.com"})
    expect(user.save).to eq false
  end

  it 'validates password format' do
    user = User.new({name: "Elrey", username: "star122", email: "rey@yahoo.com", password: "nsf 230509 $@@^$}"})
    expect(user.save).to eq false
  end


  it 'passes validation' do
    user = User.new({name: "Elrey", username: "star122", email: "rey@yahoo.com", password: 'do245&#{$#{[9;]}}'})
    expect(user.save).to eq true
  end

  it 'passes validation' do
    user = User.new({name: "sam smith", username: "sam122", email: "sam2@yahoo.com", password: 'do245&#{$#{[9;]}}'})
    user.save
    expect(user.name).to eq "Sam Smith"
  end
end
