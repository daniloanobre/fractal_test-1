require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should have a valid category' do
    expect(build(:category)).to be_valid
  end

  describe 'validations' do
    it 'a name not void or nil' do
      expect(build(:category, name: '  ')).to_not be_valid
      expect(build(:category, name: nil)).to_not be_valid
    end
  end

  describe 'associations' do
    it "has_and_belongs_to_many products" do
      category = build(:category)
      product = build(:product)
      category.products << product
      expect(category.products.last).to be product
    end
  end
end
