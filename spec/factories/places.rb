# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    hall Faker::StarWars.droid
    shelf Faker::StarWars.droid
  end
end
