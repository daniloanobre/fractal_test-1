# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name Faker::Name.name
    supplier
    place
    # categories { |a| [a.association(:category)] }
  end
end
