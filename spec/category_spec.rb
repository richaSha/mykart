require 'spec_helper'

describe 'Category' do
  it 'validates uniqueness of name' do
    category = Category.new({name: "Computers"})
    category.save
    category2 = Category.new({name: "Computers"})
    expect(category2.save).to eq false
  end
end
