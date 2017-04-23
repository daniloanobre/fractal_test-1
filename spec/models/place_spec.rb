require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'should have a valid place' do
    expect(build(:place)).to be_valid
  end

  describe 'validations' do
    it 'a hall not void or nil' do
      expect(build(:place, hall: '  ')).to_not be_valid
      expect(build(:place, hall: nil)).to_not be_valid
    end
    it 'a shelf not void' do
      expect(build(:place, shelf: '  ')).to_not be_valid
      expect(build(:place, shelf: nil)).to_not be_valid
    end
  end

  describe 'associations' do
    it "has_many products" do
      place = build(:place)
      product = build(:product)
      place.products << product
      expect(place.products.first).to be product
    end
  end
end
