# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  it "should have a valid product" do
    expect(build(:product)).to be_valid
  end

  describe "validations" do
    it "a name not void or nil" do
      expect(build(:product, name: "  ")).to_not be_valid
      expect(build(:product, name: nil)).to_not be_valid
    end
  end

  describe "associations" do
    it "belongs_to supplier" do
      product = build(:product)
      supplier = build(:supplier)
      product.supplier = supplier
      expect(product.supplier).to be supplier
    end

    it "belongs_to place" do
      product = build(:product)
      place = build(:place)
      product.place = place
      expect(product.place).to be place
    end

    it "has_and_belongs_to_many products" do
      product = build(:product)
      category = build(:category)
      product.categories << category
      expect(product.categories.last).to be category
    end
  end
end
